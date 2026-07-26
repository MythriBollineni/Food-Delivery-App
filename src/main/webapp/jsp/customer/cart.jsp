<%@page import="com.fooddelivery.model.*"%>
<%@page import="java.util.*"%>

<%
Cart cart=(Cart)session.getAttribute("cart");
User loggedUser = (User) session.getAttribute("loggedUser");

int itemsCount = 0;
double subtotal = 0;
double deliveryFee = 40;
double taxes = 0;
double grandTotal = 0;

if(cart != null && !cart.getItems().isEmpty()) {
    itemsCount = cart.getItems().size();
    subtotal = cart.getGrandTotal();
    if(subtotal >= 500) {
        deliveryFee = 0;
    }
    taxes = Math.round((subtotal * 0.05) * 100.0) / 100.0;
    grandTotal = subtotal + deliveryFee + taxes;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shopping Cart - FoodNest</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css?v=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css?v=1.2">
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
            <li class="active"><a href="${pageContext.request.contextPath}/CartServlet"><i class="fa-solid fa-cart-shopping"></i> Cart</a></li>
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
            <% } else { %>
                <li><a href="${pageContext.request.contextPath}/jsp/auth/login.jsp"><i class="fa-solid fa-right-to-bracket"></i> Login</a></li>
            <% } %>
        </ul>
    </nav>

    <% if(cart != null && !cart.getItems().isEmpty()){ %>
        <!-- Title Header -->
        <div class="cart-title-section">
            <h1 class="cart-title">Shopping Cart</h1>
            <span class="cart-item-count"><%= itemsCount %> items</span>
        </div>

        <div class="cart-container">
            <!-- Left Side: Table of Items -->
            <div>
                <div class="cart-table-header">
                    <span>Product</span>
                    <span>Price</span>
                    <span>Quantity</span>
                    <span>Subtotal</span>
                    <span style="text-align: center;">Action</span>
                </div>

                <div class="cart-items-wrapper">
                    <% for(CartItem item : cart.getItems().values()){ %>
                        <div class="cart-card-row">
                            <!-- Product Info -->
                            <div class="cart-product-cell">
                                <img src="${pageContext.request.contextPath}/images/foods/<%=item.getImage()%>"
                                     class="cart-row-image"
                                     alt="<%=item.getItemName()%>">
                                <div class="cart-product-info">
                                    <h3><%=item.getItemName()%></h3>
                                    <span>Item #<%=item.getMenuId()%></span>
                                </div>
                            </div>

                            <!-- Price -->
                            <div class="cart-price-cell">
                                &#8377; <%=String.format("%.2f", item.getPrice())%>
                            </div>

                            <!-- Quantity Controller -->
                            <div class="cart-qty-cell">
                                <button class="qty-btn" onclick="updateQty(<%=item.getMenuId()%>, <%=item.getQuantity() - 1%>)">-</button>
                                <span class="qty-value"><%=item.getQuantity()%></span>
                                <button class="qty-btn" onclick="updateQty(<%=item.getMenuId()%>, <%=item.getQuantity() + 1%>)">+</button>
                            </div>

                            <!-- Subtotal -->
                            <div class="cart-subtotal-cell">
                                &#8377; <%=String.format("%.2f", item.getTotalPrice())%>
                            </div>

                            <!-- Delete -->
                            <div class="delete-cell">
                                <button class="cart-delete-btn" onclick="removeItem(<%=item.getMenuId()%>)">
                                    <i class="fa-regular fa-trash-can"></i>
                                </button>
                            </div>
                        </div>
                    <% } %>
                </div>

                <!-- Coupons & Update Cart Row -->
                <div class="coupon-wrapper">
                    <div class="coupon-left">
                        <input type="text" placeholder="Promo Code">
                        <button type="button">Enter Coupon</button>
                    </div>
                    <a href="${pageContext.request.contextPath}/RestaurantServlet" class="update-btn">
                        Update Cart
                    </a>
                </div>
            </div>

            <!-- Right Side: Order Summary -->
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

                <div class="summary-row total">
                    <span>Total</span>
                    <span>&#8377; <%=String.format("%.2f", grandTotal)%></span>
                </div>

                <a href="${pageContext.request.contextPath}/jsp/customer/checkout.jsp" class="checkout-btn">
                    Checkout <i class="fa-solid fa-circle-arrow-right" style="margin-left: 6px;"></i>
                </a>
            </div>
        </div>

        <!-- Footer Badges -->
        <div class="cart-badges-section">
            <div class="cart-badge-item">
                <i class="fa-solid fa-truck"></i>
                <div class="cart-badge-text">
                    <h4>Free Delivery</h4>
                    <p>For all orders over &#8377; 500.00</p>
                </div>
            </div>
            <div class="cart-badge-item">
                <i class="fa-solid fa-shield-halved"></i>
                <div class="cart-badge-text">
                    <h4>Fresh Guarantee</h4>
                    <p>100% Quality & Hygiene assurance</p>
                </div>
            </div>
            <div class="cart-badge-item">
                <i class="fa-solid fa-lock"></i>
                <div class="cart-badge-text">
                    <h4>Secure Payment</h4>
                    <p>100% Encrypted & Safe payments</p>
                </div>
            </div>
            <div class="cart-badge-item">
                <i class="fa-solid fa-headset"></i>
                <div class="cart-badge-text">
                    <h4>24/7 Support</h4>
                    <p>Dedicated instant customer support</p>
                </div>
            </div>
        </div>

    <% } else { %>
        <!-- Empty Cart Layout -->
        <div class="empty-cart-container">
            <div class="empty-cart-icon">
                <i class="fa-solid fa-cart-shopping"></i>
            </div>
            <h2>Your cart feels empty</h2>
            <p>Good food is always waiting for you. Explore our top restaurants and add your favorite dishes to your cart!</p>
            <a href="${pageContext.request.contextPath}/RestaurantServlet" class="empty-cart-btn">
                Explore Restaurants
            </a>
        </div>
    <% } %>

<script>
function updateQty(menuId, newQty) {
    if (newQty <= 0) {
        removeItem(menuId);
    } else {
        window.location.href = '${pageContext.request.contextPath}/CartServlet?menuId=' + menuId + '&action=update&quantity=' + newQty;
    }
}

function removeItem(menuId) {
    window.location.href = '${pageContext.request.contextPath}/CartServlet?menuId=' + menuId + '&action=remove';
}

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