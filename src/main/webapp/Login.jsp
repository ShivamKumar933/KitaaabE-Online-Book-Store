<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="login.css">
    <link rel="stylesheet" href="./Componant/navbar.css">
    <link rel="stylesheet" href="./Componant/footer.css">
    <title>Login - Your Bookstore Name</title>
    <script>
    function LogInValidation(event){
    	event.preventDefault();
  	    var email = document.getElementById("email").value;
  	    
  	    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z.-]+\.[a-zA-Z]{2,}$/;
  	    var errorMessage = '';
  	    if(!emailPattern.test(email)){
  	        errorMessage += "Please Enter a valid Email address.\n";
  	        alert(errorMessage);
  	    }
  	    else{
  	        document.forms[0].submit();

  	    }
  	  	document.getElementById("myform").reset();
  	}
    </script>
</head>
<body>
	<%@include file="./Componant/navbar.jsp" %>
	<div>
            <button class="back-button" onclick="history.back()">Back</button>
    </div>
    <div class="login-container">
    	
        <h2>Login to Your Account</h2>
       			<% 
             		Object o1 = request.getAttribute("isEmailAvailable");
		            if(o1 != null && (boolean)o1 != true){
		               out.println("<p>This Email is not registered, Please Register!</p>");
		            }
                %>
        <form class="myform" action="Loginservlet" method="POST" onsubmit="LogInValidation(event)">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder = "abc@outlook.com" maxlength="50" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" minlength="8" maxlength="16" required>
                <% 
                	Object o2 = request.getAttribute("passwordMatch");
                	if(o2 != null && (boolean)o2 != true){
                		out.println("<p>Wrong Password!!</p>");
                	}
                
                %>
            </div>
            <button type="submit">Login</button>
            <div class="footer-links">
                <a href="Register.jsp">Not Registered yet? Register</a>
            </div>
        </form>
    </div>
    <%@include file="./Componant/footer.jsp" %>
</body>
</html>
