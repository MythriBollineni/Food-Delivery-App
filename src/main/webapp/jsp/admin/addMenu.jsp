<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Menu Item</title>

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
    width:550px;
    margin:40px auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,.2);
}

h2{
    text-align:center;
    margin-bottom:25px;
    color:#2c3e50;
}

label{
    font-weight:bold;
    display:block;
    margin-top:10px;
    color:#555;
}

input,
textarea,
select{

    width:100%;
    padding:12px;
    margin-top:6px;
    margin-bottom:15px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:15px;

}

textarea{
    resize:vertical;
    min-height:80px;
}

button{

    width:100%;
    padding:14px;
    background:#27ae60;
    color:white;
    border:none;
    border-radius:8px;
    font-size:17px;
    cursor:pointer;
    transition:.3s;

}

button:hover{

    background:#1e8449;

}

.back{

    display:inline-block;
    margin-top:20px;
    text-decoration:none;
    color:#3498db;
    font-weight:bold;

}

.back:hover{
    text-decoration:underline;
}

</style>

</head>

<body>

<div class="container">

<h2>Add Menu Item</h2>

<form action="<%=request.getContextPath()%>/AddMenuServlet" method="post">

<label>Restaurant ID</label>
<input
type="number"
name="restaurantId"
required>

<label>Item Name</label>
<input
type="text"
name="itemName"
required>

<label>Description</label>
<textarea
name="description"></textarea>

<label>Price</label>
<input
type="number"
step="0.01"
name="price"
required>

<label>Category</label>
<input
type="text"
name="category"
placeholder="Veg / Non-Veg / Drinks / Dessert">

<label>Image URL</label>
<input
type="text"
name="image"
placeholder="Enter image path">

<label>Availability</label>

<select name="available">

<option value="true">Available</option>

<option value="false">Not Available</option>

</select>

<button type="submit">
Add Menu Item
</button>

</form>

<br>

<a class="back"
href="<%=request.getContextPath()%>/jsp/admin/dashboard.jsp">
← Back to Dashboard
</a>

</div>

</body>
</html>