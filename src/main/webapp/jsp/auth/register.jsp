<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Registration - FoodNest</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #f9fafb;
    padding: 40px 20px;
}

.container {
    width: 440px;
    background: #ffffff;
    padding: 45px 35px;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
    border: 1px solid #f1f2f4;
    text-align: center;
}

.icon {
    font-size: 54px;
    color: #FC8019;
    margin-bottom: 15px;
}

h2 {
    font-size: 24px;
    font-weight: 700;
    color: #1f2229;
    margin-bottom: 30px;
}

input, textarea {
    width: 100%;
    padding: 13px 18px;
    margin-bottom: 20px;
    border: 1px solid #e1e3e6;
    border-radius: 10px;
    font-size: 15px;
    color: #2b2f38;
    outline: none;
    background-color: #fafbfc;
    transition: all 0.2s ease;
}

input:focus, textarea:focus {
    border-color: #FC8019;
    background-color: #ffffff;
    box-shadow: 0 0 0 3px rgba(252, 128, 25, 0.12);
}

textarea {
    resize: none;
    height: 100px;
    font-family: inherit;
}

button {
    width: 100%;
    padding: 14px;
    border: none;
    border-radius: 10px;
    background-color: #FC8019;
    color: #ffffff;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    box-shadow: 0 4px 12px rgba(252, 128, 25, 0.2);
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 8px;
    transition: all 0.2s ease;
}

button:hover {
    background-color: #e57010;
    box-shadow: 0 4px 15px rgba(252, 128, 25, 0.35);
}

.links {
    margin-top: 25px;
    font-size: 14px;
    color: #687280;
}

.links a {
    text-decoration: none;
    color: #FC8019;
    font-weight: 600;
    transition: color 0.2s ease;
}

.links a:hover {
    color: #e57010;
}
</style>
</head>
<body>

<div class="container">
    <div class="icon">
        <i class="fa-solid fa-user-plus"></i>
    </div>

    <h2>Customer Registration</h2>

    <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
        <input type="text"
               name="name"
               placeholder="Enter Name"
               required>

        <input type="email"
               name="email"
               placeholder="Enter Email"
               required>

        <input type="password"
               name="password"
               placeholder="Enter Password"
               required>

        <input type="text"
               name="phone"
               placeholder="Enter Phone Number"
               required>

        <textarea name="address"
                  rows="4"
                  placeholder="Enter Address"></textarea>

        <button type="submit">
            <i class="fa-solid fa-user-plus"></i> Register
        </button>
    </form>

    <div class="links">
        Already have an account? 
        <a href="<%=request.getContextPath()%>/jsp/auth/login.jsp">Login</a>
    </div>
</div>

</body>
</html>