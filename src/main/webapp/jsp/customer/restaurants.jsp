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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=1.1">
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

    <h1 align="center">Available Restaurants</h1>

    <div class="search-section">
        <input type="text"
               id="searchRestaurant"
               placeholder="Search Restaurants..."
               onkeyup="searchRestaurant()">
    </div>

    <div class="restaurant-container">
        <% if (restaurants != null) { %>
            <% for(Restaurant restaurant : restaurants){ %>
                <div class="restaurant-card">
                    <div class="restaurant-image-container">
                        <div class="rating-badge">
                            <i class="fa-solid fa-star"></i> <%=restaurant.getRating()%>
                        </div>
                        
                        <div class="heart">
                            <i class="fa-solid fa-heart"></i>
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