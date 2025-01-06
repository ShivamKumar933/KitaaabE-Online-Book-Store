<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="about.css">
    <link rel="stylesheet" href="./Componant/navbar.css">
    <link rel="stylesheet" href="./Componant/footer.css">
    <title>KitaaabE - About Us</title>
</head>
<body>
	<%@include file="./Componant/navbar.jsp" %>
	<div>
            <button class="back-button" onclick="history.back()">Back</button>
    </div>
    <section class="about-section">
        <div class="container">
            <h2 class="about_us_heading">About Us</h2>
            <p>Welcome to KitaaabE Store! We are an e-bookstore offering a wide range of Books across various genres. Whether you're a fan of fiction, non-fiction, self-help, or academic literature, we have something for every reader. Our mission is to make reading accessible to everyone with just a click!</p>
            <p>At KitaaabE Store, we believe in the power of knowledge and the importance of reading. Our platform allows you to purchase your favorite books instantly, so you can enjoy reading on your preferred comfortableness.</p>

            <div class="about-info">
                <h3>Why Choose Us?</h3>
                <ul>
                    <li>Extensive library with wide range of Books</li>
                    <li>Easy to place order and quick delivery</li>
                    <li>Affordable pricing with regular discounts and offers</li>
                    <li>Wide range of genres to choose from</li>
                </ul>
            </div>

            <div class="team">
                <h3>Meet the Team</h3>
                <p>Our team is made up of passionate book lovers who are committed to making reading a seamless experience for all.</p>
                <div class="team-members">
                    <div class="team-member">
                        <img src="photu" alt="Team Member 1">
                        <h4>Shivam Kuma<span>r</span></h4>
                        <p>Founder</p>
                    </div>
                    <div class="team-member">
                        <img src="photu" alt="Team Member 2">
                        <h4>Shiksha Sharm<span>a</span></h4>
                        <p>Founder</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="./Componant/footer.jsp" %>
</body>
</html>