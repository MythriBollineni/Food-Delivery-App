<%@page import="java.util.ArrayList"%>
<%@page import="com.fooddelivery.model.User"%>

<%
ArrayList<User> users =
(ArrayList<User>)request.getAttribute("users");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registered Customers</title>

<style>

body{
    font-family:Arial;
    background:#f4f6f9;
}

h2{
    text-align:center;
    margin:20px;
}

table{
    width:90%;
    margin:auto;
    border-collapse:collapse;
    background:white;
}

th,td{
    border:1px solid #ddd;
    padding:12px;
    text-align:center;
}

th{
    background:#27ae60;
    color:white;
}

tr:nth-child(even){
    background:#f9f9f9;
}

a{
    text-decoration:none;
    background:#3498db;
    color:white;
    padding:10px 18px;
    border-radius:6px;
}

.container{
    text-align:center;
    margin:20px;
}

</style>

</head>

<body>

<h2>Registered Customers</h2>

<div class="container">

<a href="<%=request.getContextPath()%>/jsp/admin/dashboard.jsp">
Back to Dashboard
</a>

</div>

<table>

<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Address</th>
    <th>Role</th>
</tr>

<%
if(users!=null){

for(User user:users){
%>

<tr>

<td><%=user.getUserId()%></td>

<td><%=user.getName()%></td>

<td><%=user.getEmail()%></td>

<td><%=user.getPhone()%></td>

<td><%=user.getAddress()%></td>

<td><%=user.getRole()%></td>

</tr>

<%
}
}
%>

</table>

</body>
</html>