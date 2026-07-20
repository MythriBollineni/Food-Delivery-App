package com.fooddelivery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.fooddelivery.model.OrderItem;
import com.fooddelivery.util.DBConnection;

public class OrderItemDAO {

    public void addOrderItem(OrderItem item) {

        try {

            Connection con = DBConnection.getConnection();

            String query =
            "INSERT INTO order_items(order_id,menu_id,quantity,price) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, item.getOrderId());
            ps.setInt(2, item.getMenuId());
            ps.setInt(3, item.getQuantity());
            ps.setDouble(4, item.getPrice());

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

}