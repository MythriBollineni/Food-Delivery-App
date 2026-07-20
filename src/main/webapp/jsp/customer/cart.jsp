<%@page import="com.fooddelivery.model.*"%>
<%@page import="java.util.*"%>

<%
Cart cart=(Cart)session.getAttribute("cart");
%>

<!DOCTYPE html>

<html>

<head>

<title>Cart</title>
<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/cart.css">

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
            <a href="${pageContext.request.contextPath}/jsp/customer/home.jsp">
                Home
            </a>
        </li>

    </ul>

</nav>

<h1 class="cart-title">Shopping Cart</h1>

<div class="cart-container">

<%
if(cart!=null && !cart.getItems().isEmpty()){

for(CartItem item:cart.getItems().values()){
%>

<div class="cart-card">

   <img src="${pageContext.request.contextPath}/images/foods/<%=item.getImage()%>"
     class="cart-image"
     alt="<%=item.getItemName()%>">

    <div class="cart-details">

        <h2><%=item.getItemName()%></h2>

        <p>

            Price :
            <span class="price">

                &#8377; <%=String.format("%.0f",item.getPrice())%>

            </span>

        </p>

        <p>

            Quantity :
            <%=item.getQuantity()%>

        </p>

        <p>

            Total :

            <span class="price">

                &#8377; <%=String.format("%.0f",item.getTotalPrice())%>

            </span>

        </p>

    </div>

</div>

<%
}
%>

<div class="summary">

<h2>Order Summary</h2>

<p>

Grand Total

<span>

&#8377; <%=String.format("%.0f",cart.getGrandTotal())%>

</span>

</p>

<a href="${pageContext.request.contextPath}/jsp/customer/checkout.jsp"
class="checkout-btn">

Proceed to Checkout

</a>

</div>

<%
}else{
%>

<h2 class="empty">

Your cart is empty.

</h2>

<%
}
%>

</div>

</body>

</html>