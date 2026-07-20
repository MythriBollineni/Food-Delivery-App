<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Customer Registration</title>

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
background:linear-gradient(135deg,#11998e,#38ef7d);
}

.container{

width:430px;
background:white;
padding:35px;
border-radius:15px;
box-shadow:0 15px 35px rgba(0,0,0,.25);

}

.icon{

text-align:center;
font-size:60px;
color:#11998e;
margin-bottom:10px;

}

h2{

text-align:center;
margin-bottom:25px;
color:#333;

}

input,textarea{

width:100%;
padding:12px;
margin-bottom:15px;
border:1px solid #ccc;
border-radius:8px;
font-size:15px;

}

input:focus,
textarea:focus{

outline:none;
border-color:#11998e;
box-shadow:0 0 8px rgba(17,153,142,.3);

}

textarea{

resize:none;

}

button{

width:100%;
padding:13px;
background:#11998e;
color:white;
border:none;
border-radius:8px;
font-size:17px;
cursor:pointer;

}

button:hover{

background:#0c7c70;

}

.links{

text-align:center;
margin-top:20px;

}

.links a{

text-decoration:none;
color:#11998e;
font-weight:bold;

}

.links a:hover{

text-decoration:underline;

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

<input
type="text"
name="name"
placeholder="Enter Name"
required>

<input
type="email"
name="email"
placeholder="Enter Email"
required>

<input
type="password"
name="password"
placeholder="Enter Password"
required>

<input
type="text"
name="phone"
placeholder="Enter Phone Number"
required>

<textarea
name="address"
rows="4"
placeholder="Enter Address"></textarea>

<button type="submit">
<i class="fa-solid fa-user-plus"></i>
 Register
</button>

</form>

<div class="links">

Already have an account?

<a href="<%=request.getContextPath()%>/jsp/auth/login.jsp">
    Login
</a>

</div>

</div>

</body>
</html>