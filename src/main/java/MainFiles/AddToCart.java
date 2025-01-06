package MainFiles;

import java.io.IOException;
import java.util.LinkedHashSet;
import java.util.Set;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    public AddToCart() {
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		if(user == null) {
			response.sendRedirect("Login.jsp");
			return;
		}
	
		
		String id = request.getParameter("bookId");
		
		user.getCartItem().addItem(id);
		
		String ref = request.getHeader("Referer");
		ref = ref.replace("http://localhost:8080/KitaaabE/","");
		//System.out.println(ref);
		if(ref.equals("")) {
			response.sendRedirect("learn.jsp");			
		}
		else {
			response.sendRedirect(ref);
		}
		
	}

}
