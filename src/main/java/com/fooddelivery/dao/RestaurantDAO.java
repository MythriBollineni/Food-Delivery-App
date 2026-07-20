package com.fooddelivery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fooddelivery.model.Restaurant;
import com.fooddelivery.util.DBConnection;

public class RestaurantDAO {

    public ArrayList<Restaurant> getAllRestaurants() {

        ArrayList<Restaurant> restaurantList = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM restaurants";

            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Restaurant restaurant = new Restaurant();

                restaurant.setRestaurantId(rs.getInt("restaurant_id"));
                restaurant.setRestaurantName(rs.getString("restaurant_name"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setPhone(rs.getString("phone"));
                restaurant.setRating(rs.getDouble("rating"));
                restaurant.setDeliveryTime(rs.getString("delivery_time"));
                restaurant.setImage(rs.getString("image"));

                restaurantList.add(restaurant);

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return restaurantList;
    }
    
    public boolean addRestaurant(Restaurant restaurant) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO restaurants(restaurant_name,address,phone,rating,delivery_time,image) VALUES(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, restaurant.getRestaurantName());
            ps.setString(2, restaurant.getAddress());
            ps.setString(3, restaurant.getPhone());
            ps.setDouble(4, restaurant.getRating());
            ps.setString(5, restaurant.getDeliveryTime());
            ps.setString(6, restaurant.getImage());

            int rows = ps.executeUpdate();

            if(rows > 0) {
                status = true;
            }

            ps.close();
            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    public Restaurant getRestaurantById(int id) {

        Restaurant restaurant = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM restaurants WHERE restaurant_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                restaurant = new Restaurant();

                restaurant.setRestaurantId(rs.getInt("restaurant_id"));
                restaurant.setRestaurantName(rs.getString("restaurant_name"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setPhone(rs.getString("phone"));
                restaurant.setRating(rs.getDouble("rating"));
                restaurant.setDeliveryTime(rs.getString("delivery_time"));
                restaurant.setImage(rs.getString("image"));

            }

            rs.close();
            ps.close();
            con.close();

        } catch(Exception e){
            e.printStackTrace();
        }

        return restaurant;
    }
    public boolean updateRestaurant(Restaurant restaurant){

        boolean status = false;

        try{

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE restaurants SET restaurant_name=?,address=?,phone=?,rating=?,delivery_time=?,image=? WHERE restaurant_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, restaurant.getRestaurantName());
            ps.setString(2, restaurant.getAddress());
            ps.setString(3, restaurant.getPhone());
            ps.setDouble(4, restaurant.getRating());
            ps.setString(5, restaurant.getDeliveryTime());
            ps.setString(6, restaurant.getImage());
            ps.setInt(7, restaurant.getRestaurantId());

            int rows = ps.executeUpdate();

            if(rows > 0){
                status = true;
            }

            ps.close();
            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
    public boolean deleteRestaurant(int id) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM restaurants WHERE restaurant_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}