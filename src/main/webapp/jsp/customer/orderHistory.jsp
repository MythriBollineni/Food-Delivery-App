<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fooddelivery.model.Order" %>
<%@ page import="com.fooddelivery.model.User" %>

<%
ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
User loggedUser = (User) session.getAttribute("loggedUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Orders - FoodNest</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/orderHistory.css">
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/jsp/customer/home.jsp" class="logo">
            <i class="fa-solid fa-bowl-food"></i> FoodNest
        </a>

        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/jsp/customer/home.jsp"><i class="fa-solid fa-house"></i> Home</a></li>
            <li><a href="${pageContext.request.contextPath}/RestaurantServlet"><i class="fa-solid fa-utensils"></i> Restaurants</a></li>
            <li><a href="${pageContext.request.contextPath}/CartServlet"><i class="fa-solid fa-cart-shopping"></i> Cart</a></li>
            <% if (loggedUser != null) { %>
                <li><a href="${pageContext.request.contextPath}/OrderHistoryServlet"><i class="fa-solid fa-receipt"></i> Orders</a></li>
                <li class="user-badge"><i class="fa-solid fa-user"></i> Hi, <%= loggedUser.getName() %></li>
                <li><a href="${pageContext.request.contextPath}/LogoutServlet"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
            <% } else { %>
                <li><a href="${pageContext.request.contextPath}/jsp/auth/login.jsp"><i class="fa-solid fa-right-to-bracket"></i> Login</a></li>
            <% } %>
        </ul>
    </nav>

    <h1 class="order-title">My Orders</h1>

    <div class="order-container">
        <% if(orders == null || orders.isEmpty()){ %>
            <h2 class="empty-order">
                <i class="fa-solid fa-receipt" style="font-size: 50px; display: block; margin-bottom: 20px; color: #ccc;"></i>
                No Orders Found
            </h2>
        <% } else { %>
            <% for(Order order : orders){ %>
                <div class="order-card">
                    <div class="order-header">
                        <h2>Order #<%=order.getOrderId()%></h2>
                        <span class="status">
                            <%=order.getOrderStatus()%>
                        </span>
                    </div>

                    <p>
                        <i class="fa-solid fa-calendar-days"></i>
                        <%=order.getOrderDate()%>
                    </p>

                    <p>
                        <i class="fa-solid fa-credit-card"></i>
                        <%=order.getPaymentMethod()%>
                    </p>

                    <p>
                        <i class="fa-solid fa-indian-rupee-sign"></i>
                        <%=String.format("%.0f",order.getTotalAmount())%>
                    </p>
                </div>
            <% } %>
        <% } %>

        <div class="btn-area">
            <a href="${pageContext.request.contextPath}/RestaurantServlet" class="shop-btn">
                Continue Shopping <i class="fa-solid fa-circle-arrow-right" style="margin-left: 6px;"></i>
            </a>
        </div>
    </div>

</body>
</html>