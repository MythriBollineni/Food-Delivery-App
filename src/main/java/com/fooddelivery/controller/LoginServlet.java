package com.fooddelivery.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.fooddelivery.dao.UserDAO;
import com.fooddelivery.model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();

        User user = dao.loginUser(email, password);

        if(user != null) {

            HttpSession session = request.getSession();

            session.setAttribute("loggedUser", user);

            response.sendRedirect(request.getContextPath() + "/RestaurantServlet");
        } else {

            response.getWriter().println("<h2>Invalid Email or Password</h2>");

        }

    }

}