package com.fooddelivery.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.fooddelivery.dao.OrderDAO;
import com.fooddelivery.model.Order;

@WebServlet("/AdminOrderServlet")
public class AdminOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        OrderDAO dao = new OrderDAO();

        ArrayList<Order> orders = dao.getAllOrders();

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("/jsp/admin/viewOrders.jsp")
               .forward(request, response);

    }
}