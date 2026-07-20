<%@page import="java.util.ArrayList"%>
<%@page import="com.fooddelivery.model.Menu"%>

<%
ArrayList<Menu> menuList =
(ArrayList<Menu>)request.getAttribute("menuList");

if(menuList == null){
    out.println("<h2>No menu data received.</h2>");
    return;
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Restaurant Menu</title>
<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/style.css">

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
            <a href="${pageContext.request.contextPath}/CartServlet">
                Cart
            </a>
        </li>

    </ul>

</nav>

<h1 align="center">Restaurant Menu</h1>

<div class="search-section">

<input type="text"

placeholder="Search Food..."

id="foodSearch"

onkeyup="searchFood()">

</div>

<div class="menu-container">

<% for(Menu menu : menuList){ 

double rating = 4 + Math.random();
rating = Math.round(rating * 10.0) / 10.0;

%>

<div class="food-card">

    <img src="${pageContext.request.contextPath}/images/foods/<%=menu.getImage()%>"
         class="food-image"
         alt="<%=menu.getItemName()%>">

    <div class="food-details">

        <span class="category-badge">
            <%=menu.getCategory()%>
        </span>

        <h2><%=menu.getItemName()%></h2>

        <p class="description">
            <%=menu.getDescription()%>
        </p>

        <div class="food-bottom">

            <div class="price">
                &#8377; <%=String.format("%.0f", menu.getPrice())%>
            </div>

            <div class="rating">
                <i class="fa-solid fa-star"></i>
                <%=rating%>
            </div>

        </div>

        <a href="${pageContext.request.contextPath}/CartServlet?menuId=<%=menu.getMenuId()%>"
   class="cart-btn">
    <i class="fa-solid fa-cart-shopping"></i>
    Add to Cart
</a>

    </div>

</div>

<% } %>
</div>
<script>

function searchFood(){

let input=document.getElementById("foodSearch").value.toLowerCase();

let cards=document.getElementsByClassName("food-card");

for(let i=0;i<cards.length;i++){

let text=cards[i]
.getElementsByTagName("h2")[0]
.innerText
.toLowerCase();

cards[i].style.display=text.includes(input)?"block":"none";

}

}

</script>

</body>

</html>