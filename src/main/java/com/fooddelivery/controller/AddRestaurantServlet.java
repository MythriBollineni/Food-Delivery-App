package com.fooddelivery.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fooddelivery.dao.RestaurantDAO;
import com.fooddelivery.model.Restaurant;

@WebServlet("/AddRestaurantServlet")
public class AddRestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public AddRestaurantServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Restaurant restaurant = new Restaurant();

            restaurant.setRestaurantName(request.getParameter("restaurantName"));
            restaurant.setAddress(request.getParameter("address"));
            restaurant.setPhone(request.getParameter("phone"));
            restaurant.setRating(Double.parseDouble(request.getParameter("rating")));
            restaurant.setDeliveryTime(request.getParameter("deliveryTime"));
            restaurant.setImage(request.getParameter("image"));

            RestaurantDAO dao = new RestaurantDAO();

            boolean status = dao.addRestaurant(restaurant);

            if (status) {

            	response.sendRedirect(request.getContextPath()
            	        + "/ViewRestaurantsServlet");
            } else {

                response.getWriter().println("<h2>Restaurant Not Added!</h2>");

            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println("<h2>Error : " + e.getMessage() + "</h2>");

        }
    }
}