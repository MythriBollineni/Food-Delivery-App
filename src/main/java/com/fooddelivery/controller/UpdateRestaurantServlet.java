package com.fooddelivery.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.fooddelivery.dao.RestaurantDAO;
import com.fooddelivery.model.Restaurant;

@WebServlet("/UpdateRestaurantServlet")
public class UpdateRestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Restaurant restaurant = new Restaurant();

        restaurant.setRestaurantId(
                Integer.parseInt(request.getParameter("restaurantId")));

        restaurant.setRestaurantName(request.getParameter("restaurantName"));
        restaurant.setAddress(request.getParameter("address"));
        restaurant.setPhone(request.getParameter("phone"));
        restaurant.setRating(Double.parseDouble(request.getParameter("rating")));
        restaurant.setDeliveryTime(request.getParameter("deliveryTime"));
        restaurant.setImage(request.getParameter("image"));

        RestaurantDAO dao = new RestaurantDAO();

        boolean status = dao.updateRestaurant(restaurant);

        if(status){

            response.sendRedirect(request.getContextPath()
                    + "/AdminRestaurantServlet");

        }else{

            response.getWriter().println("Restaurant Update Failed");

        }

    }
}