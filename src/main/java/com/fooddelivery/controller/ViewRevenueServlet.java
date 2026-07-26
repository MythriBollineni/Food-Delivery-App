package com.fooddelivery.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fooddelivery.dao.AdminDAO;

@WebServlet("/ViewRevenueServlet")
public class ViewRevenueServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        AdminDAO dao = new AdminDAO();

        double revenue = dao.getTotalRevenue();
        int orderCount = dao.getOrderCount();

        request.setAttribute("revenue", revenue);
        request.setAttribute("orderCount", orderCount);

        request.getRequestDispatcher("/jsp/admin/revenue.jsp")
               .forward(request, response);
    }
}