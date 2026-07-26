package com.fooddelivery.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooddelivery.dao.MenuDAO;
import com.fooddelivery.model.Cart;
import com.fooddelivery.model.CartItem;
import com.fooddelivery.model.Menu;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    
    @Override
protected void doGet(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session = request.getSession();

    Cart cart = (Cart) session.getAttribute("cart");

    if (cart == null) {
        cart = new Cart();
        session.setAttribute("cart", cart);
    }

    String menuIdParam = request.getParameter("menuId");
    String action = request.getParameter("action");

    // User clicked only "Cart"
    if (menuIdParam == null) {
        response.sendRedirect(request.getContextPath()
                + "/jsp/customer/cart.jsp");
        return;
    }

    int menuId = Integer.parseInt(menuIdParam);

    if ("update".equalsIgnoreCase(action)) {
        String quantityParam = request.getParameter("quantity");
        if (quantityParam != null) {
            int quantity = Integer.parseInt(quantityParam);
            cart.updateQuantity(menuId, quantity);
        }
    } else if ("remove".equalsIgnoreCase(action)) {
        cart.removeItem(menuId);
    } else {
        // default: add item
        MenuDAO menuDAO = new MenuDAO();
        Menu menu = menuDAO.getMenuById(menuId);

        if (menu == null) {
            response.sendRedirect(request.getContextPath()
                    + "/RestaurantServlet");
            return;
        }

        CartItem item = new CartItem(
                menu.getMenuId(),
                menu.getItemName(),
                menu.getPrice(),
                1,
                menu.getImage());

        cart.addItem(item);
    }

    session.setAttribute("cart", cart);

    response.sendRedirect(request.getContextPath()
            + "/jsp/customer/cart.jsp");
} 
}