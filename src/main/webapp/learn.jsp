<%@page import="MainFiles.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="MainFiles.*" %>
<% 
	
	Map<String, Book> programmingBookList = (Map<String, Book>)session.getAttribute("programmingList");
	Map<String, Book> newReleasedBooks = (Map<String, Book>)session.getAttribute("newreleasedList");
	
	if(programmingBookList == null){
		programmingBookList = BookLoad.loadBooks("Programming");
		newReleasedBooks = BookLoad.newReleasedBooks();
		
		session.setAttribute("programmingList", programmingBookList);
		session.setAttribute("newreleasedList", newReleasedBooks);
	}
	
 	Set<String> pbKeys = programmingBookList.keySet(); 
 	Set<String> nrbKeys = newReleasedBooks.keySet();
 	
%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="./Componant/navbar.css">
    <link rel="stylesheet" href="./Componant/footer.css">
    <title>KitaaabE</title>
</head>
<body>
    <%@include file="./Componant/navbar.jsp" %>

    <main>
        <section class="hero">
            <h1><mark>Discover Your Next Great Read!</mark></h1>
            <button class="shop" onclick="location.href='#nr'">Shop Now</button>
        </section>
        <section class="programming" id="pb">
            <h2><mark>Programming Books</mark></h2>
            <hr/>
                <div class="book">
                    <table>
           				
                        <tr>
	                        <% 
	                        	int count= 0;
	                        	
	                        	User user1 = (User)user;
		                        Map<String, Integer> cartList = null;
		                     	if(user1!=null){
		                    		cartList = user1.getCartList();	
		                     	}
		                     	
		                     	if(!programmingBookList.isEmpty()){
		                        	Iterator<String> itr = pbKeys.iterator();
		           					while(itr.hasNext()){
		           						Book book = programmingBookList.get(itr.next());
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
			                            if(count == 8){
			                        		break;		
			                        	}
	           						}
	                        	}
	                        	else{
		                        		out.println("<td><p>Sorry, No Books Available!</p></td>");
		                        }
	      
                            %>
                            </tr>
                    </table>
                </div>
            <button class="see-all" onclick="location.href='allBooks.jsp?category=programming';">See All</button>
        </section>

        <section class="new-releases" id="nr">
            <h2><mark>New Releases</mark></h2>
                <div class="book">
                    <table>
           				
                        <tr>
	                        <% 
	                        	count= 0;
	                        	if(!newReleasedBooks.isEmpty()){
		                        	Iterator<String> itr1 = nrbKeys.iterator();
		           					while(itr1.hasNext()){
		           						Book book = newReleasedBooks.get(itr1.next());
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
									    	if(cartList== null || !cartList.containsKey(book.getBookId()))
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
			                            if(count == 8){
			                        		break;		
			                        	}
	           						}
	           					}
	                        	else{
		                        	out.println("<td><p>Sorry, No Books Available!</p></td>");
	                        	}
                            %>
                            </tr>
                    </table>
                </div>
        	<button class="see-all" onclick="location.href='allBooks.jsp?category=newreleased';">See All</button>
        </section>


    <%@include file="./Componant/footer.jsp" %>
</body>
</html>