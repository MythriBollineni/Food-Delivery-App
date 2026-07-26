<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.fooddelivery.model.User" %>
<%@ page import="com.fooddelivery.model.Order" %>
<%@ page import="com.fooddelivery.dao.OrderDAO" %>
<%@ page import="java.util.ArrayList" %>

<%
User loggedUser = (User) session.getAttribute("loggedUser");
Order latestOrder = null;
if (loggedUser != null) {
    OrderDAO orderDAO = new OrderDAO();
    ArrayList<Order> userOrders = orderDAO.getOrdersByUserId(loggedUser.getUserId());
    if (userOrders != null && !userOrders.isEmpty()) {
        latestOrder = userOrders.get(0);
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Successful - FoodNest</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css?v=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/orderSuccess.css?v=1.2">
<style>
.success-card-details {
    text-align: left;
    margin: 25px 0;
    background: #FAF6F0;
    border-radius: 16px;
    padding: 20px;
    border: 1px solid rgba(26, 22, 21, 0.05);
    display: flex;
    flex-direction: column;
    gap: 12px;
}

.success-detail-row {
    display: flex;
    justify-content: space-between;
    font-size: 14px;
}

.success-detail-label {
    color: #6B625E;
    font-weight: 500;
}

.success-detail-value {
    color: #1A1615;
    font-weight: 700;
}

.success-detail-value.ref-id {
    color: #E23744;
}

.success-detail-value.amount {
    color: #F47B20;
}

.status-pill {
    background: rgba(72, 196, 121, 0.1);
    color: #3ca864;
    padding: 3px 10px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 700;
    border: 1px solid rgba(72, 196, 121, 0.2);
}

.rider-illustration {
    margin-bottom: 15px;
    display: flex;
    justify-content: center;
}

.rider-circle {
    width: 90px;
    height: 90px;
    border-radius: 50%;
    background-color: rgba(226, 55, 68, 0.05);
    color: #E23744;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 42px;
    box-shadow: 0 4px 15px rgba(226, 55, 68, 0.1);
}

@keyframes driveRider {
    0% { transform: scale(1) translateX(-4px); }
    50% { transform: scale(1.05) translateX(4px); }
    100% { transform: scale(1) translateX(-4px); }
}

.rider-circle i {
    animation: driveRider 1.5s infinite ease-in-out;
    display: inline-block;
}
</style>
</head>
<body class="success-page">

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
                <li class="profile-dropdown-container">
                    <button class="profile-dropdown-btn" onclick="toggleProfileDropdown(event)">
                        <i class="fa-solid fa-user"></i> Hi, <%= loggedUser.getName() %> <i class="fa-solid fa-chevron-down" style="font-size: 10px; margin-left: 4px;"></i>
                    </button>
                    <div class="profile-dropdown-menu" id="profileDropdownMenu">
                        <a href="${pageContext.request.contextPath}/OrderHistoryServlet"><i class="fa-solid fa-receipt"></i> My Orders</a>
                        <a href="${pageContext.request.contextPath}/LogoutServlet"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
                    </div>
                </li>
            <% } %>
        </ul>
    </nav>

    <div class="success-container">
        <div class="success-card">
            
            <div class="rider-illustration">
                <div class="rider-circle">
                    <i class="fa-solid fa-motorcycle"></i>
                </div>
            </div>

            <div class="success-icon">
                <i class="fa-solid fa-circle-check"></i>
            </div>

            <h1>Order Placed Successfully!</h1>
            <p class="message">Thank you for ordering with <b>FoodNest</b>. Your food delivery driver is on the way!</p>

            <% if (latestOrder != null) { %>
                <div class="success-card-details">
                    <div class="success-detail-row">
                        <span class="success-detail-label">Order Reference ID</span>
                        <span class="success-detail-value ref-id">#ORD-<%= latestOrder.getOrderId() %></span>
                    </div>
                    <div class="success-detail-row">
                        <span class="success-detail-label">Order Date & Time</span>
                        <span class="success-detail-value"><%= latestOrder.getOrderDate() %></span>
                    </div>
                    <div class="success-detail-row">
                        <span class="success-detail-label">Total Amount Paid</span>
                        <span class="success-detail-value amount">&#8377; <%= String.format("%.2f", latestOrder.getTotalAmount() + 60) %></span>
                    </div>
                    <div class="success-detail-row">
                        <span class="success-detail-label">Payment Mode</span>
                        <span class="success-detail-value"><%= latestOrder.getPaymentMethod() %></span>
                    </div>
                    <div class="success-detail-row">
                        <span class="success-detail-label">Status</span>
                        <span class="success-detail-value">
                            <span class="status-pill">&#9679; <%= latestOrder.getOrderStatus() %></span>
                        </span>
                    </div>
                    <div class="success-detail-row">
                        <span class="success-detail-label">Deliver To</span>
                        <span class="success-detail-value"><%= loggedUser != null ? loggedUser.getAddress() : "Home" %></span>
                    </div>
                </div>
            <% } else { %>
                <div class="delivery">
                    <p>
                        <i class="fa-solid fa-truck-fast"></i>
                        Estimated Delivery :
                        <b>30 Minutes</b>
                    </p>
                </div>
            <% } %>

            <div class="buttons">
                <a href="${pageContext.request.contextPath}/OrderHistoryServlet" class="history-btn">
                    View Order History
                </a>
                <a href="${pageContext.request.contextPath}/RestaurantServlet" class="shop-btn">
                    Order More Food <i class="fa-solid fa-circle-arrow-right" style="margin-left: 6px;"></i>
                </a>
            </div>

        </div>
    </div>

    <script>
    function toggleProfileDropdown(event) {
        event.stopPropagation();
        let menu = document.getElementById("profileDropdownMenu");
        if(menu) menu.classList.toggle("show");
    }
    window.addEventListener("click", function() {
        let menu = document.getElementById("profileDropdownMenu");
        if(menu && menu.classList.contains("show")) {
            menu.classList.remove("show");
        }
    });
    </script>
</body>
</html>