<%@page import="com.fooddelivery.model.*"%>
<%@page import="java.util.*"%>

<%
Cart cart=(Cart)session.getAttribute("cart");
User loggedUser = (User) session.getAttribute("loggedUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shopping Cart - FoodNest</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css?v=1.1">
</head>
<body class="cart-page">

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

    <h1 class="cart-title">Shopping Cart</h1>

    <div class="cart-container">
        <% if(cart!=null && !cart.getItems().isEmpty()){ %>
            <div class="cart-items-wrapper">
                <% for(CartItem item:cart.getItems().values()){ %>
                    <div class="cart-card">
                        <img src="${pageContext.request.contextPath}/images/foods/<%=item.getImage()%>"
                             class="cart-image"
                             alt="<%=item.getItemName()%>">

                        <div class="cart-details">
                            <h2><%=item.getItemName()%></h2>
                            <p>
                                <span>Price:</span>
                                <span class="price">&#8377; <%=String.format("%.0f",item.getPrice())%></span>
                            </p>
                            <p>
                                <span>Quantity:</span>
                                <span><b><%=item.getQuantity()%></b></span>
                            </p>
                            <p>
                                <span>Total:</span>
                                <span class="price">&#8377; <%=String.format("%.0f",item.getTotalPrice())%></span>
                            </p>
                        </div>
                    </div>
                <% } %>
            </div>

            <div class="summary">
                <h2>Order Summary</h2>
                <p>
                    Grand Total:
                    <span>&#8377; <%=String.format("%.0f",cart.getGrandTotal())%></span>
                </p>
                <a href="${pageContext.request.contextPath}/jsp/customer/checkout.jsp" class="checkout-btn">
                    Proceed to Checkout <i class="fa-solid fa-circle-check" style="margin-left: 6px;"></i>
                </a>
            </div>
        <% } else { %>
            <div class="empty">
                <div class="empty-icon">
                    <i class="fa-solid fa-cart-shopping"></i>
                </div>
                <h2>Your cart is empty.</h2>
                <a href="${pageContext.request.contextPath}/RestaurantServlet" class="shop-link">
                    Explore Restaurants
                </a>
            </div>
        <% } %>
    </div>

</body>
</html>