<%@page import="com.fooddelivery.model.Menu"%>

<%
Menu menu=(Menu)request.getAttribute("menu");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit Menu</title>

<style>

body{
font-family:Arial;
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

input,textarea,select{

width:100%;
padding:12px;
margin:10px 0;

}

button{

width:100%;
padding:12px;
background:#27ae60;
color:white;
border:none;
border-radius:8px;

}

</style>

</head>

<body>

<div class="container">

<h2>Edit Menu Item</h2>

<form action="<%=request.getContextPath()%>/UpdateMenuServlet" method="post">

<input type="hidden"
name="menuId"
value="<%=menu.getMenuId()%>">

<input type="hidden"
name="restaurantId"
value="<%=menu.getRestaurantId()%>">

<input type="text"
name="itemName"
value="<%=menu.getItemName()%>">

<textarea
name="description"><%=menu.getDescription()%></textarea>

<input type="text"
name="price"
value="<%=menu.getPrice()%>">

<input type="text"
name="category"
value="<%=menu.getCategory()%>">

<input type="text"
name="image"
value="<%=menu.getImage()%>">

<select name="available">

<option value="true"
<%=menu.isAvailable()?"selected":""%>>
Available
</option>

<option value="false"
<%=!menu.isAvailable()?"selected":""%>>
Not Available
</option>

</select>

<button>

Update Menu

</button>

</form>

</div>

</body>
</html>