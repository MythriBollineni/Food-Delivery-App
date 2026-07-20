<%@page import="java.util.ArrayList"%>
<%@page import="com.fooddelivery.model.Menu"%>

<%
ArrayList<Menu> menuList =
(ArrayList<Menu>)request.getAttribute("menuList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu Management</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#f4f6f9;
}

.header{
    background:#2c3e50;
    color:white;
    padding:20px;
    text-align:center;
}

.container{
    width:95%;
    margin:30px auto;
}

table{

    width:100%;
    border-collapse:collapse;
    background:white;
    box-shadow:0 5px 15px rgba(0,0,0,.2);

}

th{

    background:#27ae60;
    color:white;
    padding:12px;

}

td{

    padding:10px;
    text-align:center;
    border-bottom:1px solid #ddd;

}

tr:hover{

    background:#f8f8f8;

}

.btn{

    text-decoration:none;
    color:white;
    padding:8px 14px;
    border-radius:5px;
    margin:2px;

}

.edit{

    background:#3498db;

}

.delete{

    background:#e74c3c;

}

.add{

    background:#27ae60;
    padding:12px 18px;
    color:white;
    text-decoration:none;
    border-radius:8px;

}

.top{

    margin-bottom:20px;
    display:flex;
    justify-content:space-between;

}

</style>

</head>

<body>

<div class="header">

<h1>Menu Management</h1>

</div>

<div class="container">

<div class="top">

<a class="add"
href="<%=request.getContextPath()%>/jsp/admin/addMenu.jsp">
+ Add Menu Item
</a>

<a class="add"
href="<%=request.getContextPath()%>/jsp/admin/dashboard.jsp">
Dashboard
</a>

</div>

<table>

<tr>

<th>ID</th>
<th>Restaurant ID</th>
<th>Item</th>
<th>Description</th>
<th>Price</th>
<th>Category</th>
<th>Available</th>
<th>Action</th>

</tr>

<%
if(menuList!=null){

for(Menu m:menuList){
%>

<tr>

<td><%=m.getMenuId()%></td>

<td><%=m.getRestaurantId()%></td>

<td><%=m.getItemName()%></td>

<td><%=m.getDescription()%></td>

<td>&#x20B9;<%=m.getPrice()%></td>

<td><%=m.getCategory()%></td>

<td><%=m.isAvailable()?"Yes":"No"%></td>

<td>

<a class="btn edit"
href="<%=request.getContextPath()%>/EditMenuServlet?id=<%=m.getMenuId()%>">
Edit
</a>

<a class="btn delete"
href="<%=request.getContextPath()%>/DeleteMenuServlet?id=<%=m.getMenuId()%>"
onclick="return confirm('Delete this menu item?')">
Delete
</a>

</td>

</tr>

<%
}
}
%>

</table>

</div>

</body>
</html>