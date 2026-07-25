<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.fooddelivery.model.User" %>
<%
User loggedUser = (User) session.getAttribute("loggedUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FoodNest - Delicious Food Delivered</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
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

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <h1>Delicious Food Delivered to Your Doorstep</h1>
            <p>Fresh meals from your favourite restaurants in minutes.</p>
            <a href="${pageContext.request.contextPath}/RestaurantServlet" class="btn-order">
                Order Now <i class="fa-solid fa-circle-arrow-right" style="margin-left: 8px;"></i>
            </a>
        </div>
    </section>

    <!-- Categories Section -->
    <section class="categories">
        <h2>Popular Categories</h2>
        <div class="category-container">
            <div class="category-card">
                <img src="${pageContext.request.contextPath}/images/foods/pizza.jpg" alt="Pizza">
                <h3>Pizza</h3>
            </div>
            <div class="category-card">
                <img src="${pageContext.request.contextPath}/images/foods/burger.jpg" alt="Burger">
                <h3>Burger</h3>
            </div>
            <div class="category-card">
                <img src="${pageContext.request.contextPath}/images/foods/biryani.jpg" alt="Biryani">
                <h3>Biryani</h3>
            </div>
            <div class="category-card">
                <img src="${pageContext.request.contextPath}/images/foods/noodles.jpg" alt="Noodles">
                <h3>Noodles</h3>
            </div>
        </div>
    </section>

</body>
</html>