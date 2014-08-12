package com.fandian.dao;

import com.fandian.bean.Dish;
import com.fandian.bean.DishCategory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.ColumnMapRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * Created by gan on 14-7-21.
 */
@Repository
public class MenuDao extends JdbcTemplate {

    @Resource(name = "dataSource")
    private DataSource dataSource;

    @PostConstruct
    public void initDataSource() {
        super.setDataSource(this.dataSource);
    }

    public DishCategory getDishCategory(int categoryId) {
        return super.queryForObject("select * from dish_category where id=?", new BeanPropertyRowMapper<DishCategory>(DishCategory.class), new Object[] {categoryId});
    }

    public List<DishCategory> getRootDishCategories() {
        List<DishCategory> dishCategories = super.query(
            "select * from dish_category where parent_id=0 order by display_order",
            new BeanPropertyRowMapper<DishCategory>(DishCategory.class)
        );

        return dishCategories;
    }

    public List<DishCategory> getDishCategories() {
        List<DishCategory> dishCategories = getRootDishCategories();
        for (DishCategory category : dishCategories) {

            category.setChildCategories(getChildDishCategories(category.getId()));

        }
        return dishCategories;
    }

    public List<DishCategory> getChildDishCategories(int categoryId) {
        List<DishCategory> dishCategories = super.query(
            "select * from dish_category where parent_id=? order by display_order",
            new BeanPropertyRowMapper<DishCategory>(DishCategory.class), categoryId
        );
        for (DishCategory category : dishCategories) {

            category.setChildCategories(getChildDishCategories(category.getId()));

        }
        return dishCategories;
    }

    public List<Dish> getDishesInCategory(int categoryId) {
        List<Dish> dishes = super.query(
            "select * from dish where category_id = ?",
            new BeanPropertyRowMapper<Dish>(Dish.class),
            categoryId
        );
        return dishes;
    }

    public void updateDish(Dish dish) {
        //查询单位
        Map<String,Object> unit = this.getUnit(dish.getUnitId());

        update("update dish set name = ?,price = ?,stars = ?,detail = ?,weight_code = ?,unit_id = ?,unit_name = ? where id = ?",
            dish.getName(), dish.getPrice(), dish.getStars(), dish.getDetail(),
            dish.getWeightCode(),dish.getUnitId(),unit.get("name"),dish.getId());
        //如果菜的口味不为空，则先删除旧的，再插入新的
        if(!CollectionUtils.isEmpty(dish.getTasteList())){
            deleteDishTasteMap(dish.getId());
            insertDishTasteMap(dish.getId(),dish.getTasteList());
        }
    }

    public void deleteDish(int dishId){
        Dish dish = queryForObject("select * from dish where id=" + dishId, new BeanPropertyRowMapper<Dish>(Dish.class));
        if (dish != null){
            updateDishCategoryDishCount(dish.getCategoryId());
        }
        update("delete from dish where id = ?", dishId);
    }

    public int insertDish(final Dish dish){

        final Map<String,Object> unit = this.getUnit(dish.getUnitId());

        KeyHolder keyHolder = new GeneratedKeyHolder();
        update(new PreparedStatementCreator() {
            public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {

                PreparedStatement ps = connection.prepareStatement(
                    "insert into dish (name,price,stars,detail,category_id,weight_code,unit_id,unit_name) values(?,?,?,?,?,?,?,?) ", Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, dish.getName());
                ps.setInt(2, dish.getPrice());
                ps.setInt(3, dish.getStars());
                ps.setString(4,dish.getDetail());
                ps.setInt(5,dish.getCategoryId());
                ps.setString(6,dish.getWeightCode());
                ps.setInt(7,dish.getUnitId());
                ps.setString(8,unit.get("name").toString());

                return ps;
            }
        }, keyHolder);

        updateDishCategoryDishCount(dish.getCategoryId());
        int dishId = keyHolder.getKey().intValue();

        //如果有口味的话，维护对照表
        if(!CollectionUtils.isEmpty(dish.getTasteList())){
            insertDishTasteMap(dishId,dish.getTasteList());
        }

        return dishId;
    }


    public void insertDishTasteMap(int dishId,List<Integer> tasteList){
        for(Integer tasteId:tasteList){
            update("insert into dish_taste (dish_id,taste_id) values(?,?)",dishId,tasteId);
        }
    }

    public void deleteDishTasteMap(int dishId){
        update("delete from dish_taste where dish_id = ?",dishId);
    }

    public Map<String,Object> getUnit(int unitId){
        return queryForObject("select * from unit where id = ?",new ColumnMapRowMapper(),unitId);
    }

    /**
     * 更新菜品分类的菜品数量统计数据
     * @param categoryId
     */
    public void updateDishCategoryDishCount(int categoryId){
        update("update dish_category set dish_count=(dish_count+1) where id = " + categoryId);
        DishCategory category = getDishCategory(categoryId);
        if (category != null && category.getParentId() != 0){
            updateDishCategoryDishCount(category.getParentId());
        }
    }

    public int insertDishCategory(final DishCategory dishCategory){
        KeyHolder keyHolder = new GeneratedKeyHolder();
        update(new PreparedStatementCreator() {
            public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {

                PreparedStatement ps = connection.prepareStatement(
                    "insert into dish_category (name,parent_id) values(?,?) ", Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, dishCategory.getName());
                ps.setInt(2, dishCategory.getParentId());

                return ps;
            }
        }, keyHolder);

        return keyHolder.getKey().intValue();
    }

    public void updateDishCategory(DishCategory dishCategory){
        update("update dish_category set name = ?,parent_id=? where id = ?",
            dishCategory.getName(),dishCategory.getParentId(),dishCategory.getId());
    }

    public void delDishCategory(int categoryId){
        update("delete from dish_category where id = ?",categoryId);
    }

    public List<Dish> searchDish(String keyWord){
        return query("select * from dish where name like '%"+keyWord+"%' ",BeanPropertyRowMapper.newInstance(Dish.class));
    }

    public void updateDishPicPath(int dishId,String picPath){
        update("update dish set pic_path = ? where id = ?",picPath,dishId);
    }

    public List<Map<String,Object>> getKeywordList(String keyword){
        return query("select * from search_keyword where keyword like '%"+keyword+"%' ",new ColumnMapRowMapper());
    }

    public Map<String,Object> getKeywordById(int keywordId){
        try{
            return queryForObject("select * from search_keyword where id = ?", new ColumnMapRowMapper(), keywordId);
        }catch(Exception e){
            return null;
        }
    }

    public List<Map<String,Object>> getAllUnits(){
        return query("select * from unit",new ColumnMapRowMapper());
    }

    public List<Map<String,Object>> getAllTastes(){
        return query("select * from taste",new ColumnMapRowMapper());
    }

    public List<Map<String,Object>> getAllWeights(){
        return query("select distinct code from weight",new ColumnMapRowMapper());
    }

    public List<String> getSubWeight(String weightCode){
        return queryForList("select name from weight where code = ?",String.class,weightCode);
    }

    public List<Integer> getDishTaste(int dishId) {
        try{
            return queryForList("select taste_id from dish_taste where dish_id = ? ",Integer.class,dishId);
        }catch (Exception e){
            return Collections.emptyList();
        }
    }
}
