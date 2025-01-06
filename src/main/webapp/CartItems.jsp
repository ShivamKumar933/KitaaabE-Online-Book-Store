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
    <link rel="stylesheet" href="cart.css">
    <link rel="stylesheet" href="./Componant/navbar.css">
    <link rel="stylesheet" href="./Componant/footer.css">
    <title>KitaabE</title>
    
    <script>
	    function showAndHide(){
	        const val = document.getElementById('payment_method').value;
	        if(val === "DebitCard"){ 
	            document.getElementById('DebitCardNumber').style.display = 'inline';
	        }
	        else{
	            document.getElementById('DebitCardNumber').style.display = 'none';
	        }
	    }
    	
	    function debitValidation(){
	    	const strVal = document.getElementById('DebitCardNumber').value;
	    	console.log(strVal);
	    	if(strVal === undefined){
	    		return true;
	    	}
	    	if(strVal.length === 16){
	    		
	    		const val = Number(strVal);
	    		console.log(val);
	    		if(!isNaN(val)){
	    			return true;
	    		}
	    	}
	    	
	    	alert("Please, Enter 16 digits Long Debit/Credit Card Number!")
	    	
	    	return false;
	    }
	    
    	function orderDone(){
    		if(debitValidation())
    		{
    			
	    		let booktotal = Number(document.querySelector('.total-amount').textContent)
	    		
	    		let shipping = Number(document.querySelector('.shipping').textContent)
	    		
	    		let totalamount = booktotal + shipping
	    		
	    		const bool = confirm("Total Amount to be paid : "+totalamount+"\n Order will be Deliver in 5-7 days.");
	    		
	    		return bool;
    		}
    		
    		return false;
    	
    </script>
</head>
<body>
	<%@include file="./Componant/navbar.jsp" %>
	<div>
            <button class="back-button" onclick="history.back()">Back</button>
    </div>
	<%
		User user1 = (User)user;
		Map<String, Integer> cartList= user1.getCartList();
		Set<String> keys = cartList.keySet();
		if(cartList!=null && !cartList.isEmpty()){
			Map<String, Book> allBooks = BookLoad.loadAllBooks();	
			double subtotal = 0;
	%>
    <div class="container">
        <h1>Your Cart</h1>
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            	<%
            		Iterator<String> itr = keys.iterator();
            		while(itr.hasNext()){
            			String bookId = itr.next();
            			Book book = allBooks.get(bookId);
            			if(book!=null){
            				subtotal += book.getDisPrice() * cartList.get(bookId);
            	%>
                <tr>
                    <td><img class="bookimg" src="<%=request.getContextPath() + "/Images/" +book.getBookImg() %>" alt="<%=book.getBookName() %>"></td>
                    <td>₹<p class="bookPrice"><%=book.getDisPrice() %></td>
                    <td><form action="UpdateCart" method="post">
    						<input type="number" class="quantity" name="quantity" value="<%=cartList.get(bookId) %>" min="1" onchange="this.form.submit()">
    						<input type="hidden" name="bookId" value="<%=book.getBookId()%>">
						</form>
                    </td>
                    <td>₹<p class="subTotal"><%= book.getDisPrice() * cartList.get(bookId) %></td>
                    <td>
						<form action ="removefromcart" method="post">
							<input type="hidden" name="bookId" value="<%=book.getBookId()%>">                    
                    		<button type="submit" class="button">Remove</button>
                    	</form>
                    </td>
                </tr>
                <%
            			}
            		}
                %>
                
            </tbody>
        </table>
        <div class="cart-summary">
            <div><strong>Subtotal: ₹<span class="total-amount"><%=subtotal%></span></strong> </div>
            
            <div><strong>Shipping: ₹
           	<% 
           		if(subtotal < 1999){
           			out.println("<span class=\"shipping\">100</span>");
           		}
           		else{
           			out.println("<span class=\"shipping\">0</span>");
           		}
           	%>
             </strong>(Free on orders over 1999 Rs.)</div>
             <div><strong>Payment Method:</strong>
                <select name="payment_method" class="payment_method" id="payment_method" onchange="showAndHide()">
                <option value="COD">COD(Cash On Delivery)</option>
                <option value="DebitCard" selected>DebitCard/CreditCard</option>
                </select>
                <input type="text" id="DebitCardNumber" minlength="16" maxlength="16" placeholder="Card Number" required> 
            </div>
        </div>
        <form id = "orderForm"action= "addtoorder" method="post" onSubmit = "return orderDone()"> 
        <div style="text-align: center; margin-top: 30px;">
            <button type="submit" class="button">Proceed to Checkout</button>
        </div>
        </form>
    </div>
    <%
		}
		else
		{
			
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