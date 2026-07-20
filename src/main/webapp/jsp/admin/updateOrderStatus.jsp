<%@page import="com.fooddelivery.model.Order"%>

<%
Order order = (Order)request.getAttribute("order");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Order Status</title>

<style>

body{
    font-family:Arial;
    background:#f4f6f9;
}

.container{

    width:450px;
    margin:80px auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,.2);

}

h2{

    text-align:center;
    margin-bottom:20px;

}

select,
button{

    width:100%;
    padding:12px;
    margin-top:15px;

}

button{

    background:#27ae60;
    color:white;
    border:none;
    border-radius:8px;
    cursor:pointer;

}

</style>

</head>

<body>

<div class="container">

<h2>Update Order Status</h2>

<form action="<%=request.getContextPath()%>/UpdateOrderStatusServlet"
method="post">

<input type="hidden"
name="orderId"
value="<%=order.getOrderId()%>">

<p><b>Order ID :</b> <%=order.getOrderId()%></p>

<p><b>User ID :</b> <%=order.getUserId()%></p>

<p><b>Total :</b> ₹ <%=order.getTotalAmount()%></p>

<select name="status">

<option value="Pending"
<%=order.getOrderStatus().equals("Pending")?"selected":""%>>
Pending
</option>

<option value="Preparing"
<%=order.getOrderStatus().equals("Preparing")?"selected":""%>>
Preparing
</option>

<option value="Out for Delivery"
<%=order.getOrderStatus().equals("Out for Delivery")?"selected":""%>>
Out for Delivery
</option>

<option value="Delivered"
<%=order.getOrderStatus().equals("Delivered")?"selected":""%>>
Delivered
</option>

<option value="Cancelled"
<%=order.getOrderStatus().equals("Cancelled")?"selected":""%>>
Cancelled
</option>

</select>

<button type="submit">

Update Status

</button>

</form>

</div>

</body>
</html>