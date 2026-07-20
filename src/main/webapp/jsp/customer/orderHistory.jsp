<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fooddelivery.model.Order" %>

<%
ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>My Orders</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/orderHistory.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>

<body>

<nav class="navbar">

    <div class="logo">
        <i class="fa-solid fa-bowl-food"></i> FoodNest
    </div>

    <ul class="nav-links">

        <li>
            <a href="${pageContext.request.contextPath}/RestaurantServlet">
                Restaurants
            </a>
        </li>

        <li>
            <a href="${pageContext.request.contextPath}/jsp/customer/cart.jsp">
                Cart
            </a>
        </li>

    </ul>

</nav>

<h1 class="order-title">My Orders</h1>

<div class="order-container">

<%
if(orders == null || orders.isEmpty()){
%>

<h2 class="empty-order">

No Orders Found

</h2>

<%
}
else{

for(Order order : orders){
%>

<div class="order-card">

    <div class="order-header">

        <h2>

            Order #<%=order.getOrderId()%>

        </h2>

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

<%
}
}
%>

<div class="btn-area">

<a href="${pageContext.request.contextPath}/RestaurantServlet"
class="shop-btn">

Continue Shopping

</a>

</div>

</div>

</body>
<html>