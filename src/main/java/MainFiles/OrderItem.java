package MainFiles;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.Result;

import DB.ConnectionInit;

public class OrderItem {
	private User user;
	private int orderId;
	private Map<Integer, Order> orderList;
	
	public OrderItem(User user) {
		this.user = user;
		orderList = user.getOrderList();
		initOrderList();
	}
	
	private void initOrderList() {
		try (Connection con = ConnectionInit.getConnection()){
			PreparedStatement ps = con.prepareStatement("select orderid, bookid, userid, quantity, order_date from orders where userid = ?");
			ps.setString(1, user.getUserEmail());
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Order newOrder = new Order(rs.getInt("orderid"), rs.getString("userid"),rs.getString("bookid") , rs.getInt("quantity"));
				newOrder.setOrderDate(rs.getDate("order_date"));
				orderList.put(rs.getInt("orderid"), newOrder);
			
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addItem(String bookid, int quant) {
			try (Connection connection = ConnectionInit.getConnection();){
				
				String sql = "insert into orders(userid, bookid, quantity, order_date) values(?,?,?,?)";
				PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				
				LocalDate todayDate = LocalDate.now();
				
				ps.setString(1, user.getUserEmail());
				ps.setString(2, bookid);
				ps.setInt(3, quant);
				ps.setDate(4, Date.valueOf(todayDate));
				
				int i = ps.executeUpdate();
				
				if(i > 0) {
					ResultSet rs = ps.getGeneratedKeys();
					if(rs.next()) {
						orderId = rs.getInt(1);
					}
					Order newOrder =  new Order(orderId, user.getUserEmail(),bookid , quant);
					newOrder.setOrderDate(Date.valueOf(todayDate));
					orderList.put(orderId,newOrder);
				}
				else {
					System.out.println("Book Not Ordered!");
				}
				ps.close();
			} 
			catch (Exception e) {
			}
	}
	
	public void removeItem(int orderId) {
		if(orderList.containsKey(orderId)) {
			try (Connection connection = ConnectionInit.getConnection();) {
				PreparedStatement ps = connection.prepareStatement("Delete from orders where orderid=?");
				ps.setInt(1, orderId);
				
				int i  = ps.executeUpdate();
				
				orderList.remove(orderId);
				ps.close();
				
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
	
}
