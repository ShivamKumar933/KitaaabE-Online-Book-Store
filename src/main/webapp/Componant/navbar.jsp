<header>
    <div class="main-header">
        <a class ="web-name" href = "learn.jsp">Kitaaab<span style="color:red">E</span></a> 
            <nav>
              
                <% 
                	Object user = session.getAttribute("user");
            		if(user == null)
            		{
            	%>
                <a href="Login.jsp">LogIn</a>
                <%
            		}
            		else{
            			
            	%>
            	<a href="Profile.jsp"><%=((MainFiles.User)user).getUserName() %></a>
            	<%
            		}
            	%>
                <div class="dropdown">
                    <button class="dropbtn">Category 
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="allBooks.jsp?category=Programming">Programming</a>    
                        <a href="allBooks.jsp?category=Fiction">Fiction</a>    
                        <a href="allBooks.jsp?category=Romance">Romance</a>    
                        <a href="allBooks.jsp?category=Non-Fiction">Non-Fiction</a> 
                        <a href="allBooks.jsp?category=Mystery">Mystery</a>
                        <a href="allBooks.jsp?category=History">History</a>
                    </div>
                </div>
            
            </nav>
    </div>
</header>