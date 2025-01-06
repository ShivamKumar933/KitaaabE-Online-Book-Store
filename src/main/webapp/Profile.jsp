<%@page import="MainFiles.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./Componant/navbar.css">
    <link rel="stylesheet" href="./Componant/footer.css">
    <link rel="stylesheet" href="profile.css">
    <title>KitaaabE - Profile</title>
</head>
<body>
	<%@include file="./Componant/navbar.jsp" %>
	<div>
            <button class="back-button" onclick="history.back()">Back</button>
    </div>
	<% 
		User user1 = (User)user;
	%>
    <div class="container">
        <div class="main-heading">
            <label class="greet">Hello,</label><p class="username"><%=user1.getUserName() %></p>
        </div>
        <div class="form-group">
            <label class="identity">Mobile : </label><p class="mobno"><%=user1.getMobNo() %></p>
        </div>
        <div class="form-group">
            <label class="identity">Email Id : </label><p class="email"><%=user1.getUserEmail() %></p>
        </div>
        <div class="form-group">
            <label class="identity">Address : </label><p class="address"><%=user1.getAddress() %></p>
        </div>
        <div class="form-group">
            <label class="identity">Gender : </label><p class="gender"><%=user1.getGender() %></p>
        </div>
        <div class="form-group">
            <a href="OrderDetails.jsp" class="order">My Orders</a>
        </div>
        <div class="form-group">
            <a href="CartItems.jsp" class="cartlist">My CartList</a>
        </div>
        <a href="LogOut" class="logout">LogOut</a>
    </div>
    <%@include file="./Componant/footer.jsp" %>
</body>
</html>