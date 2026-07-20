package com.fooddelivery.dao;

import java.sql.Connection;

import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.fooddelivery.model.Order;
import com.fooddelivery.util.DBConnection;

public class OrderDAO {

    public int placeOrder(Order order) {

        int orderId = 0;

        try {

            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO orders(user_id,total_amount,order_status,payment_method) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, order.getUserId());
            ps.setDouble(2, order.getTotalAmount());
            ps.setString(3, order.getOrderStatus());
            ps.setString(4, order.getPaymentMethod());

            int rows = ps.executeUpdate();

            if (rows > 0) {

                ResultSet rs = ps.getGeneratedKeys();

                if (rs.next()) {
                    orderId = rs.getInt(1);
                }

                rs.close();
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderId;
    }
    
    public ArrayList<Order> getOrdersByUserId(int userId) {

        ArrayList<Order> orders = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM orders WHERE user_id=? ORDER BY order_date DESC";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Order order = new Order();

                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setOrderStatus(rs.getString("order_status"));
                order.setPaymentMethod(rs.getString("payment_method"));
                order.setOrderDate(rs.getTimestamp("order_date"));

                orders.add(order);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }
    
    public ArrayList<Order> getAllOrders(){

        ArrayList<Order> orderList = new ArrayList<>();

        try{

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM orders ORDER BY order_date DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Order order = new Order();

                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setOrderStatus(rs.getString("order_status"));
                order.setPaymentMethod(rs.getString("payment_method"));
                order.setOrderDate(rs.getTimestamp("order_date"));

                orderList.add(order);

            }

            rs.close();
            ps.close();
            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return orderList;
    }
    
    public Order getOrderById(int orderId){

        Order order = null;

        try{

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM orders WHERE order_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                order = new Order();

                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setOrderStatus(rs.getString("order_status"));
                order.setPaymentMethod(rs.getString("payment_method"));
                order.setOrderDate(rs.getTimestamp("order_date"));

            }

            rs.close();
            ps.close();
            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return order;
    }
    
    public boolean updateOrderStatus(int orderId,String status){

        boolean result=false;

        try{

            Connection con=DBConnection.getConnection();

            String sql="UPDATE orders SET order_status=? WHERE order_id=?";

            PreparedStatement ps=con.prepareStatement(sql);

            ps.setString(1,status);
            ps.setInt(2,orderId);

            result=ps.executeUpdate()>0;

            ps.close();
            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return result;
    }
}