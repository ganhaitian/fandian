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

    public List<DishCategory> getDishCategories() {
        List<DishCategory> dishCategories = super.query(
            "select * from dish_category",
            new BeanPropertyRowMapper<DishCategory>(DishCategory.class)
        );
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