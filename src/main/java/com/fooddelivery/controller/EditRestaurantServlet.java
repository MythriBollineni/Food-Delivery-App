package com.fooddelivery.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.fooddelivery.dao.RestaurantDAO;
import com.fooddelivery.model.Restaurant;

@WebServlet("/EditRestaurantServlet")
public class EditRestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        RestaurantDAO dao = new RestaurantDAO();

        Restaurant restaurant = dao.getRestaurantById(id);

        request.setAttribute("restaurant", restaurant);

        request.getRequestDispatcher("/jsp/admin/editRestaurant.jsp")
               .forward(request, response);
    }
}