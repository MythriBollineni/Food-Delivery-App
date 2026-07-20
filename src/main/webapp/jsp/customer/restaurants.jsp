<%@page import="java.util.ArrayList"%>
<%@page import="com.fooddelivery.model.Restaurant"%>

<%
ArrayList<Restaurant> restaurants =
(ArrayList<Restaurant>)request.getAttribute("restaurants");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Restaurants</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/style.css">



</head>

<body>

<h1 align="center">Available Restaurants</h1>

<div class="search-section">
    <input type="text"
           id="searchRestaurant"
           placeholder=" Search Restaurants..."
           onkeyup="searchRestaurant()">
</div>

<div class="restaurant-container">

<% for(Restaurant restaurant : restaurants){ %>

<div class="restaurant-card">
<div class="heart">
    <i class="fa-solid fa-heart"></i>
</div>

   <img src="${pageContext.request.contextPath}/images/restaurants/<%=restaurant.getImage()%>"
     alt="<%=restaurant.getRestaurantName()%>">
  <div class="offer">
Flat 40% OFF
</div>

    <div class="restaurant-details">

        <h3><%=restaurant.getRestaurantName()%></h3>
<div class="rating">

   <i class="fa-solid fa-star" style="color:gold;"></i>
<%=restaurant.getRating()%>

</div>

<p>
<i class="fa-regular fa-clock"></i>
<%=restaurant.getDeliveryTime()%>
</p>

<p>
<i class="fa-solid fa-location-dot"></i>
<%=restaurant.getAddress()%>
</p>

        <a href="${pageContext.request.contextPath}/MenuServlet?restaurantId=<%=restaurant.getRestaurantId()%>"
           class="view-btn">
           View Menu
        </a>

    </div>

</div>

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
            cards[i].style.display="block";
        else
            cards[i].style.display="none";
    }

}

</script>

</body>

</html>