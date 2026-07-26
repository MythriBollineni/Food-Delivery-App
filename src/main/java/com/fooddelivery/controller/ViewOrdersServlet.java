package com.fooddelivery.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fooddelivery.dao.OrderDAO;   
import com.fooddelivery.model.Order;

@WebServlet("/ViewOrdersServlet")
public class ViewOrdersServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        OrderDAO dao = new OrderDAO();

        ArrayList<Order> orders = dao.getAllOrders();

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("/jsp/admin/ViewOrders.jsp")
               .forward(request, response);
    }
}