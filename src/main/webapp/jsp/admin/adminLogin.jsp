<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

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

.login-box{

    width:400px;
    background:#fff;
    padding:40px;
    border-radius:15px;
    box-shadow:0 15px 40px rgba(0,0,0,.25);

}

.icon{

    font-size:70px;
    text-align:center;
    margin-bottom:10px;

}

h2{

    text-align:center;
    color:#2c3e50;
    margin-bottom:30px;

}

.input-group{

    margin-bottom:20px;

}

label{

    display:block;
    font-weight:bold;
    margin-bottom:8px;
    color:#555;

}

input{

    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:15px;
    transition:.3s;

}

input:focus{

    outline:none;
    border-color:#11998e;
    box-shadow:0 0 8px rgba(17,153,142,.3);

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
    transition:.3s;

}

button:hover{

    background:#0c7c70;

}

.footer{

    margin-top:20px;
    text-align:center;
    color:#777;
    font-size:14px;

}

</style>

</head>

<body>

<div class="login-box">



<h2>Food Delivery Admin</h2>

<form action="<%=request.getContextPath()%>/AdminLoginServlet" method="post">

<div class="input-group">

<label>Username</label>

<input
type="text"
name="username"
placeholder="Enter Username"
required>

</div>

<div class="input-group">

<label>Password</label>

<input
type="password"
name="password"
placeholder="Enter Password"
required>

</div>

<button type="submit">
Login
</button>

</form>

<div class="footer">

Food Delivery Admin Panel

</div>

</div>

</body>
</html>