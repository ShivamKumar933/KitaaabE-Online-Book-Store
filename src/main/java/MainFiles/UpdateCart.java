package MainFiles;

import java.io.IOException;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
    public UpdateCart() {
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user!=null) {
			Map<String, Integer> cartList = user.getCartList();
			String bookId = request.getParameter("bookId");
			if(cartList.containsKey(bookId)){
				Integer quant = Integer.parseInt(request.getParameter("quantity"));
				cartList.put(bookId, quant);
				request.getRequestDispatcher("CartItems.jsp").forward(request, response);
			}
		}
		else {
			response.sendRedirect("Login.jsp");
		}
	}

}
