<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Successful - FoodNest</title>

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

                Continue Shopping <i class="fa-solid fa-circle-arrow-right" style="margin-left: 6px;"></i>

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