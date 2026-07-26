package com.fooddelivery.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.fooddelivery.dao.MenuDAO;
import com.fooddelivery.model.Menu;

@WebServlet("/ViewMenuServlet")
public class ViewMenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        MenuDAO dao = new MenuDAO();

        ArrayList<Menu> menuList = dao.getAllMenu();

        request.setAttribute("menuList", menuList);

        request.getRequestDispatcher("/jsp/admin/viewMenu.jsp")
               .forward(request, response);
    }
}