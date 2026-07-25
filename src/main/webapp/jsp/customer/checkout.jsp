<%@page import="com.fooddelivery.model.Cart"%>
<%@page import="com.fooddelivery.model.User"%>

<%
Cart cart=(Cart)session.getAttribute("cart");

if(cart==null){
    response.sendRedirect("cart.jsp");
    return;
}

User loggedUser = (User) session.getAttribute("loggedUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout - FoodNest</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css">
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/jsp/customer/home.jsp" class="logo">
            <i class="fa-solid fa-bowl-food"></i> FoodNest
        </a>
    </nav>

    <h1 class="checkout-title">Checkout</h1>

    <div class="checkout-container">

        <!-- Left Side -->
        <div class="address-card">
            <h2>
                <i class="fa-solid fa-location-dot"></i>
                Delivery Address
            </h2>
            <input type="text" placeholder="Full Name">
            <input type="text" placeholder="Mobile Number">
            <textarea placeholder="Delivery Address"></textarea>
        </div>

        <!-- Right Side -->
        <div class="summary-card">
            <h2>Order Summary</h2>

            <div class="summary-row">
                <span>Subtotal</span>
                <span>&#8377; <%=String.format("%.0f",cart.getGrandTotal())%></span>
            </div>

            <div class="summary-row">
                <span>Delivery Fee</span>
                <span>&#8377; 40</span>
            </div>

            <div class="summary-row">
                <span>GST</span>
                <span>&#8377; 20</span>
            </div>

            <hr>

            <div class="summary-row total">
                <span>Grand Total</span>
                <span>&#8377; <%=String.format("%.0f",cart.getGrandTotal()+60)%></span>
            </div>

            <form action="${pageContext.request.contextPath}/OrderServlet" method="post">
                <label class="payment-label">
                    Payment Method
                </label>

                <select name="paymentMethod">
                    <option value="Cash On Delivery">
                        Cash On Delivery
                    </option>
                    <option value="UPI">
                        UPI
                    </option>
                    <option value="Card">
                        Card
                    </option>
                </select>

                <input type="submit"
                       value="Place Order"
                       class="place-btn">
            </form>
        </div>

    </div>

</body>
</html>