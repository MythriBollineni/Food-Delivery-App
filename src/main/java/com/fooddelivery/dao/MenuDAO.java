package com.fooddelivery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fooddelivery.model.Menu;
import com.fooddelivery.util.DBConnection;

public class MenuDAO {

    public ArrayList<Menu> getMenuByRestaurantId(int restaurantId) {

        ArrayList<Menu> menuList = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM menu WHERE restaurant_id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("menu_id"));
                menu.setRestaurantId(rs.getInt("restaurant_id"));
                menu.setItemName(rs.getString("item_name"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setCategory(rs.getString("category"));
                menu.setImage(rs.getString("image"));
                menu.setAvailable(rs.getBoolean("is_available"));

                menuList.add(menu);

            }

            rs.close();
            ps.close();
            con.close();

        } catch(Exception e) {

            e.printStackTrace();

        }

        return menuList;
    }
    
    public Menu getMenuById(int menuId) {

        Menu menu = null;

        try {

            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM menu WHERE menu_id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, menuId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                menu = new Menu();

                menu.setMenuId(rs.getInt("menu_id"));
                menu.setRestaurantId(rs.getInt("restaurant_id"));
                menu.setItemName(rs.getString("item_name"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setCategory(rs.getString("category"));
                menu.setImage(rs.getString("image"));
                menu.setAvailable(rs.getBoolean("is_available"));

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menu;
    }
    
    public boolean addMenu(Menu menu) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO menu(restaurant_id,item_name,description,price,category,image,is_available) VALUES(?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getItemName());
            ps.setString(3, menu.getDescription());
            ps.setDouble(4, menu.getPrice());
            ps.setString(5, menu.getCategory());
            ps.setString(6, menu.getImage());
            ps.setBoolean(7, menu.isAvailable());

            int rows = ps.executeUpdate();

            if(rows > 0){
                status = true;
            }

            ps.close();
            con.close();

        } catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
    
    public ArrayList<Menu> getAllMenu() {

        ArrayList<Menu> menuList = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM menu";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("menu_id"));
                menu.setRestaurantId(rs.getInt("restaurant_id"));
                menu.setItemName(rs.getString("item_name"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setCategory(rs.getString("category"));
                menu.setImage(rs.getString("image"));
                menu.setAvailable(rs.getBoolean("is_available"));

                menuList.add(menu);

            }

            rs.close();
            ps.close();
            con.close();

        } catch(Exception e){
            e.printStackTrace();
        }

        return menuList;
    }
    
    public boolean updateMenu(Menu menu){

        boolean status=false;

        try{

            Connection con=DBConnection.getConnection();

            String sql="UPDATE menu SET restaurant_id=?,item_name=?,description=?,price=?,category=?,image=?,is_available=? WHERE menu_id=?";

            PreparedStatement ps=con.prepareStatement(sql);

            ps.setInt(1,menu.getRestaurantId());
            ps.setString(2,menu.getItemName());
            ps.setString(3,menu.getDescription());
            ps.setDouble(4,menu.getPrice());
            ps.setString(5,menu.getCategory());
            ps.setString(6,menu.getImage());
            ps.setBoolean(7,menu.isAvailable());
            ps.setInt(8,menu.getMenuId());

            status=ps.executeUpdate()>0;

            ps.close();
            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }

}