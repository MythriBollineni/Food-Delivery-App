<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Revenue Report</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Segoe UI,sans-serif;
}

body{
    background:#f4f6f9;
}

.container{
    width:500px;
    margin:80px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 5px 15px rgba(0,0,0,.2);
    text-align:center;
}

h1{
    color:#27ae60;
    margin-bottom:25px;
}

.info{
    font-size:22px;
    margin:20px 0;
}

.btn{
    display:inline-block;
    margin-top:20px;
    text-decoration:none;
    background:#3498db;
    color:white;
    padding:10px 20px;
    border-radius:5px;
}

</style>

</head>
<body>

<div class="container">

<h1>Revenue Report</h1>

<div class="info">
    <strong>Total Revenue :</strong>
   &#8377;  ${revenue}
</div>

<div class="info">
    <strong>Total Orders :</strong>
    ${orderCount}
</div>

<a class="btn"
href="${pageContext.request.contextPath}/jsp/admin/dashboard.jsp">
Back to Dashboard
</a>

</div>

</body>
</html>