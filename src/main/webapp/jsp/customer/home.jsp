<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Home</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

    <!-- Navbar -->
    <nav class="navbar">
        <div class="logo">🍔 FoodNest</div>

        <ul class="nav-links">
            <li><a href="#">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/RestaurantServlet">Restaurants</a></li>
            <li><a href="#">Offers</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/auth/login.jsp">Login</a></li>
        </ul>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <h1>Delicious Food Delivered to Your Doorstep</h1>
            <p>Fresh meals from your favourite restaurants in minutes.</p>

            <a href="${pageContext.request.contextPath}/RestaurantServlet"
               class="btn-order">
                Order Now
            </a>
        </div>
    </section>
    <section class="categories">

    <h2>Popular Categories</h2>

    <div class="category-container">

        <div class="category-card">
            <img src="${pageContext.request.contextPath}/images/foods/pizza.jpg">
            <h3>Pizza</h3>
        </div>

        <div class="category-card">
            <img src="${pageContext.request.contextPath}/images/foods/burger.jpg">
            <h3>Burger</h3>
        </div>

        <div class="category-card">
            <img src="${pageContext.request.contextPath}/images/foods/biryani.jpg">
            <h3>Biryani</h3>
        </div>

        <div class="category-card">
            <img src="${pageContext.request.contextPath}/images/foods/noodles.jpg">
            <h3>Noodles</h3>
        </div>

    </div>

</section>

</body>

</html>