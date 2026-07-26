<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fooddelivery.model.Order" %>
<%@ page import="com.fooddelivery.model.User" %>

<%
ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
User loggedUser = (User) session.getAttribute("loggedUser");

int ordersCount = 0;
if (orders != null) {
    ordersCount = orders.size();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Orders - FoodNest</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/orderHistory.css?v=1.2">
<style>
.orders-page {
    background-color: #FAF6F0;
}

/* Back link */
.back-link {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    color: #E23744;
    text-decoration: none;
    font-weight: 700;
    font-size: 14px;
    margin: 30px 20% 10px 20%;
    transition: transform 0.2s ease;
}

.back-link:hover {
    transform: translateX(-4px);
}

/* Title Header */
.history-title-section {
    width: 60%;
    margin: 10px auto 25px auto;
    display: flex;
    align-items: baseline;
    gap: 12px;
}

.history-title {
    font-size: 32px;
    font-weight: 800;
    color: #1A1615;
}

.history-count {
    font-size: 14px;
    color: var(--brand-accent);
    font-weight: 700;
    background: rgba(226, 55, 68, 0.08);
    padding: 4px 10px;
    border-radius: 12px;
}

/* Redesigned order card */
.order-card-row {
    background: #ffffff;
    border-radius: 20px;
    padding: 24px;
    display: flex;
    align-items: center;
    gap: 20px;
    box-shadow: 0 8px 25px rgba(26, 22, 21, 0.02);
    border: 1px solid rgba(26, 22, 21, 0.04);
    margin-bottom: 20px;
}

.order-icon-box {
    width: 50px;
    height: 50px;
    border-radius: 12px;
    background-color: rgba(244, 123, 32, 0.08);
    color: #F47B20;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    flex-shrink: 0;
}

.order-card-details {
    flex: 1;
}

.order-card-top {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 8px;
}

.order-card-top h3 {
    font-size: 16px;
    font-weight: 800;
    color: #1A1615;
}

.order-card-top h3 span {
    font-weight: 400;
    color: #6B625E;
    font-size: 13px;
    margin-left: 8px;
}

.order-card-mid {
    font-size: 14px;
    color: #1A1615;
    background: #FAF6F0;
    padding: 8px 16px;
    border-radius: 8px;
    font-weight: 700;
    margin-bottom: 8px;
}

.order-card-bottom {
    display: flex;
    justify-content: space-between;
    font-size: 13px;
    color: #6B625E;
    font-weight: 500;
}

.order-card-bottom .total-price {
    font-weight: 800;
    color: #E23744;
}

.status-badge {
    padding: 4px 12px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 700;
    border: 1px solid rgba(72, 196, 121, 0.2);
}

.status-badge.placed, .status-badge.delivered, .status-badge.success {
    background: rgba(72, 196, 121, 0.1);
    color: #3ca864;
    border-color: rgba(72, 196, 121, 0.2);
}

.status-badge.pending, .status-badge.processing {
    background: rgba(244, 123, 32, 0.1);
    color: #F47B20;
    border-color: rgba(244, 123, 32, 0.2);
}

.status-badge.cancelled, .status-badge.failed {
    background: rgba(226, 55, 68, 0.1);
    color: #E23744;
    border-color: rgba(226, 55, 68, 0.2);
}

@media(max-width: 991px) {
    .back-link {
        margin-left: 8%;
    }
    .history-title-section {
        width: 84%;
    }
    .order-container {
        width: 84%;
    }
}
</style>
</head>
<body class="orders-page">

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

    <!-- Back to Home Link -->
    <a href="${pageContext.request.contextPath}/jsp/customer/home.jsp" class="back-link">
        <i class="fa-solid fa-chevron-left"></i> Back to Home
    </a>

    <!-- Title with orders count -->
    <div class="history-title-section">
        <h1 class="history-title">Your Order History</h1>
        <span class="history-count"><%= ordersCount %> <%= ordersCount == 1 ? "Order" : "Orders" %></span>
    </div>

    <div class="order-container">
        <% if(orders == null || orders.isEmpty()){ %>
            <div class="empty-cart-container" style="max-width: 100%; margin: 40px 0;">
                <div class="empty-cart-icon">
                    <i class="fa-solid fa-receipt"></i>
                </div>
                <h2>No Orders Found</h2>
                <p>Looks like you haven't placed any orders yet. Explore our menu and grab a bite!</p>
                <a href="${pageContext.request.contextPath}/RestaurantServlet" class="empty-cart-btn">
                    Order Food Now
                </a>
            </div>
        <% } else { %>
            <% for(Order order : orders){ 
                String statusClass = order.getOrderStatus().toLowerCase();
            %>
                <div class="order-card-row">
                    <div class="order-icon-box">
                        <i class="fa-solid fa-burger"></i>
                    </div>
                    
                    <div class="order-card-details">
                        <div class="order-card-top">
                            <h3>Order #ORD-<%=order.getOrderId()%> <span>- <%=order.getOrderDate()%></span></h3>
                            <span class="status-badge <%=statusClass%>">
                                <%=order.getOrderStatus()%>
                            </span>
                        </div>

                        <div class="order-card-mid">
                            1x Prepared Meal Order
                        </div>

                        <div class="order-card-bottom">
                            <span>Payment: <b><%=order.getPaymentMethod()%></b></span>
                            <span>Total: <span class="total-price">&#8377; <%=String.format("%.2f", order.getTotalAmount() + 60)%></span></span>
                        </div>
                    </div>
                </div>
            <% } %>
        <% } %>

        <div class="btn-area">
            <a href="${pageContext.request.contextPath}/RestaurantServlet" class="shop-btn">
                Continue Shopping <i class="fa-solid fa-circle-arrow-right" style="margin-left: 6px;"></i>
            </a>
        </div>
    </div>

</body>
</html>