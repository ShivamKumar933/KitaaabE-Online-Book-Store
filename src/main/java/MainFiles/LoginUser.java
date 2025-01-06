package MainFiles;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.mysql.cj.Session;

import DB.ConnectionInit;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement pre;
	private HttpSession session;
	private List<Book> booklist;
	
    public LoginUser() {
    	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		con = ConnectionInit.getConnection();
		session = request.getSession();
	
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
			pre = con.prepareStatement("select * from users where email = ?");
			pre.setString(1, email);
			
			ResultSet rs = pre.executeQuery();
			if(rs.next()) {
				if(password.equals(rs.getString("password"))) {
					
					session.setAttribute("user", new User(rs.getString("name"), email, password,rs.getString("gender"), rs.getString("address"), rs.getString("mobno")));
						
					response.sendRedirect("learn.jsp");
				}
				else {
					request.setAttribute("passwordMatch", false);
					redirectToLogin(request, response);
				}
			}
			else {
				request.setAttribute("isEmailAvailable", false);
				redirectToLogin(request, response);
			}
		}catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}
	
	private void redirectToLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("Login.jsp").include(request, response);
	}

}
