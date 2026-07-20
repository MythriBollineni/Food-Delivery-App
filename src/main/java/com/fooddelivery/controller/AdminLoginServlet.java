package com.fooddelivery.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.fooddelivery.dao.AdminDAO;
import com.fooddelivery.model.Admin;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AdminDAO dao = new AdminDAO();

        Admin admin = dao.login(username, password);

        if(admin != null) {

            HttpSession session = request.getSession();

            session.setAttribute("admin", admin);
            response.sendRedirect(request.getContextPath() + "/DashboardServlet");

        }
        else {

            response.getWriter().println("<h2>Invalid Username or Password</h2>");

        }

    }
}