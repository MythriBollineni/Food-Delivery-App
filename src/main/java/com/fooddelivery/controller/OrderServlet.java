package com.fooddelivery.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.fooddelivery.dao.OrderDAO;
import com.fooddelivery.dao.OrderItemDAO;
import com.fooddelivery.model.Cart;
import com.fooddelivery.model.CartItem;
import com.fooddelivery.model.Order;
import com.fooddelivery.model.OrderItem;
import com.fooddelivery.model.User;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
    	
    	 System.out.println("Inside OrderServlet doPost()");

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loggedUser");

        Cart cart = (Cart) session.getAttribute("cart");

        if (user == null || cart == null || cart.getItems().isEmpty()) {

            response.sendRedirect("jsp/auth/login.jsp");
            return;
        }

        String paymentMethod = request.getParameter("paymentMethod");
        Order order = new Order();

        order.setUserId(user.getUserId());
        order.setTotalAmount(cart.getGrandTotal());
        order.setOrderStatus("Pending");
        order.setPaymentMethod(paymentMethod);

        OrderDAO orderDAO = new OrderDAO();

        int orderId = orderDAO.placeOrder(order);
        System.out.println("Generated Order ID = " + orderId);

        OrderItemDAO orderItemDAO = new OrderItemDAO();

        for (CartItem cartItem : cart.getItems().values()) {

            System.out.println("Menu ID = " + cartItem.getMenuId());
            System.out.println("Quantity = " + cartItem.getQuantity());
            System.out.println("Price = " + cartItem.getPrice());

            OrderItem item = new OrderItem();

            item.setOrderId(orderId);
            item.setMenuId(cartItem.getMenuId());
            item.setQuantity(cartItem.getQuantity());
            item.setPrice(cartItem.getPrice());

            orderItemDAO.addOrderItem(item);
        }

        session.removeAttribute("cart");

        response.sendRedirect("jsp/customer/orderSuccess.jsp");

    }
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Inside OrderServlet doGet()");
        response.getWriter().println("GET request received");
    }
}