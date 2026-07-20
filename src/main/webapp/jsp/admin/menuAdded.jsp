<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu Added</title>

<style>

body{
    font-family:Arial;
    background:#f4f6f9;
    text-align:center;
    margin-top:120px;
}

.success{

    background:white;
    width:500px;
    margin:auto;
    padding:40px;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,.2);

}

a{

    text-decoration:none;
    background:#27ae60;
    color:white;
    padding:12px 20px;
    border-radius:8px;
    margin:10px;
    display:inline-block;

}

a:hover{

    background:#1e8449;

}

</style>

</head>

<body>

<div class="success">

<h1>✅ Menu Item Added Successfully!</h1>

<br>

<a href="<%=request.getContextPath()%>/jsp/admin/addMenu.jsp">
Add Another Menu Item
</a>

<a href="<%=request.getContextPath()%>/jsp/admin/dashboard.jsp">
Back to Dashboard
</a>

</div>

</body>
</html>