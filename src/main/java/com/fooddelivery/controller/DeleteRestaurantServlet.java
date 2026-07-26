package com.fooddelivery.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fooddelivery.dao.RestaurantDAO;

@WebServlet("/DeleteRestaurantServlet")
public class DeleteRestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        RestaurantDAO dao = new RestaurantDAO();

        boolean status = dao.deleteRestaurant(id);

        if (status) {

            response.sendRedirect(request.getContextPath()
                    + "/AdminRestaurantServlet");

        } else {

            response.getWriter().println("<h2>Restaurant Deletion Failed</h2>");

        }
    }
}