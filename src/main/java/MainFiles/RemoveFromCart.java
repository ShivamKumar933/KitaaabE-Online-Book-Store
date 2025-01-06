package MainFiles;

import java.io.IOException;
import java.util.Set;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RemoveFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
    public RemoveFromCart() {
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		user.getCartItem().removeItem(request.getParameter("bookId"));
		
		String ref = request.getHeader("Referer");
		ref = ref.replace("http://localhost:8080/KitaaabE/","");
		System.out.println(ref);
		if(ref.equals("")) {
			response.sendRedirect("learn.jsp");			
		}
		else {
			response.sendRedirect(ref);
		}
		
	}

}
