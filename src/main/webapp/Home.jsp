<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ebook Store</title>
    <link rel="stylesheet" href="home.css">
</head>
<body>
    <header>
    <div class="main-header">
        <div class = "left-header">
            <div class="name"><a class = "web_name" href="learn.jsp">KitaaabE</a>
            </div> 
            <div class = "search">        
                <input type="text" class="search-bar" placeholder="Search books..." >
                <button class="search-button">Search</button>
            </div>
        </div>
        <div class="right-header">
            <div>
            	<% 
            		Object flag = request.getAttribute("Login");
            		if(flag!=null && (boolean)flag == false )
            		{
            	%>
                <button onclick="window.location.href='Login.html'" type = "button" name = "loginButton" class = "loginButton" >LogIN</button>
            	<%
            		}
            		else{
            			
            	%>
            	<button onclick="window.location.href='Login.html'" type = "button" name = "logoutButton" class = "logoutButton" >LogOUT</button>
            	<%
            		}
            	%>
            </div>
        </div>
    </div>
        <nav>
            <ul >
                <li><a href="#">Fiction</a></li>
                <li><a href="#">Non-Fiction</a></li>
                <li><a href="#">Literature</a></li>
                <li><a href="#">History</a></li>
                <li><a href="#">Children</a></li>
            </ul>
        </nav>

    </header>


    <main>
        <section class="hero">
            <h1><mark>Discover Your Next Great Read!</mark></h1>
            <button class="shop">Shop Now</button>
        </section>

        <section class="categories">
            <h2><mark>Featured Categories</mark></h2>
            <div class="category-list">
                <div class="category">
                    <a class="type" href="#">Romance</a>
                </div>
                <div class="category">
                    <a class="type" href="#">Mystery</a>
                </div>
                <div class="category">
                    <a class="type" href="#">Technology</a>
                </div>
            </div>
        </section>

        <section class="bestsellers">
            <h2><mark>Bestsellers</mark></h2>
                <div class="book">
                    <table>
                        <tr>
                            <td>
                                <img class="bookimg" src="https://m.media-amazon.com/images/I/41pjoMsqWUL._SL500_.jpg" alt="art of seduction">
                                <p class="booktitle">Art of Seduction</p>
                                <div class="pricing">
                                    <h4 class="amt">₹326</h4> 
                                    <h6 class="rs">₹499</h6>  
                                    <h6 class="discount">(-34%)</h6>  
                                </div>
                                <div class="shopbutton">
                                    <a href="#" class="cart">Add to Cart</a>
                                    <a href="#" class="buy">Buy</a>
                                </div>
                            </td>
                            <td>
                                <img class="bookimg" src="https://m.media-amazon.com/images/I/61J3Uu4jOLL._AC_UF1000,1000_QL80_.jpg" alt="the 48 Laws of Power">
                                <p class="booktitle">The 48 Laws of Power</p>
                                <div class="pricing">
                                    <h4 class="amt">₹326</h4> 
                                    <h6 class="rs">₹499</h6>  
                                    <h6 class="discount">(-34%)</h6>  
                                </div>
                                <div class="shopbutton">
                                    <a href="#" class="cart">Add to Cart</a>
                                    <a href="#" class="buy">Buy</a>
                                </div>
                            </td>
                            <td>
                                <img class="bookimg" src="https://m.media-amazon.com/images/I/51cYzBC0keL._AC_UF1000,1000_QL80_.jpg" alt="mastery">
                                <p class="booktitle">Mastery</p>
                                <div class="pricing">
                                    <h4 class="amt">₹326</h4> 
                                    <h6 class="rs">₹499</h6>  
                                    <h6 class="discount">(-34%)</h6>  
                                </div>
                                <div class="shopbutton">
                                    <a href="#" class="cart">Add to Cart</a>
                                    <a href="#" class="buy">Buy</a>
                                </div>
                            </td>
                            <td>
                                <img class="bookimg" src="https://m.media-amazon.com/images/I/71u1UeKHzTL._AC_UF1000,1000_QL80_.jpg" alt="the daily laws">
                                <p class="booktitle">The Daily Laws</p>
                                <div class="pricing">
                                    <h4 class="amt">₹326</h4> 
                                    <h6 class="rs">₹499</h6>  
                                    <h6 class="discount">(-34%)</h6>  
                                </div>
                                <div class="shopbutton">
                                    <a href="#" class="cart">Add to Cart</a>
                                    <a href="#" class="buy">Buy</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img class="bookimg" src="https://m.media-amazon.com/images/I/81UDSuaFAeL._AC_UF1000,1000_QL80_.jpg" alt="java full reference">
                                <p class="booktitle">Java Full Reference</p>
                                <div class="pricing">
                                    <h4 class="amt">₹326</h4> 
                                    <h6 class="rs">₹499</h6>  
                                    <h6 class="discount">(-34%)</h6>  
                                </div>
                                <div class="shopbutton">
                                    <a href="#" class="cart">Add to Cart</a>
                                    <a href="#" class="buy">Buy</a>
                                </div>
                            </td>
                            <td>
                                <img class="bookimg" src="https://m.media-amazon.com/images/I/61eCL4mm+GL._AC_UF1000,1000_QL80_.jpg" alt="python programming">
                                <p class="booktitle">Python Programming</p>
                                <div class="pricing">
                                    <h4 class="amt">₹326</h4> 
                                    <h6 class="rs">₹499</h6>  
                                    <h6 class="discount">(-34%)</h6>  
                                </div>
                                <div class="shopbutton">
                                    <a href="#" class="cart">Add to Cart</a>
                                    <a href="#" class="buy">Buy</a>
                                </div>
                            </td>
                            <td>
                                <img class="bookimg" src="https://m.media-amazon.com/images/I/51EyaJeebHL._AC_UF1000,1000_QL80_.jpg" alt="the c programming language">
                                <p class="booktitle">The C Programming Language</p>
                                <div class="pricing">
                                    <h4 class="amt">₹326</h4> 
                                    <h6 class="rs">₹499</h6>  
                                    <h6 class="discount">(-34%)</h6>  
                                </div>
                                <div class="shopbutton">
                                    <a href="#" class="cart">Add to Cart</a>
                                    <a href="#" class="buy">Buy</a>
                                </div>
                            </td>
                            <td>
                                <img class="bookimg" src="https://images.booksense.com/images/686/983/9798656983686.jpg" alt="C++ programming">                                
                                <p class="booktitle">C++ Programming</p>
                                <div class="pricing">
                                    <h4 class="amt">₹326</h4> 
                                    <h6 class="rs">₹499</h6>  
                                    <h6 class="discount">(-34%)</h6>  
                                </div>
                                <div class="shopbutton">
                                    <a href="#" class="cart">Add to Cart</a>
                                    <a href="#" class="buy">Buy</a>
                                </div>
                            </td>
                            
                        </tr>
                    
                    </table>
                </div>
            <button class="see-all">See All Bestsellers</button>
        </section>

        <section class="new-releases">
            <h2><mark>New Releases</mark></h2>
            <div class="book-list">
                <div class="book">New Book 1</div>
                <div class="book">New Book 2</div>
            </div>
        </section>

        <section class="recommendations">
            <h2><mark>Recommendations for You</mark></h2>
            <div class="recommendation-list">
                <div class="book">Recommended Book 1</div>
                <div class="book">Recommended Book 2</div>
            </div>
        </section>


    <footer>
        <div class="footer-links">
            <a href="#">Privacy Policy</a>
            <a href="#">Terms of Service</a>
            <a href="#">Help Center</a>
            <a href="#">Contact Us</a>
        </div>
        <div class="social-media">
            <a href="#">Facebook</a>
            <a href="#">Twitter</a>
            <a href="#">Instagram</a>
        </div>
        <div class="payment-methods">Accepted Payments: paytm,phonepay,googlepay,bhimupi</div>
    </footer>
</body>
</html>