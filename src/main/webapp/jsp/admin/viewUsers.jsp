<%@ page import="java.util.ArrayList"%>
<%@ page import="com.fooddelivery.model.User"%>

<%
ArrayList<User> users =
(ArrayList<User>)request.getAttribute("users");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Users</title>

<style>

body{
font-family:Arial;
background:#f4f6f9;
padding:20px;
}

table{
width:100%;
border-collapse:collapse;
background:white;
}

th{
background:#11998e;
color:white;
padding:12px;
}

td{
padding:10px;
border:1px solid #ddd;
text-align:center;
}

h2{
margin-bottom:20px;
}

</style>

</head>

<body>

<h2>Registered Users</h2>

<table>

<tr>

<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Phone</th>
<th>Address</th>
<th>Role</th>
<th>Created Date</th>

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