<%@page import="MainFiles.BookLoad"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@page import = "MainFiles.Book" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="buyPage.css">
<link rel="stylesheet" href="./Componant/navbar.css">
<link rel="stylesheet" href="./Componant/footer.css">
<title>Buy</title>
<script>
        function buyBook(){
          return confirm("Are you sure?\nIf you want to buy this book click on \"OK\" else click on \"Cancel\"");  
        }
</script>
</head>
<body>
	<%@include file="./Componant/navbar.jsp" %>
	<%
		if(user == null){
			response.sendRedirect("Login.jsp");
		}
		Map<String, Book> bookList = (Map<String, Book>)session.getAttribute(request.getParameter("bookGenre")+"List");
		if(bookList == null){
			bookList = BookLoad.loadBooks(request.getParameter("bookGenre"));
			session.setAttribute(request.getParameter("bookGenre")+"List", bookList);
		}
		Book book = bookList.get(request.getParameter("bookId"));
	%>
	<section class="buy_container"> 
        <h1 class="buyBox">Purchase</h1>
        
        <table>
            <tr>
                <td rowspan="5"><img src="<%=request.getContextPath() + "/Images/" +book.getBookImg() %>" class="bookimg" alt="<%=book.getBookName() %>"></td>
                <td>Book Name<h2 class="bookname"><%=book.getBookName()%></h2></td>
            </tr>
            <tr>
                <td>Author Name<h3 class="authorname"><%=book.getAuthorName() %></h3></td>
            </tr>
            <tr>
                <td>Price <h3 class="discPrice">₹<%=book.getDisPrice() %></h3><h4 class="actPrice">₹<%=book.getActPrice() %></h4></td>
            </tr>
            <tr>
                <td>Genre<h3 class="genre"><%=book.getGenre() %></h3></td>
            </tr>
            <tr>
                <td>Release Date<h3 class="releasedate"><%=book.getReleaseDate() %></h3></td>
            </tr>
        </table>
        <form action="addtoorder" method="post" onsubmit="return buyBook()">
        	<input type="hidden" name="bookId" value="<%= book.getBookId() %>">
        	
            <button type="submit" class="buyButton" >Buy</button>
        </form>
    </section>
    <%@include file="./Componant/footer.jsp" %>
</body>
</html>