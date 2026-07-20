<%@page import="com.fooddelivery.model.Restaurant"%>

<%
Restaurant restaurant = (Restaurant)request.getAttribute("restaurant");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Restaurant</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#f4f6f9;
}

.container{
    width:500px;
    margin:40px auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,.2);
}

h2{
    text-align:center;
    margin-bottom:20px;
    color:#2c3e50;
}

input{
    width:100%;
    padding:12px;
    margin:10px 0;
    border:1px solid #ccc;
    border-radius:8px;
}

button{
    width:100%;
    padding:12px;
    background:#27ae60;
    color:white;
    border:none;
    border-radius:8px;
    cursor:pointer;
    font-size:16px;
}

button:hover{
    background:#1e8449;
}

</style>

</head>

<body>

<div class="container">

<h2>Edit Restaurant</h2>

<form action="<%=request.getContextPath()%>/UpdateRestaurantServlet" method="post">

<input type="hidden"
name="restaurantId"
value="<%=restaurant.getRestaurantId()%>">

<input type="text"
name="restaurantName"
value="<%=restaurant.getRestaurantName()%>"
required>

<input type="text"
name="address"
value="<%=restaurant.getAddress()%>"
required>

<input type="text"
name="phone"
value="<%=restaurant.getPhone()%>"
required>

<input type="text"
name="rating"
value="<%=restaurant.getRating()%>"
required>

<input type="text"
name="deliveryTime"
value="<%=restaurant.getDeliveryTime()%>"
required>

<input type="text"
name="image"
value="<%=restaurant.getImage()%>">

<button type="submit">
Update Restaurant
</button>

</form>

</div>

</body>
</html>