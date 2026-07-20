package com.fooddelivery.controller;

import java.io.IOException;

import com.fooddelivery.dao.UserDAO;
import com.fooddelivery.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        User user = new User();

        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);
        user.setAddress(address);
        user.setRole("CUSTOMER");

        UserDAO dao = new UserDAO();

        boolean result = dao.registerUser(user);

        if(result) {
            response.sendRedirect("jsp/auth/login.jsp");
        } else {
            response.getWriter().println("<h2>Registration Failed!</h2>");
        }
    }
}