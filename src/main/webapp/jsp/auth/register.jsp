<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Registration - FoodNest</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Outfit', sans-serif;
}

body {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #FAF6F0; /* Soft beige background */
    padding: 40px 20px;
    overflow-x: hidden;
}

.split-container {
    display: flex;
    width: 100%;
    max-width: 960px;
    height: 720px; /* Taller for registration fields */
    background: #ffffff;
    border-radius: 28px;
    box-shadow: 0 20px 50px rgba(26, 22, 21, 0.08);
    border: 1px solid rgba(26, 22, 21, 0.05);
    overflow: hidden;
}

/* Left Panel */
.promo-panel {
    width: 50%;
    background-color: #FDFBF7; /* Slightly lighter cream */
    padding: 40px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    border-right: 1px solid rgba(26, 22, 21, 0.04);
}

.promo-panel .logo {
    font-size: 24px;
    font-weight: 800;
    background: linear-gradient(135deg, #E23744 0%, #F47B20 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-decoration: none;
    display: flex;
    align-items: center;
    gap: 8px;
}

.promo-panel .logo i {
    color: #E23744;
    -webkit-text-fill-color: initial;
}

.promo-content h1 {
    font-size: 32px;
    font-weight: 800;
    color: #1A1615;
    line-height: 1.25;
    margin-bottom: 8px;
}

.promo-content .tagline {
    font-size: 16px;
    color: #E23744;
    font-weight: 600;
    margin-bottom: 30px;
}

.features {
    list-style: none;
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.features li {
    display: flex;
    gap: 15px;
    align-items: flex-start;
}

.feat-icon {
    width: 24px;
    height: 24px;
    border-radius: 50%;
    background-color: rgba(226, 55, 68, 0.1);
    color: #E23744;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 12px;
    flex-shrink: 0;
    margin-top: 2px;
}

.feat-text {
    display: flex;
    flex-direction: column;
}

.feat-text strong {
    font-size: 15px;
    font-weight: 700;
    color: #1A1615;
}

.feat-text span {
    font-size: 13px;
    color: #6B625E;
}

.promo-image-wrapper {
    width: 100%;
    height: 200px;
    border-radius: 20px;
    overflow: hidden;
    margin-top: 20px;
    box-shadow: 0 8px 24px rgba(26, 22, 21, 0.06);
}

.promo-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

/* Right Panel */
.form-panel {
    width: 50%;
    padding: 40px 45px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    overflow-y: auto;
}

.form-header h2 {
    font-size: 28px;
    font-weight: 800;
    color: #1A1615;
    margin-bottom: 6px;
}

.form-header p {
    font-size: 14px;
    color: #6B625E;
    margin-bottom: 20px;
}

.input-group {
    margin-bottom: 14px;
}

.input-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: 600;
    font-size: 13px;
    color: #1A1615;
}

.input-wrapper {
    position: relative;
    width: 100%;
}

.input-wrapper .input-icon {
    position: absolute;
    left: 16px;
    top: 50%;
    transform: translateY(-50%);
    color: #9CA3AF;
    font-size: 15px;
    transition: color 0.3s ease;
}

.address-wrapper .input-icon {
    top: 20px;
    transform: none;
}

.input-wrapper input {
    width: 100%;
    padding: 11px 16px 11px 44px;
    border: 1px solid rgba(26, 22, 21, 0.12);
    border-radius: 12px;
    font-size: 14px;
    color: #1A1615;
    background-color: #FAF9F6;
    outline: none;
    transition: all 0.3s ease;
}

.input-wrapper textarea {
    width: 100%;
    padding: 11px 16px 11px 44px;
    border: 1px solid rgba(26, 22, 21, 0.12);
    border-radius: 12px;
    font-size: 14px;
    color: #1A1615;
    background-color: #FAF9F6;
    outline: none;
    resize: none;
    height: 70px;
    transition: all 0.3s ease;
}

.input-wrapper input:focus, .input-wrapper textarea:focus {
    border-color: #E23744;
    background-color: #ffffff;
    box-shadow: 0 0 0 4px rgba(226, 55, 68, 0.1);
}

.input-wrapper input:focus + .input-icon, .input-wrapper textarea:focus + .input-icon {
    color: #E23744;
}

button {
    width: 100%;
    padding: 13px;
    border: none;
    border-radius: 12px;
    background: linear-gradient(135deg, #E23744 0%, #F47B20 100%);
    color: #ffffff;
    font-size: 15px;
    font-weight: 700;
    cursor: pointer;
    box-shadow: 0 6px 18px rgba(226, 55, 68, 0.2);
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 8px;
    transition: all 0.3s ease;
    margin-top: 15px;
}

button:hover {
    box-shadow: 0 8px 22px rgba(226, 55, 68, 0.3);
    transform: translateY(-1px);
}

.links {
    margin-top: 15px;
    font-size: 13px;
    color: #6B625E;
    text-align: center;
    font-weight: 500;
}

.links a {
    text-decoration: none;
    color: #E23744;
    font-weight: 700;
}

.links a:hover {
    text-decoration: underline;
}

/* Responsiveness */
@media (max-width: 768px) {
    .split-container {
        flex-direction: column;
        height: auto;
        max-width: 440px;
    }
    .promo-panel {
        width: 100%;
        border-right: none;
        border-bottom: 1px solid rgba(26, 22, 21, 0.04);
        padding: 30px;
    }
    .form-panel {
        width: 100%;
        padding: 35px 30px;
    }
    .promo-image-wrapper {
        display: none;
    }
}
</style>
</head>
<body>

<div class="split-container">
    <!-- Left Panel (Showcase) -->
    <div class="promo-panel">
        <div class="brand">
            <a href="${pageContext.request.contextPath}/jsp/customer/home.jsp" class="logo">
                <i class="fa-solid fa-bowl-food"></i> FoodNest
            </a>
        </div>
        <div class="promo-content">
            <h1>Good food, great mood, better life.</h1>
            <p class="tagline">Eat healthy, live happy.</p>
            
            <ul class="features">
                <li>
                    <div class="feat-icon"><i class="fa-solid fa-check"></i></div>
                    <div class="feat-text">
                        <strong>100% Fresh Ingredients</strong>
                        <span>Carefully selected for your health</span>
                    </div>
                </li>
                <li>
                    <div class="feat-icon"><i class="fa-solid fa-check"></i></div>
                    <div class="feat-text">
                        <strong>Healthy & Delicious</strong>
                        <span>Nutritious treats you'll love</span>
                    </div>
                </li>
                <li>
                    <div class="feat-icon"><i class="fa-solid fa-check"></i></div>
                    <div class="feat-text">
                        <strong>Fast & Hot Delivery</strong>
                        <span>Delivered fresh to your doorstep</span>
                    </div>
                </li>
            </ul>
        </div>
        <div class="promo-image-wrapper">
            <img src="${pageContext.request.contextPath}/images/foods/pizza.jpg" alt="Delicious Pizza" class="promo-image">
        </div>
    </div>
    
    <!-- Right Panel (Form) -->
    <div class="form-panel">
        <div class="form-header">
            <h2>Create Account</h2>
            <p>Sign up to start ordering your favourite food.</p>
        </div>
        
        <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
            <div class="input-group">
                <label for="name">Full Name</label>
                <div class="input-wrapper">
                    <input type="text"
                           id="name"
                           name="name"
                           placeholder="Enter Name"
                           required>
                    <i class="fa-regular fa-user input-icon"></i>
                </div>
            </div>

            <div class="input-group">
                <label for="email">Email Address</label>
                <div class="input-wrapper">
                    <input type="email"
                           id="email"
                           name="email"
                           placeholder="Enter Email"
                           required>
                    <i class="fa-regular fa-envelope input-icon"></i>
                </div>
            </div>

            <div class="input-group">
                <label for="password">Password</label>
                <div class="input-wrapper">
                    <input type="password"
                           id="password"
                           name="password"
                           placeholder="Enter Password"
                           required>
                    <i class="fa-solid fa-lock input-icon"></i>
                </div>
            </div>

            <div class="input-group">
                <label for="phone">Phone Number</label>
                <div class="input-wrapper">
                    <input type="text"
                           id="phone"
                           name="phone"
                           placeholder="Enter Phone Number"
                           required>
                    <i class="fa-solid fa-phone input-icon"></i>
                </div>
            </div>

            <div class="input-group">
                <label for="address">Delivery Address</label>
                <div class="input-wrapper address-wrapper">
                    <textarea id="address"
                              name="address"
                              placeholder="Enter Address"
                              required></textarea>
                    <i class="fa-solid fa-location-dot input-icon"></i>
                </div>
            </div>

            <button type="submit">
                <i class="fa-solid fa-user-plus"></i> Register
            </button>
        </form>
        
        <div class="links">
            Already have an account? 
            <a href="<%=request.getContextPath()%>/jsp/auth/login.jsp">Login</a>
        </div>
    </div>
</div>

</body>
</html>