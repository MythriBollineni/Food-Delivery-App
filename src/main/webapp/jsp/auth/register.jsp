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
    background: linear-gradient(135deg, #F5F7FA 0%, #E8ECF2 100%);
    position: relative;
    overflow-x: hidden;
    padding: 40px 20px;
}

/* Floating blur background circles for modern premium look */
.bg-circle {
    position: absolute;
    border-radius: 50%;
    filter: blur(80px);
    z-index: 1;
    opacity: 0.5;
}

.bg-circle-1 {
    width: 300px;
    height: 300px;
    background: #E25822;
    top: 5%;
    left: 15%;
}

.bg-circle-2 {
    width: 350px;
    height: 350px;
    background: #F5A623;
    bottom: 5%;
    right: 15%;
}

.register-card {
    position: relative;
    z-index: 2;
    width: 100%;
    max-width: 460px;
    background: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    border-radius: 28px;
    padding: 40px 35px;
    box-shadow: 0 20px 45px rgba(30, 32, 34, 0.08);
    border: 1px solid rgba(255, 255, 255, 0.6);
    text-align: center;
}

.brand-header {
    margin-bottom: 25px;
}

.brand-icon {
    width: 60px;
    height: 60px;
    border-radius: 18px;
    background: linear-gradient(135deg, #E25822 0%, #F5A623 100%);
    color: #ffffff;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 26px;
    margin: 0 auto 12px auto;
    box-shadow: 0 8px 20px rgba(226, 88, 34, 0.25);
}

.brand-header h1 {
    font-size: 26px;
    font-weight: 800;
    color: #1E2022;
    margin-bottom: 6px;
}

.brand-header p {
    font-size: 14px;
    color: #677788;
}

.form-group {
    margin-bottom: 15px;
    text-align: left;
}

.form-group label {
    display: block;
    margin-bottom: 6px;
    font-size: 13px;
    font-weight: 700;
    color: #1E2022;
}

.input-wrapper {
    position: relative;
}

.input-wrapper .input-icon {
    position: absolute;
    left: 16px;
    top: 50%;
    transform: translateY(-50%);
    color: #9CA3AF;
    font-size: 14px;
}

.address-wrapper .input-icon {
    top: 18px;
    transform: none;
}

.input-wrapper input {
    width: 100%;
    padding: 12px 16px 12px 46px;
    border: 1px solid rgba(30, 32, 34, 0.12);
    border-radius: 12px;
    font-size: 14px;
    color: #1E2022;
    background-color: #ffffff;
    outline: none;
    transition: all 0.25s ease;
}

.input-wrapper textarea {
    width: 100%;
    padding: 12px 16px 12px 46px;
    border: 1px solid rgba(30, 32, 34, 0.12);
    border-radius: 12px;
    font-size: 14px;
    color: #1E2022;
    background-color: #ffffff;
    outline: none;
    resize: none;
    height: 70px;
    transition: all 0.25s ease;
}

.input-wrapper input:focus, .input-wrapper textarea:focus {
    border-color: #E25822;
    box-shadow: 0 0 0 4px rgba(226, 88, 34, 0.1);
}

.input-wrapper input:focus + .input-icon, .input-wrapper textarea:focus + .input-icon {
    color: #E25822;
}

.submit-btn {
    width: 100%;
    padding: 13px;
    border: none;
    border-radius: 12px;
    background: linear-gradient(135deg, #E25822 0%, #F5A623 100%);
    color: #ffffff;
    font-size: 15px;
    font-weight: 700;
    cursor: pointer;
    box-shadow: 0 6px 18px rgba(226, 88, 34, 0.2);
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 8px;
    transition: all 0.25s ease;
    margin-top: 15px;
}

.submit-btn:hover {
    box-shadow: 0 8px 22px rgba(226, 88, 34, 0.35);
    transform: translateY(-1px);
}

.links {
    margin-top: 20px;
    font-size: 13px;
    color: #677788;
    font-weight: 500;
}

.links a {
    text-decoration: none;
    color: #E25822;
    font-weight: 700;
}

.links a:hover {
    text-decoration: underline;
}

.footer-text {
    margin-top: 25px;
    font-size: 11px;
    color: #9CA3AF;
    border-top: 1px solid rgba(30, 32, 34, 0.05);
    padding-top: 15px;
}
</style>
</head>
<body>

    <!-- Background decorative blur shapes -->
    <div class="bg-circle bg-circle-1"></div>
    <div class="bg-circle bg-circle-2"></div>

    <div class="register-card">
        <div class="brand-header">
            <div class="brand-icon">
                <i class="fa-solid fa-bowl-food"></i>
            </div>
            <h1>Create Account</h1>
            <p>Sign up to start ordering fresh food.</p>
        </div>

        <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
            <div class="form-group">
                <label for="name">Full Name</label>
                <div class="input-wrapper">
                    <input type="text"
                           id="name"
                           name="name"
                           placeholder="John Doe"
                           required>
                    <i class="fa-regular fa-user input-icon"></i>
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <div class="input-wrapper">
                    <input type="email"
                           id="email"
                           name="email"
                           placeholder="john@example.com"
                           required>
                    <i class="fa-regular fa-envelope input-icon"></i>
                </div>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <div class="input-wrapper">
                    <input type="password"
                           id="password"
                           name="password"
                           placeholder="••••••••"
                           required>
                    <i class="fa-solid fa-lock input-icon"></i>
                </div>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <div class="input-wrapper">
                    <input type="text"
                           id="phone"
                           name="phone"
                           placeholder="10-digit mobile number"
                           required>
                    <i class="fa-solid fa-phone input-icon"></i>
                </div>
            </div>

            <div class="form-group">
                <label for="address">Delivery Address</label>
                <div class="input-wrapper address-wrapper">
                    <textarea id="address"
                              name="address"
                              placeholder="Enter flat/house no, street, city..."
                              required></textarea>
                    <i class="fa-solid fa-location-dot input-icon"></i>
                </div>
            </div>

            <button type="submit" class="submit-btn">
                Register <i class="fa-solid fa-user-plus"></i>
            </button>
        </form>

        <div class="links">
            Already have an account? 
            <a href="${pageContext.request.contextPath}/jsp/auth/login.jsp">Login</a>
        </div>

        <div class="footer-text">
            🍕 FoodNest Secure Registration Protocol
        </div>
    </div>

</body>
</html>