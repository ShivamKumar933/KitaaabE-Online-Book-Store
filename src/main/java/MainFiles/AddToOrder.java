package MainFiles;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class AddToOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
    public AddToOrder() {
        
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		if(user!=null) {
			String ref = request.getHeader("Referer");
			ref = ref.replace("http://localhost:8080/KitaaabE/","");
			if(ref.equalsIgnoreCase("buypage.jsp")) {
				user.getOrderItem().addItem(request.getParameter("bookId"), 1);
			}
			else {
				transferCartToOrder(user);
			}
		}
		else {
			response.sendRedirect("Login.jsp");
		}
		
		response.sendRedirect("OrderDone.jsp");
	}
	
	private void transferCartToOrder(User user) {
		Map<String, Integer> cart= user.getCartList();
		Set<String> keys = cart.keySet();
		if(cart!=null && !cart.isEmpty()) {
			Iterator<String> itr = keys.iterator();
			while(itr.hasNext()) {
				String bookid = itr.next();
				user.getOrderItem().addItem(bookid, cart.get(bookid));
			}
		}
		
		user.getCartItem().removeAllItem();
	}
}
