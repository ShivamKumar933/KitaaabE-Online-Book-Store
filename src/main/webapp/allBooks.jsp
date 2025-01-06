<%@page import="java.util.Locale.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ page import="java.util.*" %>
<%@ page import="MainFiles.*" %>
<%
	String category = request.getParameter("category");
	Map<String, Book> bookList = (Map<String, Book>)session.getAttribute(category+"List");
	if(bookList==null){
		bookList = BookLoad.loadBooks(request.getParameter("category"));
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="allBooks.css">
<link rel="stylesheet" href="./Componant/navbar.css">
<link rel="stylesheet" href="./Componant/footer.css">
<title>See All Books</title>
</head>
<body>
	<%@include file="./Componant/navbar.jsp" %>
	<div>
            <button class="back-button" onclick="history.back()">Back</button>
    </div>
    <%
    	if(!bookList.isEmpty()){
			Set<String> keySet = bookList.keySet(); 
    %>
	<section class="categories" id="pb">
            <h2><mark><%=request.getParameter("category")%> Books</mark></h2>
            <hr/>
                <div class="book">
                    <table>
           				
                        <tr>
	                        <% 
		                        User user1 = (User)user;
	                        	Map<String, Integer> cartList = null;
		                    	
		                    	if(user1 !=null){
		                    		cartList = user1.getCartList();
		                    	}
		                    	
	                        	int count= 0;
	                        	Iterator<String> itr = keySet.iterator(); 
	           					while(itr.hasNext()){
	           						Book book = bookList.get(itr.next());
	           						if(count%4==0 && count > 0){
	           				%>
	           						 </tr><tr>	
	           				<%
	           						}
	           				%>
	           				
                            <td>
                                <img class="bookimg" src="<%=request.getContextPath() + "/Images/" +book.getBookImg() %>" alt = "<%=book.getBookImg() %>">
                                <p class="booktitle"><%= book.getBookName() %></p>
                                <div class="pricing">
                                    <h4 class="amt">₹<%= book.getDisPrice() %></h4> 
                                    <h6 class="rs">₹<%= book.getActPrice()%></h6>  
                                    <h6 class="discount">(<%=(int)(((book.getActPrice() - book.getDisPrice())/book.getActPrice()) * 100) + "%"%>)</h6>  
                                </div>
                                <div class="shopbutton">
								    <form action="buyPage.jsp" method="post">
								        <div class="buybutton">
								            <input type="hidden" name="bookId" value="<%= book.getBookId() %>">
								            <input type="hidden" name="bookGenre" value="<%= book.getGenre() %>">
								            <button type="submit" class="buy">Buy</button>	
								        </div>
								    </form>
								    <% 
								    	if(cartList == null || !cartList.containsKey(book.getBookId()))
								    	{
								    %>
								    <form action = "addtocart" method="post">
								        <div class="cartbutton">
								            <input type="hidden" name="bookId" value="<%= book.getBookId() %>">
								            <button type="submit" class="cart" id = "cartButton">Add to Cart</button>	
								        </div>
								    </form>
								    <%
								    	}
								    	else
								    	{
								    %>
								    <form action = "removefromcart" method="post">
								        <div class="removebutton">
								            <input type="hidden" name="bookId" value="<%= book.getBookId() %>">
								            <button type="submit" class="remove" id = "removeButton">Remove</button>	
								        </div>
								    </form>
								    <%
								    	}
								    %>
								</div>
                            </td>
                            <% 
                            	count++;
                            	
	           					}
                            %>
                            </tr>
                    </table>
                </div>
        </section>
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