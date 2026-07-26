package com.fooddelivery.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.fooddelivery.dao.MenuDAO;
import com.fooddelivery.model.Menu;

@WebServlet("/AddMenuServlet")
public class AddMenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Menu menu = new Menu();

        menu.setRestaurantId(
                Integer.parseInt(request.getParameter("restaurantId")));

        menu.setItemName(request.getParameter("itemName"));
        menu.setDescription(request.getParameter("description"));
        menu.setPrice(
                Double.parseDouble(request.getParameter("price")));
        menu.setCategory(request.getParameter("category"));
        menu.setImage(request.getParameter("image"));
        menu.setAvailable(
                Boolean.parseBoolean(request.getParameter("available")));

        MenuDAO dao = new MenuDAO();

        boolean status = dao.addMenu(menu);

        if(status){

            response.sendRedirect(request.getContextPath()
                    + "/jsp/admin/menuAdded.jsp");

        }else{

            response.getWriter().println("<h2>Menu Item Not Added</h2>");

        }

    }
}