<%@page import="java.util.ArrayList"%>
<%@page import="com.fooddelivery.model.Order"%>

<%
ArrayList<Order> orders =
(ArrayList<Order>)request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Orders</title>

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
border-bottom:1px solid #ddd;
text-align:center;

}

tr:hover{

background:#f8f8f8;

}

.btn{

text-decoration:none;
background:#3498db;
color:white;
padding:8px 15px;
border-radius:5px;

}

.top{

display:flex;
justify-content:space-between;
margin-bottom:20px;

}

</style>

</head>

<body>

<div class="header">

<h1>Order Management</h1>

</div>

<div class="container">

<div class="top">

<a class="btn"
href="<%=request.getContextPath()%>/jsp/admin/dashboard.jsp">
Dashboard
</a>

</div>

<table>

<tr>

<th>Order ID</th>
<th>User ID</th>
<th>Total</th>
<th>Payment</th>
<th>Status</th>
<th>Date</th>
<th>Action</th>

</tr>

<%
if(orders!=null){

for(Order order:orders){
%>

<tr>

<td><%=order.getOrderId()%></td>

<td><%=order.getUserId()%></td>

<td>Rs: <%=order.getTotalAmount()%></td>

<td><%=order.getPaymentMethod()%></td>

<td><%=order.getOrderStatus()%></td>

<td><%=order.getOrderDate()%></td>

<td>

<a class="btn"
href="<%=request.getContextPath()%>/UpdateOrderStatusServlet?id=<%=order.getOrderId()%>">
Update Status
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