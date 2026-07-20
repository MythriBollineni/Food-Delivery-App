package com.fooddelivery.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.fooddelivery.dao.MenuDAO;
import com.fooddelivery.model.Menu;

@WebServlet("/EditMenuServlet")
public class EditMenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        MenuDAO dao = new MenuDAO();

        Menu menu = dao.getMenuById(id);

        request.setAttribute("menu", menu);

        request.getRequestDispatcher("/jsp/admin/editMenu.jsp")
               .forward(request, response);
    }
}