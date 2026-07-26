package com.fooddelivery.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.fooddelivery.dao.MenuDAO;
import com.fooddelivery.model.Cart;
import com.fooddelivery.model.CartItem;
import com.fooddelivery.model.Menu;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if(cart == null){

            cart = new Cart();

        }

        int menuId =
                Integer.parseInt(request.getParameter("menuId"));

       

        MenuDAO menuDAO = new MenuDAO();

        Menu menu = menuDAO.getMenuById(menuId);

        CartItem item = new CartItem();

        item.setMenuId(menu.getMenuId());
        item.setItemName(menu.getItemName());
        item.setPrice(menu.getPrice());
        item.setQuantity(1);


        cart.addItem(item);

        session.setAttribute("cart", cart);

        request.getRequestDispatcher("/jsp/customer/cart.jsp")
        .forward(request, response);    }

}