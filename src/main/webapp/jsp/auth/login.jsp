<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    background: 
        radial-gradient(circle at 15% 15%, rgba(252, 128, 25, 0.22) 0%, transparent 50%),
        radial-gradient(circle at 85% 20%, rgba(255, 94, 98, 0.18) 0%, transparent 50%),
        radial-gradient(circle at 50% 50%, rgba(252, 128, 25, 0.08) 0%, transparent 60%),
        linear-gradient(135deg, rgba(13, 10, 9, 0.92) 0%, rgba(5, 4, 4, 0.96) 100%),
        url("${pageContext.request.contextPath}/images/banners/banner.jpg") no-repeat center center fixed;
    background-size: 100% 100%, 100% 100%, 100% 100%, 100% 100%, cover;
    padding: 20px;
    position: relative;
    overflow-x: hidden;
}

/* Background glowing blob for premium feel */
body::before {
    content: '';
    position: absolute;
    width: 300px;
    height: 300px;
    background: rgba(252, 128, 25, 0.15);
    border-radius: 50%;
    filter: blur(80px);
    top: 20%;
    left: 30%;
    z-index: 0;
    pointer-events: none;
}

body::after {
    content: '';
    position: absolute;
    width: 250px;
    height: 250px;
    background: rgba(255, 94, 98, 0.15);
    border-radius: 50%;
    filter: blur(80px);
    bottom: 20%;
    right: 30%;
    z-index: 0;
    pointer-events: none;
}

.container {
    width: 100%;
    max-width: 440px;
    background: rgba(255, 255, 255, 0.07);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    padding: 50px 40px;
    border-radius: 28px;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
    border: 1px solid rgba(255, 255, 255, 0.08);
    text-align: center;
    position: relative;
    z-index: 1;
    animation: fadeIn 0.8s cubic-bezier(0.16, 1, 0.3, 1);
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.logo-container {
    margin-bottom: 25px;
    display: inline-block;
}

.icon-wrapper {
    width: 80px;
    height: 80px;
    background: linear-gradient(135deg, #FC8019 0%, #ff5e62 100%);
    border-radius: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0 auto 15px auto;
    box-shadow: 0 8px 20px rgba(252, 128, 25, 0.3);
    transform: rotate(-5deg);
    transition: transform 0.3s ease;
}

.icon-wrapper:hover {
    transform: rotate(0deg) scale(1.05);
}

.icon-wrapper i {
    font-size: 38px;
    color: #ffffff;
}

h2 {
    font-size: 26px;
    font-weight: 800;
    color: #ffffff;
    margin-bottom: 30px;
    letter-spacing: -0.5px;
}

.input-group {
    margin-bottom: 22px;
    text-align: left;
}

.input-group label {
    display: block;
    margin-bottom: 8px;
    font-weight: 600;
    font-size: 14px;
    color: #cbd5e1;
    letter-spacing: 0.2px;
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
    color: #9ca3af;
    font-size: 16px;
    transition: color 0.3s ease, transform 0.3s ease;
}

.input-wrapper input {
    width: 100%;
    padding: 14px 16px 14px 48px;
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 12px;
    font-size: 15px;
    color: #ffffff;
    background-color: rgba(255, 255, 255, 0.05);
    outline: none;
    transition: all 0.3s ease;
}

.input-wrapper input:focus {
    border-color: #FC8019;
    background-color: rgba(255, 255, 255, 0.1);
    box-shadow: 0 0 0 4px rgba(252, 128, 25, 0.2);
}

.input-wrapper input:focus + .input-icon {
    color: #FC8019;
    transform: translateY(-50%) scale(1.05);
}

button {
    width: 100%;
    padding: 15px;
    border: none;
    border-radius: 12px;
    background: linear-gradient(135deg, #FC8019 0%, #ff5e62 100%);
    color: #ffffff;
    font-size: 16px;
    font-weight: 700;
    cursor: pointer;
    box-shadow: 0 6px 18px rgba(252, 128, 25, 0.25);
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 8px;
    transition: all 0.3s ease;
    margin-top: 10px;
}

button:hover {
    box-shadow: 0 8px 22px rgba(252, 128, 25, 0.4);
    transform: translateY(-2px);
}

button:active {
    transform: translateY(0);
}

.links {
    margin-top: 25px;
    font-size: 14px;
    color: #9ca3af;
    font-weight: 500;
}

.links a {
    text-decoration: none;
    color: #FC8019;
    font-weight: 700;
    transition: color 0.2s ease;
}

.links a:hover {
    color: #ff5e62;
}

.footer {
    margin-top: 35px;
    font-size: 13px;
    color: #9ca3af;
    border-top: 1px solid rgba(255, 255, 255, 0.08);
    padding-top: 18px;
    font-weight: 500;
}
</style>
</head>
<body>

<div class="container">
    <div class="logo-container">
        <div class="icon-wrapper">
            <i class="fa-solid fa-bowl-food"></i>
        </div>
    </div>

    <h2>Customer Login</h2>

    <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
        <div class="input-group">
            <label for="email">Email</label>
            <div class="input-wrapper">
                <input type="email"
                       id="email"
                       name="email"
                       placeholder="Enter your email"
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
                       placeholder="Enter your password"
                       required>
                <i class="fa-solid fa-lock input-icon"></i>
            </div>
        </div>

        <button type="submit">
            <i class="fa-solid fa-right-to-bracket"></i> Login
        </button>
    </form>

    <div class="links">
        Don't have an account? 
        <a href="<%=request.getContextPath()%>/jsp/auth/register.jsp">Create Account</a>
    </div>

    <div class="footer">
        🍕 Welcome to FoodNest
    </div>
</div>

</body>
</html>