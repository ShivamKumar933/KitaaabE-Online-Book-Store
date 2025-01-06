package MainFiles;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Period;

import com.mysql.cj.Session;

import DB.ConnectionInit;

public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Connection con;
    private PreparedStatement pre;
    private HttpSession session;
    public RegisterUser() {
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		con = ConnectionInit.getConnection();
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		session = request.getSession();
				
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String Confirmpassword = request.getParameter("confirm-password");
		
		try {
			
			pre = con.prepareStatement("select * from users where email = ?");
			pre.setString(1, email);
			
			ResultSet rs = pre.executeQuery();
			if(rs.next()) {
				request.setAttribute("isEmailAvailable", true);
				redirectToRegister(request, response);
				return;
			}
			
			rs.close();
			
			if(password.equals(Confirmpassword)) {
				
				pre = con.prepareStatement("insert into users(name, email, password, gender, address, mobno) values(?,?,?,?,?,?)");
				pre.setString(1, username);
				pre.setString(2, email);
				pre.setString(3, password);
				pre.setString(4, request.getParameter("gender").trim().toUpperCase());
				pre.setString(5, request.getParameter("city")+", "+request.getParameter("pincode")+", "+request.getParameter("country"));
				pre.setString(6, request.getParameter("mobno"));
				
				int i = pre.executeUpdate();
				if(i<0) {
					throw new SQLException("Data is not Inserted!!");
				}
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
			else {
				request.setAttribute("passwordmatch",false);
				redirectToRegister(request, response);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void redirectToRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("Register.jsp").include(request, response);
	}

}
