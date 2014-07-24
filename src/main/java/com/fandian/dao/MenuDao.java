package com.fandian.dao;

import com.fandian.bean.Dish;
import com.fandian.bean.DishCategory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.List;

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

    public DishCategory getDishCategory(int categoryId){
        return super.queryForObject("select * from dish_category where id=?",new BeanPropertyRowMapper<DishCategory>(DishCategory.class), new Object[]{categoryId});
    }

    public List<DishCategory> getDishCategories() {
        List<DishCategory> dishCategories = super.query(
                "select * from dish_category where parent_id=0",
                new BeanPropertyRowMapper<DishCategory>(DishCategory.class)
        );
        for (DishCategory category : dishCategories){

            category.setChildCategories(getChildDishCategories(category.getId()));

        }
        return dishCategories;
    }

    public List<DishCategory> getChildDishCategories(int categoryId){
        List<DishCategory> dishCategories = super.query(
                "select * from dish_category where parent_id=?",
                new BeanPropertyRowMapper<DishCategory>(DishCategory.class),categoryId
        );
        for (DishCategory category : dishCategories){

            category.setChildCategories(getChildDishCategories(category.getId()));

        }
        return dishCategories;
    }

    public List<Dish> getDishesInCategory(int categoryId){
        List<Dish> dishes = super.query(
            "select * from dish where category_id = ?",
            new BeanPropertyRowMapper<Dish>(Dish.class),
            categoryId
        );
        return dishes;
    }


}
