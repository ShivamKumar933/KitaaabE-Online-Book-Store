<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./Componant/navbar.css">
    <link rel="stylesheet" href="./Componant/footer.css">
    <link rel="stylesheet" href="register.css">
    <title>Register - Your Bookstore Name</title>
	<script>
		function userValidation(event){
	        event.preventDefault();
	        var email = document.getElementById("email").value;
	        var username = document.getElementById("username").value;
	        var city = document.getElementById("city").value;
	        var pincode = document.getElementById("pincode").value;
	        var country = document.getElementById("country").value;
	        var mobno = document.getElementById("mobno").value;
	        var password1 = document.getElementById("password").value;
	        var password2 = document.getElementById("confirm-password").value;
			
	        var passwordPattern = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,16}$/;
	        var textPattern = /^[a-zA-Z\s]+$/;
	        var digitPattern = /^[0-9]+$/;
	        var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z.-]+\.[a-zA-Z]{2,}$/;
	
	        var errorMessage = '';
	        if(!textPattern.test(username)){
	            errorMessage += "Please Enter a valid Username\n";
	        }
	        if(!textPattern.test(city) || !textPattern.test(country)|| !digitPattern.test(pincode)){
	            errorMessage += "Please Enter valid Address.\n"
	        }
	        if(!digitPattern.test(mobno)){
	            errorMessage += "Please Enter valid Mobile Number.\n";
	        }
	        if(!emailPattern.test(email)){
	            errorMessage += "Please Enter a valid Email address.\n";
	        }
			
	        if(!passwordPattern.test(password1)){
	            errorMessage += "Please Enter atleast One Special Char(!@#$%^&*_=+-), atleast One Number, and atleast One alphabet.\n";
	        }
	        
	        if(password1.length != password2.length || !password1 === password2){
	            errorMessage += "Please Enter Same Password again" ;
	        }
	        
	        if(errorMessage){
	        	alert(errorMessage);	
	        }
	        else{
	            document.forms[0].submit();
	            document.getElementById("myform").reset();
	        }
	
	        
		}
	</script>
</head>
<body><%@include file="./Componant/navbar.jsp" %>
	
    <div class="register-container">
    	<% 
          Object o1 = request.getAttribute("isEmailAvailable");
          if(o1 != null && (boolean)o1 == true){
            out.println("<p class=\"msg\">This Email is already registered, Please Login!</p>");
          }
                
         %>
        <h2>Create Your Account On KitaaabE</h2>
        <form id="myform" action="Registerservlet" method="POST" onsubmit="userValidation(event)">
            <div class="form-group">
                <label for="username">Full Name:</label>
                <input type="text" id="username" name="username" placeholder = "John" maxlength="25"  required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" maxlength="50" placeholder = "abc@outlook.com" required>
                
            </div>
            <div class="form-group">
                <label>Address</label>
                <div class="address">
                    <input type="text" id="city" name="city" placeholder="City" required>
                    <input type="text" id="pincode" name="pincode" placeholder="Pincode" minlength = "6" maxlength = "6"required>
                    <input type="text" id="country" name="country"placeholder="Country" required>
                </div>
            </div>
            <div class="form-group">
                <label for="mobno">Mobile Number</label>
                <input type="text" id="mobno" name="mobno" minlength = "10" maxlength = "10" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <select name="gender" id="gender">
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" minlength = "8" maxlength = "16"required>
            </div>
            <div class="form-group">
                <label for="confirm-password">Confirm Password:</label>
                <input type="password" id="confirm-password" name="confirm-password" minlength = "8" maxlength = "16" required>
            <p class="pass_dir">*Passwords must contain:<p>
            <ul class="pass_dir_list">
                <li>a minimum of 1 letter [a-zA-Z] and</li>
                <li>a minimum of 1 numeric character [0-9] and</li>
                <li>a minimum of 1 special character: ?!@#$%^&*_=+-</li>
                <li>Passwords length must be at least 8 characters, and at most 16 charachters.</li>
            </ul>
            </div>
            
            <button type="submit">Register</button>
            <div class="footer-links">
                <a href="Login.jsp">Already have an account? Login</a>
            </div>
        </form>
    </div>
    <%@include file="./Componant/footer.jsp" %>
</body>
</html>
    