package com.fooddelivery.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.fooddelivery.dao.OrderDAO;
import com.fooddelivery.model.Order;

@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

    	int orderId = Integer.parseInt(request.getParameter("id"));
    	System.out.println("Received Order ID = " + orderId);

    	OrderDAO dao = new OrderDAO();

    	Order order = dao.getOrderById(orderId);

    	System.out.println("Order Object = " + order);

    	if(order != null){
    	    System.out.println("Order Found = " + order.getOrderId());
    	}else{
    	    System.out.println("Order is NULL");
    	}

    	request.setAttribute("order", order);

    	request.getRequestDispatcher("/jsp/admin/updateOrderStatus.jsp")
    	       .forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String status = request.getParameter("status");

        System.out.println("Updating Order ID = " + orderId);
        System.out.println("Selected Status = " + status);

        OrderDAO dao = new OrderDAO();

        boolean result = dao.updateOrderStatus(orderId, status);

        System.out.println("Update Result = " + result);

        if(result){

            response.sendRedirect(request.getContextPath()
                    + "/AdminOrderServlet");

        }else{

            response.getWriter().println("Status Update Failed");

        }
    }
}