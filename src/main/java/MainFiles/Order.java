package MainFiles;

import java.sql.Date;

public class Order {
	private String userId;
	private int orderId;
	private String bookId;
	private int quantity;
	private Date orderDate;
	
	public Order(int orderId, String userId,  String bookId, int quantity) {
		super();
		this.userId = userId;
		this.orderId = orderId;
		this.bookId = bookId;
		this.quantity = quantity;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	
	
}
