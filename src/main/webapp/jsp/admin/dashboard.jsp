<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Admin Dashboard</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>

<body>

<div class="sidebar">

    <h2>FoodNest Admin</h2>

    <a href="dashboard.jsp">
        <i class="fa-solid fa-chart-line"></i>
        Dashboard
    </a>

    <a href="${pageContext.request.contextPath}/ViewRestaurantsServlet">
        <i class="fa-solid fa-store"></i>
        Restaurants
    </a>

    <a href="${pageContext.request.contextPath}/ViewMenuServlet">
        <i class="fa-solid fa-utensils"></i>
        Menu
    </a>

    <a href="${pageContext.request.contextPath}/AdminOrderServlet">
        <i class="fa-solid fa-box"></i>
        Orders
    </a>

    <a href="${pageContext.request.contextPath}/ViewUsersServlet">
   		 <i class="fa-solid fa-users"></i>
    	 Users
	</a>

</div>

<div class="main">

<h1>Dashboard</h1>

<div class="cards">

    <!-- Restaurants -->
    <div class="card"
         onclick="location.href='${pageContext.request.contextPath}/ViewRestaurantsServlet'">

        <h2>${restaurantCount}</h2>
        <p>Restaurants</p>

    </div>

    <!-- Menu -->
    <div class="card"
         onclick="location.href='${pageContext.request.contextPath}/ViewMenuServlet'">

        <h2>${menuCount}</h2>
        <p>Menu Items</p>

    </div>

    <!-- Orders -->
    <div class="card"
         onclick="location.href='${pageContext.request.contextPath}/AdminOrderServlet'">

        <h2>${orderCount}</h2>
        <p>Orders</p>

    </div>

    <div class="card"
     		onclick="location.href='${pageContext.request.contextPath}/ViewRevenueServlet'">

    		<h2>&#8377; ${revenue}</h2>

    		<p>Revenue</p>

	</div>
	
	<div class="card"
    		 onclick="location.href='${pageContext.request.contextPath}/ViewUsersServlet'">
    		 <h2>${userCount}</h2>
    		 <p>Users</p>
	</div>

</div>

</div>

</body>
</html>