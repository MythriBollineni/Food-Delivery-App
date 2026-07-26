<%@page import="java.util.ArrayList"%>
<%@page import="com.fooddelivery.model.Restaurant"%>
<%@page import="com.fooddelivery.model.User"%>

<%
ArrayList<Restaurant> restaurants =
(ArrayList<Restaurant>)request.getAttribute("restaurants");

User loggedUser = (User) session.getAttribute("loggedUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Restaurants - FoodNest</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=1.2">
<style>
.restaurants-page {
    background-color: #FAF6F0;
}

/* Category Filter pills */
.filter-pills-container {
    padding: 20px 8% 0 8%;
    display: flex;
    gap: 12px;
    overflow-x: auto;
    scrollbar-width: none;
}

.filter-pills-container::-webkit-scrollbar {
    display: none;
}

.filter-pill {
    background: #ffffff;
    color: #1A1615;
    padding: 8px 18px;
    border-radius: 30px;
    font-size: 13px;
    font-weight: 600;
    border: 1px solid rgba(26,22,21,0.06);
    cursor: pointer;
    transition: all 0.2s ease;
    white-space: nowrap;
}

.filter-pill:hover {
    border-color: #E23744;
    color: #E23744;
}

.filter-pill.active {
    background: #E23744;
    color: #ffffff;
    border-color: #E23744;
}

/* Love icon toggle state */
.heart i.liked {
    color: #ff4d4d;
}
</style>
</head>
<body class="restaurants-page">

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

    <!-- Header Section -->
    <div style="padding: 40px 8% 0 8%;">
        <span style="font-size: 13px; font-weight: 700; color: #E23744; text-transform: uppercase; letter-spacing: 1.5px; display: block; margin-bottom: 6px;">Curated for you</span>
        <h1 style="font-size: 36px; font-weight: 800; color: #1A1615; margin: 0; text-align: left;">Popular restaurants near you</h1>
    </div>

    <div class="filter-pills-container">
        <span class="filter-pill active" onclick="filterAll(this)">All</span>
        <span class="filter-pill" onclick="filterRating(this)">Rating 4.0+</span>
        <span class="filter-pill" onclick="filterDelivery(this)"><i class="fa-solid fa-bolt" style="color: #F5A623; margin-right: 4px;"></i> Fast Delivery (&lt; 30 mins)</span>
        <span class="filter-pill" onclick="filterOffers(this)">Great Offers</span>
    </div>

    <!-- Search Section -->
    <div class="search-section">
        <input type="text"
               id="searchRestaurant"
               placeholder="Search Restaurants by name..."
               onkeyup="searchRestaurant()">
    </div>

    <!-- Restaurants Container -->
    <div class="restaurant-container">
        <% if (restaurants != null) { %>
            <% for(Restaurant restaurant : restaurants){ %>
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
        <% } else { %>
            <h2 style="grid-column: 1/-1; text-align: center; color: #88909c;">No restaurants found.</h2>
        <% } %>
    </div>

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

function setActivePill(element) {
    let pills = document.getElementsByClassName("filter-pill");
    for(let i=0; i<pills.length; i++) {
        pills[i].classList.remove("active");
    }
    element.classList.add("active");
}

function filterAll(element) {
    setActivePill(element);
    let cards = document.getElementsByClassName("restaurant-card");
    for(let i=0; i<cards.length; i++){
        cards[i].style.display = "flex";
    }
}

function filterRating(element) {
    setActivePill(element);
    let cards = document.getElementsByClassName("restaurant-card");
    for(let i=0; i<cards.length; i++){
        let ratingText = cards[i].querySelector(".rating-badge").innerText.trim();
        let rating = parseFloat(ratingText);
        if(rating >= 4.0)
            cards[i].style.display = "flex";
        else
            cards[i].style.display = "none";
    }
}

function filterDelivery(element) {
    setActivePill(element);
    let cards = document.getElementsByClassName("restaurant-card");
    for(let i=0; i<cards.length; i++){
        let deliveryText = cards[i].querySelector(".delivery-time").innerText.toLowerCase();
        let mins = parseInt(deliveryText.replace(/[^0-9]/g, ''));
        if(mins < 30)
            cards[i].style.display = "flex";
        else
            cards[i].style.display = "none";
    }
}

function filterOffers(element) {
    setActivePill(element);
    let cards = document.getElementsByClassName("restaurant-card");
    for(let i=0; i<cards.length; i++){
        let offer = cards[i].querySelector(".offer");
        if(offer && offer.innerText.trim() !== "")
            cards[i].style.display = "flex";
        else
            cards[i].style.display = "none";
    }
}

function searchRestaurant(){
    let input = document.getElementById("searchRestaurant").value.toLowerCase();
    let cards = document.getElementsByClassName("restaurant-card");
    for(let i=0;i<cards.length;i++){
        let name = cards[i]
            .getElementsByTagName("h3")[0]
            .innerText
            .toLowerCase();

        if(name.includes(input))
            cards[i].style.display="flex";
        else
            cards[i].style.display="none";
    }
}
</script>

</body>
</html>