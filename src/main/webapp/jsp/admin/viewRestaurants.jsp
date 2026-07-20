<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.fooddelivery.model.Restaurant"%>

<%
ArrayList<Restaurant> restaurants =
(ArrayList<Restaurant>)request.getAttribute("restaurants");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Manage Restaurants</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/restaurantAdmin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>

<body>

<div class="header">

<h1>

<i class="fa-solid fa-store"></i>

Manage Restaurants

</h1>

<a href="${pageContext.request.contextPath}/jsp/admin/addRestaurant.jsp"
class="add-btn">

<i class="fa-solid fa-plus"></i>

Add Restaurant

</a>

</div>

<div class="container">

<%
if(restaurants!=null && !restaurants.isEmpty()){

for(Restaurant r : restaurants){
%>

<div class="restaurant-card">

<img src="${pageContext.request.contextPath}/images/restaurants/<%=r.getImage()%>"
alt="<%=r.getRestaurantName()%>">

<div class="details">

<h2>

<%=r.getRestaurantName()%>

</h2>

<p>

<i class="fa-solid fa-location-dot"></i>

<%=r.getAddress()%>

</p>

<p>

<i class="fa-solid fa-phone"></i>

<%=r.getPhone()%>

</p>

<p>

<i class="fa-solid fa-star"></i>

<%=r.getRating()%>

</p>

<p>

<i class="fa-regular fa-clock"></i>

<%=r.getDeliveryTime()%>

</p>

<div class="buttons">

<a href="${pageContext.request.contextPath}/EditRestaurantServlet?id=<%=r.getRestaurantId()%>"
class="edit">

<i class="fa-solid fa-pen"></i>

Edit

</a>

<a href="${pageContext.request.contextPath}/DeleteRestaurantServlet?id=<%=r.getRestaurantId()%>"
class="delete"
onclick="return confirm('Delete this restaurant?')">

<i class="fa-solid fa-trash"></i>

Delete

</a>

</div>

</div>

</div>

<%
}
}
else{
%>

<h2 class="no-data">

No Restaurants Available

</h2>

<%
}
%>

</div>

</body>

</html>