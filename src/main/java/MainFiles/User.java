package MainFiles;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

enum Gender{
	MALE, FEMALE, OTHER;
}
public class User {
	
	private String userName;
	private String userEmail;
	private String userPassword;
	private Gender gender;
	private String address;
	private String mobNo;
	private CartItem cartItem;
	private OrderItem orderItem;
	private Map<String, Integer> cartList;
	private Map<Integer, Order> orderList;
//	public User(String name, String email, String password) {
//			this.userName = name;
//			this.userEmail = email;
//			this.userPassword = password;
//	}
	
	public User(String name, String email, String password, String gender, String address, String mobno) {
		this.userName = name;
		this.userEmail = email;
		this.userPassword = password;
		this.gender = Gender.valueOf(gender.toUpperCase());
		this.address = address;
		this.mobNo = mobno;
		cartList = new LinkedHashMap<String, Integer>();
		orderList = new LinkedHashMap<Integer,Order>(); 
		cartItem = new CartItem(this);
		orderItem = new OrderItem(this);
	}
	
	
	

//	public void setGender(Gender gender) {
//		this.gender = gender;
//	}
//
//	public void setAddress(String address) {
//		this.address = address;
//	}
//
//	public void setMobNo(String mobNo) {
//		this.mobNo = mobNo;
//	}
	
	public Map<Integer,Order> getOrderList(){
		return orderList;
	}
	
	public OrderItem getOrderItem() {
		return orderItem;
	}
	
	public Map<String, Integer> getCartList() {
		return cartList;
	}
	
	
	public CartItem getCartItem() {
		return cartItem;
	}
	
	public String getUserName() {
		return userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public String getGender() {
		return gender.toString();
	}

	public String getAddress() {
		return address;
	}

	public String getMobNo() {
		return mobNo;
	}
	
	
	
}
