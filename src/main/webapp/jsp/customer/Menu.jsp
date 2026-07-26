<%@page import="java.util.ArrayList"%>
<%@page import="com.fooddelivery.model.Menu"%>
<%@page import="com.fooddelivery.model.User"%>
<%@page import="com.fooddelivery.model.Restaurant"%>
<%@page import="com.fooddelivery.dao.RestaurantDAO"%>

<%
ArrayList<Menu> menuList =
(ArrayList<Menu>)request.getAttribute("menuList");

if(menuList == null){
    out.println("<h2 style='text-align:center; margin-top:50px; color:#555c66;'>No menu data received.</h2>");
    return;
}

User loggedUser = (User) session.getAttribute("loggedUser");

// Dynamically retrieve restaurant info
int restaurantId = 0;
if (menuList != null && !menuList.isEmpty()) {
    restaurantId = menuList.get(0).getRestaurantId();
} else {
    String restIdParam = request.getParameter("restaurantId");
    if (restIdParam != null) {
        restaurantId = Integer.parseInt(restIdParam);
    }
}

Restaurant restaurant = null;
if (restaurantId > 0) {
    RestaurantDAO restDAO = new RestaurantDAO();
    restaurant = restDAO.getRestaurantById(restaurantId);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Menu - FoodNest</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=1.2">
<style>
.menu-page {
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
    margin: 30px 8% 10px 8%;
    transition: transform 0.2s ease;
}

.back-link:hover {
    transform: translateX(-4px);
}

/* Restaurant Header Card */
.restaurant-header-card {
    background: #ffffff;
    border-radius: 24px;
    margin: 10px 8% 40px 8%;
    padding: 30px;
    display: flex;
    gap: 30px;
    box-shadow: 0 10px 30px rgba(26, 22, 21, 0.04);
    border: 1px solid rgba(26, 22, 21, 0.04);
}

.rest-header-image {
    width: 240px;
    height: 160px;
    object-fit: cover;
    border-radius: 16px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

.rest-header-details {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.rest-header-details h1 {
    font-size: 32px;
    font-weight: 800;
    color: #1A1615;
    margin-bottom: 4px;
}

.rest-header-details .cuisine {
    font-size: 14px;
    color: #E23744;
    font-weight: 600;
    margin-bottom: 12px;
}

.rest-header-details .desc {
    font-size: 14px;
    color: #6B625E;
    margin-bottom: 20px;
    line-height: 1.5;
}

.rest-badges {
    display: flex;
    gap: 15px;
    flex-wrap: wrap;
}

.rest-badge {
    background: #FAF6F0;
    border: 1px solid rgba(26, 22, 21, 0.05);
    color: #1A1615;
    padding: 6px 14px;
    border-radius: 30px;
    font-size: 13px;
    font-weight: 700;
    display: flex;
    align-items: center;
    gap: 6px;
}

.rest-badge.rating-badge-green {
    background: rgba(72, 196, 121, 0.1);
    color: #3ca864;
    border-color: rgba(72, 196, 121, 0.2);
}

.rest-badge.status {
    background: rgba(72, 196, 121, 0.1);
    color: #3ca864;
    border-color: rgba(72, 196, 121, 0.2);
}

/* Recommended Section */
.recommended-section {
    margin: 0 8% 60px 8%;
}

.accordion-title {
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 20px;
    font-weight: 800;
    color: #1A1615;
    border-bottom: 1px solid rgba(26, 22, 21, 0.08);
    padding-bottom: 15px;
    margin-bottom: 20px;
    cursor: pointer;
}

/* Food items list layout */
.menu-list-container {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.menu-item-row {
    background: #ffffff;
    border-radius: 20px;
    padding: 24px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 8px 25px rgba(26, 22, 21, 0.02);
    border: 1px solid rgba(26, 22, 21, 0.04);
    gap: 30px;
}

.menu-item-left {
    flex: 1;
}

.veg-icon {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 16px;
    height: 16px;
    border: 1.5px solid #3ca864;
    padding: 2px;
    border-radius: 2px;
    margin-bottom: 8px;
}

.veg-icon-dot {
    width: 7px;
    height: 7px;
    background-color: #3ca864;
    border-radius: 50%;
}

.menu-item-left h2 {
    font-size: 18px;
    font-weight: 800;
    color: #1A1615;
    margin-bottom: 4px;
}

.menu-item-left .price {
    font-size: 16px;
    font-weight: 700;
    color: #E23744;
    margin-bottom: 8px;
}

.menu-item-left .desc {
    font-size: 13px;
    color: #6B625E;
    line-height: 1.5;
}

.menu-item-right {
    position: relative;
    width: 120px;
    height: 120px;
    flex-shrink: 0;
}

.menu-item-right img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.06);
}

.menu-item-right .add-btn {
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    background: #ffffff;
    color: #E23744;
    border: 1px solid rgba(226, 55, 68, 0.2);
    padding: 6px 20px;
    border-radius: 30px;
    font-size: 12px;
    font-weight: 800;
    box-shadow: 0 4px 12px rgba(226, 55, 68, 0.15);
    text-decoration: none;
    transition: all 0.2s ease;
    white-space: nowrap;
}

.menu-item-right .add-btn:hover {
    background: #E23744;
    color: #ffffff;
    box-shadow: 0 4px 12px rgba(226, 55, 68, 0.3);
}

@media(max-width: 768px) {
    .restaurant-header-card {
        flex-direction: column;
        padding: 20px;
    }
    .rest-header-image {
        width: 100%;
        height: 180px;
    }
    .menu-item-row {
        flex-direction: column-reverse;
        align-items: flex-start;
        gap: 15px;
    }
    .menu-item-right {
        width: 100%;
        height: 160px;
    }
}
</style>
</head>
<body class="menu-page">

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
            <% } else { %>
                <li><a href="${pageContext.request.contextPath}/jsp/auth/login.jsp"><i class="fa-solid fa-right-to-bracket"></i> Login</a></li>
            <% } %>
        </ul>
    </nav>

    <!-- Back link -->
    <a href="${pageContext.request.contextPath}/RestaurantServlet" class="back-link">
        <i class="fa-solid fa-chevron-left"></i> Back to Restaurants
    </a>

    <!-- Restaurant Header Card -->
    <% if (restaurant != null) { %>
        <div class="restaurant-header-card">
            <img src="${pageContext.request.contextPath}/images/restaurants/<%=restaurant.getImage()%>?v=1.3"
                 alt="<%=restaurant.getRestaurantName()%>"
                 class="rest-header-image">
            <div class="rest-header-details">
                <span class="cuisine">Gourmet Cuisines</span>
                <h1><%=restaurant.getRestaurantName()%></h1>
                <p class="desc">Explore delicious, freshly cooked food from <%=restaurant.getRestaurantName()%>. Select your favorite dishes below and get them delivered hot to your doorstep.</p>
                <div class="rest-badges">
                    <span class="rest-badge rating-badge-green"><i class="fa-solid fa-star"></i> <%=restaurant.getRating()%></span>
                    <span class="rest-badge"><i class="fa-regular fa-clock"></i> <%=restaurant.getDeliveryTime()%></span>
                    <span class="rest-badge"><i class="fa-solid fa-indian-rupee-sign"></i> 250 for one</span>
                    <span class="rest-badge status"><i class="fa-solid fa-circle" style="font-size: 8px; color: #3ca864;"></i> Open now</span>
                </div>
            </div>
        </div>
    <% } %>

    <!-- Search Section -->
    <div class="search-section">
        <input type="text"
               placeholder="Search food items..."
               id="foodSearch"
               onkeyup="searchFood()">
    </div>

    <!-- Recommended accordion items list -->
    <section class="recommended-section">
        <div class="accordion-title" onclick="toggleAccordion()">
            <span>Recommended (<%=menuList.size()%>)</span>
            <i class="fa-solid fa-chevron-down" id="accordionCaret"></i>
        </div>

        <div class="menu-list-container" id="menuListWrapper">
            <% for(Menu menu : menuList){ %>
                <div class="menu-item-row">
                    <div class="menu-item-left">
                        <div class="veg-icon">
                            <div class="veg-icon-dot"></div>
                        </div>
                        <h2><%=menu.getItemName()%></h2>
                        <div class="price">&#8377; <%=String.format("%.0f", menu.getPrice())%></div>
                        <p class="desc"><%=menu.getDescription()%></p>
                    </div>

                    <div class="menu-item-right">
                        <img src="${pageContext.request.contextPath}/images/foods/<%=menu.getImage()%>"
                             alt="<%=menu.getItemName()%>">
                        <a href="${pageContext.request.contextPath}/CartServlet?menuId=<%=menu.getMenuId()%>"
                           class="add-btn">
                           ADD
                        </a>
                    </div>
                </div>
            <% } %>
        </div>
    </section>

<script>
function searchFood(){
    let input = document.getElementById("foodSearch").value.toLowerCase();
    let cards = document.getElementsByClassName("menu-item-row");
    for(let i=0; i<cards.length; i++){
        let text = cards[i]
            .getElementsByTagName("h2")[0]
            .innerText
            .toLowerCase();

        cards[i].style.display = text.includes(input) ? "flex" : "none";
    }
}

function toggleAccordion() {
    let container = document.getElementById("menuListWrapper");
    let caret = document.getElementById("accordionCaret");
    if (container.style.display === "none") {
        container.style.display = "flex";
        caret.className = "fa-solid fa-chevron-down";
    } else {
        container.style.display = "none";
        caret.className = "fa-solid fa-chevron-right";
    }
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