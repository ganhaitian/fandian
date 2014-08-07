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

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.*;
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
            "select * from dish_category where parent_id=0",
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
            "select * from dish_category where parent_id=?",
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
        update("update dish set name = ?,price = ?,stars = ?,detail = ? where id = ?",
            dish.getName(), dish.getPrice(), dish.getStars(), dish.getDetail(), dish.getId());
    }

    public void deleteDish(int dishId){
        Dish dish = queryForObject("select * from dish where id="+dishId, new BeanPropertyRowMapper<Dish>(Dish.class));
        if (dish != null){
            updateDishCategoryDishCount(dish.getCategoryId());
        }
        update("delete from dish where id = ?", dishId);
    }

    public int insertDish(final Dish dish){
        KeyHolder keyHolder = new GeneratedKeyHolder();
        update(new PreparedStatementCreator() {
            public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {

                PreparedStatement ps = connection.prepareStatement(
                    "insert into dish (name,price,stars,detail,category_id) values(?,?,?,?,?) ", Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, dish.getName());
                ps.setInt(2, dish.getPrice());
                ps.setInt(3, dish.getStars());
                ps.setString(4,dish.getDetail());
                ps.setInt(5,dish.getCategoryId());

                return ps;
            }
        }, keyHolder);

        updateDishCategoryDishCount(dish.getCategoryId());

        return keyHolder.getKey().intValue();
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

}
