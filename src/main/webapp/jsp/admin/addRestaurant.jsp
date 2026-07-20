<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Restaurant</title>

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

.container{

    width:500px;
    margin:40px auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 5px 20px rgba(0,0,0,.2);

}

h2{

    text-align:center;
    margin-bottom:20px;
    color:#2c3e50;

}

input, textarea{

    width:100%;
    padding:12px;
    margin:10px 0;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:15px;

}

button{

    width:100%;
    padding:12px;
    background:#27ae60;
    color:white;
    border:none;
    border-radius:8px;
    font-size:16px;
    cursor:pointer;

}

button:hover{

    background:#1e8449;

}

</style>

</head>

<body>

<div class="container">

<h2>Add Restaurant</h2>

<form action="<%=request.getContextPath()%>/AddRestaurantServlet" method="post">

<input type="text"
name="restaurantName"
placeholder="Restaurant Name"
required>

<textarea
name="address"
placeholder="Restaurant Address"
required></textarea>

<input type="text"
name="phone"
placeholder="Phone Number"
required>

<input type="number"
step="0.1"
name="rating"
placeholder="Rating"
required>

<input type="text"
name="deliveryTime"
placeholder="Delivery Time (Example: 30 mins)"
required>

<input type="text"
name="image"
placeholder="Image URL">

<button type="submit">

Add Restaurant

</button>

</form>

</div>

</body>
</html>