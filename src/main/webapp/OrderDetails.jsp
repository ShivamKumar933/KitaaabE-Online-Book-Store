<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@page import="MainFiles.BookLoad"%>
<%@page import="java.util.*"%>
<%@page import="MainFiles.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./Componant/navbar.css">
    <link rel="stylesheet" href="./Componant/footer.css">
    <link rel="stylesheet" href="cart.css">
    <title>KitaabE - Orders</title>
</head>
<body>
	<%@include file="./Componant/navbar.jsp" %>
	<div>
            <button class="back-button" onclick="history.back()">Back</button>
    </div>
    <%
    	User user1 =(User)user;
    	if(user1 == null){
    		response.sendRedirect("Login.jsp");
    	}
    
    	Map<Integer,Order> list = user1.getOrderList();
    	Set<Integer> keys = list.keySet();
    	if(list != null && !list.isEmpty()){
    %>
    <div class="container">
        <h1>Orders</h1>
        
        <table class="order-table">
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Order Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
            	<%
            		Map<String, Book> allBooks = BookLoad.loadAllBooks(); 
            		Iterator<Integer> itr = keys.iterator();
            		while(itr.hasNext()){
            			int orderid = itr.next();
            			Order order = list.get(orderid);
            			Book book = allBooks.get(order.getBookId());
            			
            	%>
                <tr>
                    <td><img src="<%=request.getContextPath() + "/Images/" +book.getBookImg() %>" class="bookimg" alt="<%=book.getBookName() %>"></td>
                    <td><p class="price"><%=book.getDisPrice() %></p></td>
                    <td><p class="quantity"><%=order.getQuantity() %></p></td>
                    <td>₹<p class="quantityPrice"><%=book.getDisPrice() * order.getQuantity() %></p></td>
                    <td><p class="orderDate"><%=order.getOrderDate().toString() %></p></td>
                    <td><p class="status">
                    	<%
                    		LocalDate now = LocalDate.now();
                    		LocalDate orderDate = order.getOrderDate().toLocalDate();
                    		Period period = Period.between(orderDate, now);
                    		int goneDays = period.getDays();
                    		if(goneDays>7)
                    		{
                    			out.println("Delivered");
                    		}
                    		else if(goneDays > 5 ){
                    			out.println("Shipped, Delivered within 1-2 days");
                    		}
                    		else if(goneDays > 2){
                    			out.println("On the way");
                    		}
                    		else{
                    			out.println("Order Processing");
                    		}
                    	%>
                    </p></td>
                </tr>
                <%
            		}
                %>
            </tbody>
        </table>
    </div>
    <%
    	}
    	else{
    %>
    <div class="no_item_container">
        <h2> No item Present</h2>
    </div>
    <%
    	}
    %>
    <%@include file="./Componant/footer.jsp" %>
</body>
</html>