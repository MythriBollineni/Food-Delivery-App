<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.fooddelivery.model.User" %>
<%@ page import="com.fooddelivery.model.Restaurant" %>
<%@ page import="com.fooddelivery.dao.RestaurantDAO" %>
<%@ page import="java.util.ArrayList" %>
<%
User loggedUser = (User) session.getAttribute("loggedUser");

RestaurantDAO restDAO = new RestaurantDAO();
ArrayList<Restaurant> allRests = restDAO.getAllRestaurants();
ArrayList<Restaurant> teaserRests = new ArrayList<>();
if (allRests != null) {
    for (int i = 0; i < Math.min(3, allRests.size()); i++) {
        teaserRests.add(allRests.get(i));
    }
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FoodNest - Delicious Food Delivered</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=1.2">
<style>
.home-page {
    background-color: #FAF6F0;
}

/* Home Hero Overhaul */
.home-hero {
    display: flex;
    width: 100%;
    min-height: 80vh;
    background-color: #1A1615; /* Dark background matching screenshot */
    overflow: hidden;
    position: relative;
}

.hero-left {
    width: 50%;
    padding: 80px 8%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    color: #ffffff;
    z-index: 2;
}

.hero-left h1 {
    font-size: 58px;
    font-weight: 800;
    line-height: 1.1;
    margin-bottom: 20px;
    letter-spacing: -1px;
}

.hero-left h1 span {
    color: #E23744;
}

.hero-left p {
    font-size: 18px;
    color: #E6E2DF;
    margin-bottom: 35px;
    font-weight: 300;
}

.hero-search-bar-form {
    max-width: 500px;
    margin-bottom: 30px;
}

.hero-search-bar {
    display: flex;
    background: #ffffff;
    border-radius: 50px;
    padding: 6px;
    border: 1px solid rgba(26, 22, 21, 0.1);
    align-items: center;
}

.hero-search-bar i {
    color: #6B625E;
    font-size: 18px;
    margin-left: 20px;
    margin-right: 12px;
}

.hero-search-bar input {
    border: none;
    background: none;
    outline: none;
    font-size: 15px;
    color: #1A1615;
    flex: 1;
    padding: 10px 0;
}

.hero-search-bar button {
    background: linear-gradient(135deg, #E23744 0%, #F47B20 100%);
    color: #ffffff;
    border: none;
    padding: 12px 30px;
    border-radius: 50px;
    font-size: 14px;
    font-weight: 700;
    cursor: pointer;
    box-shadow: 0 4px 15px rgba(226, 55, 68, 0.25);
    margin: 0;
    width: auto;
}

.btn-explore {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    background: rgba(255, 255, 255, 0.08);
    border: 1px solid rgba(255, 255, 255, 0.15);
    color: #ffffff;
    text-decoration: none;
    padding: 14px 28px;
    border-radius: 50px;
    font-size: 14px;
    font-weight: 700;
    width: fit-content;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    transition: all 0.3s ease;
}

.btn-explore:hover {
    background: linear-gradient(135deg, #E23744 0%, #F47B20 100%);
    border-color: transparent;
    transform: translateY(-2px);
    box-shadow: 0 8px 24px rgba(226, 55, 68, 0.3);
}

.hero-right {
    width: 50%;
    background-image: url("${pageContext.request.contextPath}/images/banners/banner.jpg");
    background-size: cover;
    background-position: center;
    position: relative;
}

.hero-right::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, #1A1615 0%, transparent 20%);
}

/* Spotlight Section styling */
.spotlight {
    padding: 60px 8% 20px 8%;
}

.spotlight-header {
    margin-bottom: 30px;
}

.sub-header {
    font-size: 13px;
    font-weight: 700;
    color: #E23744;
    text-transform: uppercase;
    letter-spacing: 1.5px;
    display: block;
    margin-bottom: 6px;
}

.main-header {
    font-size: 32px;
    font-weight: 800;
    color: #1A1615;
}

.spotlight-slider {
    display: flex;
    gap: 20px;
    overflow-x: auto;
    padding: 15px 5px;
    scrollbar-width: none; /* Hide scrollbar for Firefox */
}

.spotlight-slider::-webkit-scrollbar {
    display: none; /* Hide scrollbar for Chrome/Safari */
}

.spotlight-card {
    background: #ffffff;
    border-radius: 20px;
    padding: 20px 15px;
    min-width: 130px;
    text-align: center;
    box-shadow: 0 8px 25px rgba(26, 22, 21, 0.03);
    border: 1px solid rgba(26, 22, 21, 0.04);
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 12px;
    cursor: pointer;
    text-decoration: none;
    transition: all 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
}

.spotlight-card:hover {
    transform: translateY(-8px) scale(1.02);
    box-shadow: 0 15px 35px rgba(226, 55, 68, 0.1);
    border-color: rgba(226, 55, 68, 0.2);
}

.spotlight-card.active {
    border-color: #E23744;
    background-color: rgba(226, 55, 68, 0.03);
    box-shadow: 0 10px 30px rgba(226, 55, 68, 0.08);
}

.spotlight-icon-wrapper {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #FAF6F0;
    border: 1px solid rgba(26, 22, 21, 0.06);
}

.spotlight-icon-wrapper img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.spotlight-icon-wrapper i {
    font-size: 24px;
    color: #E23744;
}

.spotlight-card span {
    font-size: 14px;
    font-weight: 700;
    color: #1A1615;
}

/* Feature Badges banner */
.feature-badges-section {
    padding: 40px 8%;
    background-color: #FAF6F0;
}

.feature-badges-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 30px;
}

.badge-card {
    background: #ffffff;
    border-radius: 20px;
    padding: 30px 25px;
    display: flex;
    gap: 20px;
    align-items: center;
    box-shadow: 0 8px 25px rgba(26, 22, 21, 0.03);
    border: 1px solid rgba(26, 22, 21, 0.04);
}

.badge-icon {
    width: 60px;
    height: 60px;
    border-radius: 18px;
    background-color: rgba(226, 55, 68, 0.08);
    color: #E23744;
    font-size: 26px;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
}

.badge-info h3 {
    font-size: 16px;
    font-weight: 700;
    color: #1A1615;
    margin-bottom: 4px;
}

.badge-info p {
    font-size: 13px;
    color: #6B625E;
}

/* Popular section home redirect */
.popular-teaser-section {
    padding: 40px 8% 80px 8%;
}

.popular-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    margin-bottom: 30px;
}

.popular-header .link-all {
    color: #E23744;
    font-weight: 700;
    font-size: 15px;
    text-decoration: none;
    display: flex;
    align-items: center;
    gap: 6px;
}

.popular-header .link-all:hover {
    text-decoration: underline;
}

@media(max-width: 991px) {
    .home-hero {
        flex-direction: column;
        height: auto;
    }
    .hero-left {
        width: 100%;
        padding: 60px 8%;
    }
    .hero-right {
        width: 100%;
        height: 350px;
    }
    .hero-right::before {
        background: linear-gradient(180deg, #1A1615 0%, transparent 20%);
    }
    .hero-left h1 {
        font-size: 40px;
    }
}
</style>
</head>
<body class="home-page">

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

    <!-- Split Hero Section -->
    <section class="home-hero">
        <div class="hero-left">
            <h1>FOOD & <span>RESTAURANT</span></h1>
            <p>Discover authentic gourmet dishes, top-rated local kitchens, and get delicious meals delivered straight to your door in minutes.</p>
            
            <form action="${pageContext.request.contextPath}/RestaurantServlet" method="get" class="hero-search-bar-form">
                <div class="hero-search-bar">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <input type="text" name="search" placeholder="Search by restaurant name or cuisine...">
                    <button type="submit">Find Food</button>
                </div>
            </form>
            
            <a href="${pageContext.request.contextPath}/RestaurantServlet" class="btn-explore">
                Explore More Recipes & Restaurants <i class="fa-solid fa-circle-arrow-right" style="margin-left: 8px;"></i>
            </a>
        </div>
        <div class="hero-right"></div>
    </section>

    <!-- Categories / Spotlight Section -->
    <section class="spotlight">
        <div class="spotlight-header">
            <span class="sub-header">What's on your mind?</span>
            <h2 class="main-header">In the spotlight: Food cravings</h2>
        </div>
        
        <div class="spotlight-slider">
            <a href="${pageContext.request.contextPath}/RestaurantServlet" class="spotlight-card active">
                <div class="spotlight-icon-wrapper">
                    <i class="fa-solid fa-utensils"></i>
                </div>
                <span>All Cravings</span>
            </a>
            <a href="${pageContext.request.contextPath}/RestaurantServlet" class="spotlight-card">
                <div class="spotlight-icon-wrapper">
                    <img src="${pageContext.request.contextPath}/images/foods/pizza.jpg" alt="Pizza">
                </div>
                <span>Hot Pizza</span>
            </a>
            <a href="${pageContext.request.contextPath}/RestaurantServlet" class="spotlight-card">
                <div class="spotlight-icon-wrapper">
                    <img src="${pageContext.request.contextPath}/images/foods/chicken.jpg" alt="Chicken">
                </div>
                <span>Crispy Chicken</span>
            </a>
            <a href="${pageContext.request.contextPath}/RestaurantServlet" class="spotlight-card">
                <div class="spotlight-icon-wrapper">
                    <img src="${pageContext.request.contextPath}/images/foods/noodles.jpg" alt="Noodles">
                </div>
                <span>Chinese Wok</span>
            </a>
            <a href="${pageContext.request.contextPath}/RestaurantServlet" class="spotlight-card">
                <div class="spotlight-icon-wrapper">
                    <img src="${pageContext.request.contextPath}/images/foods/rava_dosa.jpg" alt="South Indian">
                </div>
                <span>Sweet Tooth</span>
            </a>
            <a href="${pageContext.request.contextPath}/RestaurantServlet" class="spotlight-card">
                <div class="spotlight-icon-wrapper">
                    <img src="${pageContext.request.contextPath}/images/foods/burger.jpg" alt="Burger">
                </div>
                <span>Juicy Burgers</span>
            </a>
            <a href="${pageContext.request.contextPath}/RestaurantServlet" class="spotlight-card">
                <div class="spotlight-icon-wrapper">
                    <img src="${pageContext.request.contextPath}/images/foods/biryani.jpg" alt="Biryani">
                </div>
                <span>Royal Biryani</span>
            </a>
        </div>
    </section>

    <!-- Curated Section Header -->
    <section class="popular-teaser-section">
        <div class="popular-header">
            <div>
                <span class="sub-header">Curated for you</span>
                <h2 class="main-header">Popular restaurants near you</h2>
            </div>
            <a href="${pageContext.request.contextPath}/RestaurantServlet" class="link-all">
                View all restaurants <i class="fa-solid fa-circle-arrow-right"></i>
            </a>
        </div>
        
        <!-- Category badges list inline style matching screenshot -->
        <div style="display: flex; gap: 12px; margin-bottom: 30px; overflow-x: auto; padding-bottom: 5px;">
            <span style="background: #E23744; color: white; padding: 8px 18px; border-radius: 30px; font-size: 13px; font-weight: 700; cursor: pointer;">All</span>
            <span style="background: white; color: #1A1615; padding: 8px 18px; border-radius: 30px; font-size: 13px; font-weight: 600; border: 1px solid rgba(26,22,21,0.06); cursor: pointer;">Rating 4.0+</span>
            <span style="background: white; color: #1A1615; padding: 8px 18px; border-radius: 30px; font-size: 13px; font-weight: 600; border: 1px solid rgba(26,22,21,0.06); cursor: pointer;"><i class="fa-solid fa-bolt" style="color: #F5A623; margin-right: 4px;"></i> Fast Delivery (&lt; 30 mins)</span>
            <span style="background: white; color: #1A1615; padding: 8px 18px; border-radius: 30px; font-size: 13px; font-weight: 600; border: 1px solid rgba(26,22,21,0.06); cursor: pointer;">Great Offers</span>
            <span style="background: white; color: #1A1615; padding: 8px 18px; border-radius: 30px; font-size: 13px; font-weight: 600; border: 1px solid rgba(26,22,21,0.06); cursor: pointer;">Pure Veg & Healthy</span>
        </div>

        <!-- Teaser Restaurant Grid -->
        <div class="restaurant-container" style="margin-top: 20px;">
            <% if (!teaserRests.isEmpty()) { %>
                <% for(Restaurant restaurant : teaserRests){ %>
                    <div class="restaurant-card">
                        <div class="restaurant-image-container">
                            <div class="rating-badge">
                                <i class="fa-solid fa-star"></i> <%=restaurant.getRating()%>
                            </div>
                            
                            <div class="heart" onclick="toggleHeart(this)">
                                <i class="fa-regular fa-heart"></i>
                            </div>

                            <img src="${pageContext.request.contextPath}/images/restaurants/<%=restaurant.getImage()%>"
                                 alt="<%=restaurant.getRestaurantName()%>">
                            
                            <div class="offer">
                                Flat 40% OFF
                            </div>
                        </div>

                        <div class="restaurant-details">
                            <h3><%=restaurant.getRestaurantName()%></h3>
                            
                            <div class="restaurant-meta">
                                <span class="delivery-time">
                                    <i class="fa-regular fa-clock"></i> <%=restaurant.getDeliveryTime()%>
                                </span>
                                <span class="restaurant-phone">
                                    <i class="fa-solid fa-phone"></i> <%=restaurant.getPhone()%>
                                </span>
                            </div>

                            <p class="address">
                                <i class="fa-solid fa-location-dot"></i> <%=restaurant.getAddress()%>
                            </p>

                            <a href="${pageContext.request.contextPath}/MenuServlet?restaurantId=<%=restaurant.getRestaurantId()%>"
                               class="view-btn">
                               View Menu
                            </a>
                        </div>
                    </div>
                <% } %>
            <% } %>
        </div>
    </section>

    <script>
    function toggleHeart(element) {
        let icon = element.querySelector("i");
        if(icon.classList.contains("fa-regular")) {
            icon.classList.remove("fa-regular");
            icon.classList.add("fa-solid", "liked");
        } else {
            icon.classList.remove("fa-solid", "liked");
            icon.classList.add("fa-regular");
        }
    }
    </script>

    <!-- Marketing / Badges banner -->
    <section class="feature-badges-section">
        <div class="feature-badges-container">
            <div class="badge-card">
                <div class="badge-icon">
                    <i class="fa-solid fa-bolt"></i>
                </div>
                <div class="badge-info">
                    <h3>Quick delivery</h3>
                    <p>Fresh food at your doorstep in under 30 mins</p>
                </div>
            </div>
            <div class="badge-card">
                <div class="badge-icon">
                    <i class="fa-solid fa-pizza-slice"></i>
                </div>
                <div class="badge-info">
                    <h3>Many choices</h3>
                    <p>Discover hundreds of signature meals & cuisines</p>
                </div>
            </div>
            <div class="badge-card">
                <div class="badge-icon">
                    <i class="fa-solid fa-mobile-screen"></i>
                </div>
                <div class="badge-info">
                    <h3>Easy ordering</h3>
                    <p>Order your favourite food in a few simple taps</p>
                </div>
            </div>
        </div>
    </section>

</body>
</html>