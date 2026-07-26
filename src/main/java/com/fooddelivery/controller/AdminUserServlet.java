package com.fooddelivery.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.fooddelivery.dao.UserDAO;
import com.fooddelivery.model.User;

@WebServlet("/AdminUserServlet")
public class AdminUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO dao = new UserDAO();

        ArrayList<User> users = dao.getAllUsers();

        request.setAttribute("users", users);

        request.getRequestDispatcher("/jsp/admin/viewCustomers.jsp")
               .forward(request, response);
    }
}