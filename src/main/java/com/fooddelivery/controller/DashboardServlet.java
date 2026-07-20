package com.fooddelivery.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooddelivery.dao.DashboardDAO;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        DashboardDAO dao = new DashboardDAO();

        request.setAttribute("restaurantCount", dao.getRestaurantCount());
        request.setAttribute("menuCount", dao.getMenuCount());
        request.setAttribute("orderCount", dao.getOrderCount());
        request.setAttribute("revenue", dao.getRevenue());
        request.setAttribute("userCount", dao.getUserCount());

        request.getRequestDispatcher("/jsp/admin/dashboard.jsp")
               .forward(request, response);
    }
}