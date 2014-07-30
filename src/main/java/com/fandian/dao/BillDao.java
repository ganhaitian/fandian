package com.fandian.dao;

import com.fandian.bean.Bill;
import com.fandian.bean.BillDetail;
import com.fandian.bean.BillStatus;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
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

/**
 * Created by gan on 14-7-22.
 */
@Repository
public class BillDao extends JdbcTemplate {

    @Resource(name = "dataSource")
    private DataSource dataSource;

    @PostConstruct
    public void initDataSource() {
        super.setDataSource(this.dataSource);
    }

    public Bill getCommonBillByUsername(String userName) {
        try {
            return queryForObject("select * from bill where user_name = ? and status = ?",
                BeanPropertyRowMapper.newInstance(Bill.class), userName, BillStatus.COMMON.value());
        } catch (Exception e) {
            return null;
        }
    }

    public Bill getBillById(int billId) {
        try {
            return queryForObject("select * from bill where id = ?", BeanPropertyRowMapper.newInstance(Bill.class), billId);
        } catch (Exception e) {
            return null;
        }
    }

    public void saveNewBill(final Bill bill) {

        KeyHolder keyHolder = new GeneratedKeyHolder();
        update(new PreparedStatementCreator() {
            public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {

                PreparedStatement ps = connection.prepareStatement(
                    "insert into bill (table_no,status,fee,user_name,create_time) values(?,?,?,?,?) ", Statement.RETURN_GENERATED_KEYS);
                ps.setInt(1, bill.getTableNo());
                ps.setInt(2, bill.getStatus());
                ps.setInt(3, bill.getFee());
                ps.setString(4, bill.getUserName());
                ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));

                return ps;
            }
        }, keyHolder);

        int billId = keyHolder.getKey().intValue();
        for (BillDetail billDetail : bill.getBillDetails()) {
            update("insert into bill_detail (bill_id,dish_id,dish_name,amount,price) values(?,?,?,?,?)",
                billId, billDetail.getDishId(), billDetail.getDishName(), billDetail.getAmount(), billDetail.getPrice());
        }
    }

    public List<Bill> getAllBills() {
        List<Bill> bills = query("select * from bill", new BeanPropertyRowMapper<Bill>(Bill.class));
        for (Bill bill : bills) {
            bill.setBillDetails(
                query(
                    "select * from bill_detail where bill_id = ?",
                    new BeanPropertyRowMapper<BillDetail>(BillDetail.class), bill.getId()
                ));
        }
        return bills;
    }

    public void updateStatus(int billId, int newStatus) {
        update("update bill set status = ? where id = ?", newStatus, billId);
    }

    public void updateCheckoutInfo(int billId, int newStatus, float discount, float actualFee, int paymentType,String operator) {
        update("update bill set status = ?,discount = ?,actual_fee = ?,payment_type = ?,operator = ? where id = ?",
            newStatus, discount, actualFee, paymentType,operator,billId);
    }

    public List<BillDetail> getBillDetails(int billId) {
        return query(
            "select * from bill_detail where bill_id = ?",
            new BeanPropertyRowMapper<BillDetail>(BillDetail.class), billId
        );
    }


}
