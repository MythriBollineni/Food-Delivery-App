package com.fooddelivery.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.fooddelivery.dao.RestaurantDAO;
import com.fooddelivery.model.Restaurant;

@WebServlet("/AdminRestaurantServlet")
public class AdminRestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        RestaurantDAO dao = new RestaurantDAO();

        ArrayList<Restaurant> restaurants = dao.getAllRestaurants();

        request.setAttribute("restaurants", restaurants);

        request.getRequestDispatcher("/jsp/admin/viewRestaurants.jsp")
               .forward(request, response);
    }
}