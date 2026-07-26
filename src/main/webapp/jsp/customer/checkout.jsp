<%@page import="com.fooddelivery.model.Cart"%>
<%@page import="com.fooddelivery.model.CartItem"%>
<%@page import="com.fooddelivery.model.User"%>
<%@page import="java.util.Map"%>

<%
Cart cart = (Cart) session.getAttribute("cart");

if (cart == null || cart.getItems().isEmpty()) {
    response.sendRedirect("cart.jsp");
    return;
}

User loggedUser = (User) session.getAttribute("loggedUser");
double subtotal = cart.getGrandTotal();
double deliveryFee = subtotal >= 500 ? 0 : 40;
double taxes = Math.round((subtotal * 0.05) * 100.0) / 100.0;
double grandTotal = subtotal + deliveryFee + taxes;
int totalItems = cart.getItems().size();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout - FoodNest</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css?v=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css?v=1.3">
</head>
<body class="checkout-page">

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

    <div style="padding: 40px 8% 0 8%;">
        <div style="display: flex; align-items: center; gap: 12px; margin-bottom: 20px;">
            <h1 style="font-size: 32px; font-weight: 800; color: #1A1615; margin: 0;">Checkout Order</h1>
            <span style="background: rgba(226, 55, 68, 0.1); color: #E23744; padding: 4px 12px; border-radius: 20px; font-size: 13px; font-weight: 700;"><%= totalItems %> items</span>
        </div>
    </div>

    <div class="checkout-container">

        <!-- Left Column: Cart items list + Address details -->
        <div style="display: flex; flex-direction: column; gap: 30px; flex: 1.8;">
            
            <!-- My Cart items display block -->
            <div class="address-card" style="margin-bottom: 0;">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; border-bottom: 1px solid rgba(26,22,21,0.06); padding-bottom: 12px;">
                    <h2 style="font-size: 18px; font-weight: 800; display: flex; align-items: center; gap: 10px; color: #1A1615;">
                        <i class="fa-solid fa-cart-shopping" style="color: #E23744;"></i> My cart
                    </h2>
                    <span style="background: #F47B20; color: white; padding: 4px 12px; border-radius: 20px; font-size: 11px; font-weight: 700; text-transform: uppercase;">Confirm</span>
                </div>
                
                <div style="display: flex; flex-direction: column; gap: 15px;">
                    <% 
                    for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) { 
                        CartItem item = entry.getValue();
                    %>
                        <div style="display: flex; justify-content: space-between; align-items: center; background: #FAF9F6; padding: 15px 20px; border-radius: 16px; border: 1px solid rgba(26,22,21,0.04);">
                            <div>
                                <h4 style="font-size: 15px; font-weight: 700; color: #1A1615; margin-bottom: 2px;"><%= item.getItemName() %></h4>
                                <span style="font-size: 12px; color: #6B625E;">freshly prepared dish • Item #<%= item.getMenuId() %></span>
                            </div>
                            <div style="display: flex; align-items: center; gap: 20px;">
                                <span style="color: #E23744; font-weight: 700; font-size: 14px;"><%= item.getQuantity() %>x</span>
                                <span style="font-weight: 700; color: #1A1615;">&#8377; <%= String.format("%.2f", item.getPrice() * item.getQuantity()) %></span>
                            </div>
                        </div>
                    <% } %>
                </div>

                <!-- Discount Trigger Button -->
                <button type="button" style="background: #FAF6F0; color: #E23744; border: 1px dashed rgba(226,55,68,0.3); padding: 12px 20px; border-radius: 12px; font-size: 13px; font-weight: 700; cursor: pointer; display: flex; align-items: center; gap: 8px; margin-top: 20px; width: fit-content; transition: all 0.25s ease;">
                    <i class="fa-solid fa-tags"></i> Add discount
                </button>
            </div>

            <!-- Delivery Details card -->
            <div class="address-card">
                <h2 style="font-size: 18px; font-weight: 800; display: flex; align-items: center; gap: 10px; color: #1A1615; margin-bottom: 20px;">
                    <i class="fa-solid fa-location-dot" style="color: #E23744;"></i> Delivery Details
                </h2>
                <div style="display: flex; flex-direction: column; gap: 15px;">
                    <input type="text" placeholder="Full Name" value="<%= loggedUser != null ? loggedUser.getName() : "" %>" required style="width: 100%; padding: 14px; border: 1px solid rgba(26,22,21,0.12); border-radius: 12px; font-size: 14px; background: #FAF9F6; outline: none;">
                    <input type="text" placeholder="Mobile Number" value="<%= loggedUser != null ? loggedUser.getPhone() : "" %>" required style="width: 100%; padding: 14px; border: 1px solid rgba(26,22,21,0.12); border-radius: 12px; font-size: 14px; background: #FAF9F6; outline: none;">
                    <textarea placeholder="Delivery Address" required style="width: 100%; padding: 14px; border: 1px solid rgba(26,22,21,0.12); border-radius: 12px; font-size: 14px; background: #FAF9F6; outline: none; resize: none; height: 90px;"><%= loggedUser != null ? loggedUser.getAddress() : "" %></textarea>
                </div>
            </div>

        </div>

        <!-- Right Column: Total payment block -->
        <div style="flex: 1; min-width: 320px;">
            <div class="summary-card" style="position: sticky; top: 100px;">
                <h2 style="font-size: 18px; font-weight: 800; color: #1A1615; margin-bottom: 20px; border-bottom: 1px solid rgba(26,22,21,0.06); padding-bottom: 12px;">Total payment</h2>

                <div class="summary-row" style="margin-bottom: 12px;">
                    <span style="color: #6B625E; font-size: 14px; font-weight: 500;">SUBTOTAL</span>
                    <span style="font-weight: 700; color: #1A1615;">&#8377; <%=String.format("%.2f", subtotal)%></span>
                </div>

                <div class="summary-row" style="margin-bottom: 12px;">
                    <span style="color: #6B625E; font-size: 14px; font-weight: 500;">DELIVERY FEE</span>
                    <span style="font-weight: 700; color: #E23744;"><%= deliveryFee == 0 ? "FREE" : "&#8377; " + String.format("%.2f", deliveryFee) %></span>
                </div>

                <div class="summary-row" style="margin-bottom: 20px;">
                    <span style="color: #6B625E; font-size: 14px; font-weight: 500;">TAXES & PACKAGING</span>
                    <span style="font-weight: 700; color: #1A1615;">&#8377; <%=String.format("%.2f", taxes)%></span>
                </div>

                <hr style="border: 0; border-top: 1px solid rgba(26,22,21,0.08); margin-bottom: 20px;">

                <div class="summary-row total" style="margin-bottom: 25px;">
                    <span style="font-size: 15px; font-weight: 800; color: #1A1615;">TOTAL PAYABLE</span>
                    <span style="font-size: 20px; font-weight: 800; color: #E23744;">&#8377; <%=String.format("%.2f", grandTotal)%></span>
                </div>

                <form action="${pageContext.request.contextPath}/OrderServlet" method="post">
                    <label class="payment-label" style="display: block; margin-bottom: 8px; font-size: 13px; font-weight: 700; color: #1A1615;">
                        Select Payment Mode
                    </label>

                    <select name="paymentMethod" required style="width: 100%; padding: 14px; border: 1px solid rgba(26,22,21,0.12); border-radius: 12px; font-size: 14px; background: #FAF9F6; margin-bottom: 20px; outline: none; font-weight: 600; color: #1A1615;">
                        <option value="Cash On Delivery">Cash On Delivery</option>
                        <option value="UPI">UPI / Google Pay</option>
                        <option value="Card">Credit / Debit Card</option>
                    </select>

                    <input type="submit"
                           value="Confirm & Place Order"
                           class="place-btn"
                           style="width: 100%; padding: 16px; border: none; border-radius: 12px; background: linear-gradient(135deg, #E23744 0%, #F47B20 100%); color: white; font-weight: 700; font-size: 15px; cursor: pointer; box-shadow: 0 6px 20px rgba(226,55,68,0.2); transition: all 0.25s ease;">
                </form>
                
                <p style="font-size: 11px; color: #9CA3AF; text-align: center; margin-top: 15px; line-height: 1.4;">
                    Your order details are verified. Your food will be dispatched right after order placement.
                </p>
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