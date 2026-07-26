<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String status = request.getParameter("status");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Login - FoodNest</title>
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
    padding: 20px;
    overflow-x: hidden;
}

.split-container {
    display: flex;
    width: 100%;
    max-width: 960px;
    height: 660px;
    background: #ffffff;
    border-radius: 28px;
    box-shadow: 0 20px 50px rgba(26, 22, 21, 0.08);
    border: 1px solid rgba(26, 22, 21, 0.05);
    overflow: hidden;
    position: relative;
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
    position: relative;
}

.promo-panel .logo {
    font-size: 24px;
    font-weight: 800;
    color: #1A1615;
    text-decoration: none;
    display: flex;
    align-items: center;
    gap: 8px;
}

.promo-panel .logo span {
    color: #E65A28;
}

.promo-panel .logo i {
    color: #E65A28;
}

.promo-content h1 {
    font-size: 32px;
    font-weight: 800;
    color: #1A1615;
    line-height: 1.25;
    margin-bottom: 8px;
}

.promo-content .tagline {
    font-size: 14px;
    color: #E65A28;
    font-weight: 700;
    margin-bottom: 25px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.features {
    list-style: none;
    display: flex;
    flex-direction: column;
    gap: 16px;
}

.features li {
    display: flex;
    gap: 12px;
    align-items: flex-start;
}

.feat-icon {
    width: 22px;
    height: 22px;
    border-radius: 50%;
    background-color: rgba(230, 90, 40, 0.1);
    color: #E65A28;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 11px;
    flex-shrink: 0;
    margin-top: 2px;
}

.feat-text {
    display: flex;
    flex-direction: column;
}

.feat-text strong {
    font-size: 14px;
    font-weight: 700;
    color: #1A1615;
}

.feat-text span {
    font-size: 12px;
    color: #6B625E;
}

.promo-image-wrapper {
    width: 100%;
    height: 170px;
    border-radius: 20px;
    overflow: hidden;
    margin-top: 15px;
    box-shadow: 0 8px 24px rgba(26, 22, 21, 0.06);
}

.promo-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

/* Badge absolute overlap */
.badge-50 {
    position: absolute;
    right: -25px;
    top: 35%;
    width: 50px;
    height: 50px;
    background: linear-gradient(135deg, #E65A28 0%, #F47B20 100%);
    border-radius: 50%;
    color: #ffffff;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    font-size: 10px;
    font-weight: 800;
    box-shadow: 0 4px 15px rgba(230, 90, 40, 0.3);
    z-index: 10;
    border: 3px solid #ffffff;
}

.badge-50 span {
    line-height: 1;
}

/* Right Panel */
.form-panel {
    width: 50%;
    padding: 40px 45px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    background: #ffffff;
}

.form-header {
    margin-bottom: 20px;
}

.form-header h2 {
    font-size: 28px;
    font-weight: 800;
    color: #1A1615;
    margin-bottom: 6px;
}

.form-header p {
    font-size: 13px;
    color: #6B625E;
}

/* Status Banner */
.status-banner {
    padding: 12px 16px;
    border-radius: 12px;
    font-size: 13px;
    font-weight: 600;
    margin-bottom: 20px;
    text-align: left;
    display: flex;
    align-items: center;
    gap: 8px;
}

.status-banner.success {
    background-color: #E6F4EA;
    color: #137333;
    border: 1px solid #CEEAD6;
}

.status-banner.error {
    background-color: #FCE8E6;
    color: #C5221F;
    border: 1px solid #FAD2CF;
}

.input-group {
    margin-bottom: 16px;
}

.input-group label {
    display: block;
    margin-bottom: 6px;
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
    font-size: 14px;
}

.input-wrapper input {
    width: 100%;
    padding: 12px 16px 12px 44px;
    border: 1px solid rgba(26, 22, 21, 0.12);
    border-radius: 12px;
    font-size: 14px;
    color: #1A1615;
    background-color: #FAF9F6;
    outline: none;
    transition: all 0.25s ease;
}

.input-wrapper input:focus {
    border-color: #E65A28;
    background-color: #ffffff;
    box-shadow: 0 0 0 4px rgba(230, 90, 40, 0.1);
}

.input-wrapper input:focus + .input-icon {
    color: #E65A28;
}

.forgot-link {
    display: block;
    text-align: right;
    font-size: 12px;
    color: #6B625E;
    text-decoration: none;
    margin-top: -10px;
    margin-bottom: 20px;
    font-weight: 500;
}

.forgot-link:hover {
    color: #E65A28;
    text-decoration: underline;
}

.submit-btn {
    width: 100%;
    padding: 14px;
    border: none;
    border-radius: 12px;
    background: linear-gradient(135deg, #E65A28 0%, #F47B20 100%);
    color: #ffffff;
    font-size: 15px;
    font-weight: 700;
    cursor: pointer;
    box-shadow: 0 6px 18px rgba(230, 90, 40, 0.2);
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 8px;
    transition: all 0.25s ease;
}

.submit-btn:hover {
    box-shadow: 0 8px 22px rgba(230, 90, 40, 0.35);
    transform: translateY(-1px);
}

.divider {
    display: flex;
    align-items: center;
    text-align: center;
    margin: 20px 0;
    font-size: 12px;
    color: #9CA3AF;
}

.divider::before, .divider::after {
    content: '';
    flex: 1;
    border-bottom: 1px solid rgba(26, 22, 21, 0.06);
}

.divider:not(:empty)::before {
    margin-right: .5em;
}

.divider:not(:empty)::after {
    margin-left: .5em;
}

/* Social Buttons */
.social-buttons {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.social-btn {
    width: 100%;
    padding: 12px;
    border: 1px solid rgba(26, 22, 21, 0.1);
    border-radius: 12px;
    background-color: #ffffff;
    color: #1A1615;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 10px;
    transition: all 0.25s ease;
}

.social-btn:hover {
    background-color: #FAF9F6;
    border-color: rgba(26, 22, 21, 0.18);
}

.social-btn.google i {
    color: #DB4437;
}

.social-btn.facebook i {
    color: #4267B2;
}

.links {
    margin-top: 20px;
    font-size: 13px;
    color: #6B625E;
    text-align: center;
    font-weight: 500;
}

.links a {
    text-decoration: none;
    color: #E65A28;
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
        padding: 30px 25px;
    }
    .form-panel {
        width: 100%;
        padding: 35px 25px;
    }
    .promo-image-wrapper {
        display: none;
    }
    .badge-50 {
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
                <i class="fa-solid fa-bowl-food"></i> Meal<span>time</span>
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
            <img src="${pageContext.request.contextPath}/images/foods/pizza.jpg" alt="Delicious Salad" class="promo-image">
        </div>
        
        <!-- Center absolute 50% OFF badge -->
        <div class="badge-50">
            <span>50%</span>
            <span>OFF</span>
        </div>
    </div>
    
    <!-- Right Panel (Form) -->
    <div class="form-panel">
        <div>
            <div class="form-header">
                <h2>Welcome Back</h2>
                <p>Sign in with your Email and Password to continue.</p>
            </div>
            
            <% if ("success".equals(status)) { %>
                <div class="status-banner success">
                    <i class="fa-solid fa-circle-check"></i> Registration successful. Please log in.
                </div>
            <% } else if ("invalid".equals(status)) { %>
                <div class="status-banner error">
                    <i class="fa-solid fa-circle-exclamation"></i> Invalid email or password. Please try again.
                </div>
            <% } %>
            
            <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
                <div class="input-group">
                    <label for="email">Email</label>
                    <div class="input-wrapper">
                        <input type="email"
                               id="email"
                               name="email"
                               placeholder="sarika@gmail.com"
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
                               placeholder="Password"
                               required>
                        <i class="fa-solid fa-lock input-icon"></i>
                    </div>
                </div>
                
                <a href="#" class="forgot-link">Forgot Password?</a>
        
                <button type="submit" class="submit-btn">
                    SIGN IN
                </button>
            </form>
            
            <div class="divider">or sign in with</div>
            
            <div class="social-buttons">
                <button class="social-btn google">
                    <i class="fa-brands fa-google"></i> Continue with Google
                </button>
                <button class="social-btn facebook">
                    <i class="fa-brands fa-facebook-f"></i> Continue with Facebook
                </button>
            </div>
        </div>
        
        <div class="links">
            Don't have an account? 
            <a href="${pageContext.request.contextPath}/jsp/auth/register.jsp">Sign up</a>
        </div>
    </div>
</div>

</body>
</html>