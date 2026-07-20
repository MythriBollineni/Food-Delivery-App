<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Order Successful</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/orderSuccess.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>

<body>

<div class="success-container">

    <div class="success-card">

        <div class="success-icon">
            <i class="fa-solid fa-circle-check"></i>
        </div>

        <h1>Order Placed Successfully!</h1>

        <p class="message">
            Thank you for ordering with <b>FoodNest</b>.
        </p>

        <div class="delivery">

            <p>
                <i class="fa-solid fa-truck-fast"></i>
                Estimated Delivery :
                <b>30 Minutes</b>
            </p>

        </div>

        <div class="buttons">

            <a href="${pageContext.request.contextPath}/RestaurantServlet"
               class="shop-btn">

                Continue Shopping

            </a>

            <a href="${pageContext.request.contextPath}/OrderHistoryServlet"
               class="history-btn">

                View My Orders

            </a>

        </div>

    </div>

</div>

</body>
</html>