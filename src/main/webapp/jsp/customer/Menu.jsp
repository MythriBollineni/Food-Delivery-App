<%@page import="java.util.ArrayList"%>
<%@page import="com.fooddelivery.model.Menu"%>
<%@page import="com.fooddelivery.model.User"%>

<%
ArrayList<Menu> menuList =
(ArrayList<Menu>)request.getAttribute("menuList");

if(menuList == null){
    out.println("<h2 style='text-align:center; margin-top:50px; color:#555c66;'>No menu data received.</h2>");
    return;
}

User loggedUser = (User) session.getAttribute("loggedUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Menu - FoodNest</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

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

    <h1 class="menu-title">Restaurant Menu</h1>

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
                    <div>
                        <span class="category-badge">
                            <%=menu.getCategory()%>
                        </span>
                        <h2><%=menu.getItemName()%></h2>
                        <p class="description">
                            <%=menu.getDescription()%>
                        </p>
                    </div>

                    <div>
                        <div class="food-bottom">
                            <div class="price">
                                &#8377; <%=String.format("%.0f", menu.getPrice())%>
                            </div>
                            <div class="rating">
                                <i class="fa-solid fa-star"></i> <%=rating%>
                            </div>
                        </div>

                        <a href="${pageContext.request.contextPath}/CartServlet?menuId=<%=menu.getMenuId()%>"
                           class="cart-btn">
                            <i class="fa-solid fa-cart-plus" style="margin-right: 6px;"></i> Add to Cart
                        </a>
                    </div>
                </div>
            </div>
        <% } %>
    </div>

<script>
function searchFood(){
    let input = document.getElementById("foodSearch").value.toLowerCase();
    let cards = document.getElementsByClassName("food-card");
    for(let i=0; i<cards.length; i++){
        let text = cards[i]
            .getElementsByTagName("h2")[0]
            .innerText
            .toLowerCase();

        cards[i].style.display = text.includes(input) ? "flex" : "none";
    }
}
</script>

</body>
</html>