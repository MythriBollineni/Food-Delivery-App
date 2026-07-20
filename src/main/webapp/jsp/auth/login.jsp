<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Login</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',Tahoma,Geneva,Verdana,sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#ff9966,#ff5e62);
}

.container{
    width:400px;
    background:white;
    padding:40px;
    border-radius:15px;
    box-shadow:0 15px 35px rgba(0,0,0,.25);
}

.icon{
    text-align:center;
    font-size:60px;
    color:#ff5722;
    margin-bottom:10px;
}

h2{
    text-align:center;
    margin-bottom:30px;
    color:#333;
}

.input-group{
    margin-bottom:20px;
}

.input-group label{
    display:block;
    margin-bottom:8px;
    font-weight:bold;
    color:#555;
}

.input-group input{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:15px;
}

.input-group input:focus{
    outline:none;
    border-color:#ff5722;
    box-shadow:0 0 8px rgba(255,87,34,.3);
}

button{
    width:100%;
    padding:13px;
    border:none;
    border-radius:8px;
    background:#ff5722;
    color:white;
    font-size:17px;
    cursor:pointer;
}

button:hover{
    background:#e64a19;
}

.links{
    text-align:center;
    margin-top:20px;
}

.links a{
    text-decoration:none;
    color:#ff5722;
    font-weight:bold;
}

.links a:hover{
    text-decoration:underline;
}

.footer{
    margin-top:20px;
    text-align:center;
    color:#777;
}

</style>

</head>

<body>

<div class="container">

<div class="icon">
<i class="fa-solid fa-bowl-food"></i>
</div>

<h2>Customer Login</h2>

<form action="${pageContext.request.contextPath}/LoginServlet" method="post">

<div class="input-group">

<label>Email</label>

<input
type="email"
name="email"
placeholder="Enter your email"
required>

</div>

<div class="input-group">

<label>Password</label>

<input
type="password"
name="password"
placeholder="Enter your password"
required>

</div>

<button type="submit">
<i class="fa-solid fa-right-to-bracket"></i>
 Login
</button>

</form>

<div class="links">

Don't have an account?

<a href="<%=request.getContextPath()%>/jsp/auth/register.jsp">
    Create Account
</a>
</div>

<div class="footer">
🍔 Welcome to FoodCourt
</div>

</div>

</body>
</html>