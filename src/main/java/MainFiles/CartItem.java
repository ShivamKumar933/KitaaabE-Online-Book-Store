package MainFiles;

import DB.ConnectionInit;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;


public class CartItem {
	private Map<String, Integer> cartList;
	private User user;
	public CartItem(User user) {
		this.user = user; 
		this.cartList = user.getCartList();
		initCartList();
	}
	
	private void initCartList() {
		try (Connection con = ConnectionInit.getConnection()){
			PreparedStatement ps = con.prepareStatement("select bookid from cart where userid = ?");
			ps.setString(1, user.getUserEmail());
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				cartList.put(rs.getString("bookid"), 1);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addItem(String bookid) {
		if(!cartList.containsKey(bookid)) {
			try (Connection connection = ConnectionInit.getConnection()){
				
				PreparedStatement ps = connection.prepareStatement("insert into cart(userid, bookid) values(?,?)");
				
				ps.setString(1, user.getUserEmail());
				ps.setString(2, bookid);
				
				int i = ps.executeUpdate();
				
				if(i > 0) {
					cartList.put(bookid,1);
				}
				else {
					System.out.println("Book Not Added!");
				}
				ps.close();
			} 
			catch (Exception e) {
			}
		}
	}
	
	public void removeItem(String bookid) {
		if(cartList.containsKey(bookid)) {
			try (Connection connection = ConnectionInit.getConnection()) {
				PreparedStatement ps = connection.prepareStatement("Delete from cart where userid = ? and bookid = ?");
				ps.setString(1, user.getUserEmail());
				ps.setString(2, bookid);
				
				int i  = ps.executeUpdate();
				
				cartList.remove(bookid);
				ps.close();
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	public void removeAllItem() {
		if(!cartList.isEmpty()) {
			try (Connection connection = ConnectionInit.getConnection()) {
				PreparedStatement ps = connection.prepareStatement("Delete from cart where userid = ?");
				ps.setString(1, user.getUserEmail());
				int i  = ps.executeUpdate();
				if(i>0){
					cartList.clear();
				}
				else {
					throw new SQLException("Exception in CartItem, can't remover all items!");
				}
				
				ps.close();
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
