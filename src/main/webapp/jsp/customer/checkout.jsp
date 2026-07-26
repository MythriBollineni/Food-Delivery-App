<%@page import="com.fooddelivery.model.Cart"%>
<%@page import="com.fooddelivery.model.User"%>

<%
Cart cart=(Cart)session.getAttribute("cart");

if(cart==null){
    response.sendRedirect("cart.jsp");
    return;
}

User loggedUser = (User) session.getAttribute("loggedUser");
double subtotal = cart.getGrandTotal();
double deliveryFee = subtotal >= 500 ? 0 : 40;
double taxes = Math.round((subtotal * 0.05) * 100.0) / 100.0;
double grandTotal = subtotal + deliveryFee + taxes;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout - FoodNest</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css?v=1.2">
</head>
<body class="checkout-page">

    <!-- Navbar -->
    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/jsp/customer/home.jsp" class="logo">
            <i class="fa-solid fa-bowl-food"></i> FoodNest
        </a>
    </nav>

    <h1 class="checkout-title">Checkout</h1>

    <div class="checkout-container">

        <!-- Left Side: Address Details -->
        <div class="address-card">
            <h2>
                <i class="fa-solid fa-location-dot"></i>
                Delivery Details
            </h2>
            <input type="text" placeholder="Full Name" value="<%= loggedUser != null ? loggedUser.getName() : "" %>" required>
            <input type="text" placeholder="Mobile Number" value="<%= loggedUser != null ? loggedUser.getPhone() : "" %>" required>
            <textarea placeholder="Delivery Address" required><%= loggedUser != null ? loggedUser.getAddress() : "" %></textarea>
        </div>

        <!-- Right Side: Order Summary & Place Order -->
        <div class="summary-card">
            <h2>Order Summary</h2>

            <div class="summary-row">
                <span>Subtotal</span>
                <span>&#8377; <%=String.format("%.2f", subtotal)%></span>
            </div>

            <div class="summary-row">
                <span>Delivery Fee</span>
                <span><%= deliveryFee == 0 ? "FREE" : "&#8377; " + String.format("%.2f", deliveryFee) %></span>
            </div>

            <div class="summary-row">
                <span>Taxes & Packaging</span>
                <span>&#8377; <%=String.format("%.2f", taxes)%></span>
            </div>

            <hr>

            <div class="summary-row total">
                <span>Total</span>
                <span>&#8377; <%=String.format("%.2f", grandTotal)%></span>
            </div>

            <form action="${pageContext.request.contextPath}/OrderServlet" method="post">
                <label class="payment-label">
                    Select Payment Mode
                </label>

                <select name="paymentMethod" required>
                    <option value="Cash On Delivery">Cash On Delivery</option>
                    <option value="UPI">UPI / Google Pay</option>
                    <option value="Card">Credit / Debit Card</option>
                </select>

                <input type="submit"
                       value="Place Order"
                       class="place-btn">
            </form>
        </div>

    </div>

</body>
</html>