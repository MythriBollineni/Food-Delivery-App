package com.fooddelivery.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.fooddelivery.dao.MenuDAO;
import com.fooddelivery.model.Menu;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

    	int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));

    	System.out.println("Restaurant ID = " + restaurantId);

    	MenuDAO dao = new MenuDAO();

    	ArrayList<Menu> menuList = dao.getMenuByRestaurantId(restaurantId);

    	System.out.println("Menu List Size = " + menuList.size());

    	request.setAttribute("menuList", menuList);

    	request.getRequestDispatcher("jsp/customer/Menu.jsp").forward(request, response);
    }

}