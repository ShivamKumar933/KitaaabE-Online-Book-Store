package MainFiles;
import DB.ConnectionInit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class BookLoad {
	private static Connection connection;
	private static PreparedStatement pre;
	
	
	public static Map<String, Book> loadBooks(String genre){
		
		try {
			connection = ConnectionInit.getConnection();
			
			pre = connection.prepareStatement("select id, name, author_name, book_img, genre, dis_price, act_price, DATE_FORMAT(Date(release_date),'%d-%b-%Y') as release_date from books where genre = ? order by release_date desc");
			pre.setString(1, genre);
			
			ResultSet rs = pre.executeQuery();
			
			Map<String, Book> bl = new HashMap<String, Book>();
			
			while(rs.next()) {
				bl.put(rs.getString("id"),new Book(rs.getString("id"), rs.getString("name"), rs.getString("author_name"),
						rs.getString("book_img"), rs.getString("genre"), rs.getDouble("dis_price"), rs.getDouble("act_price"), rs.getString("release_date")));
			}
//			System.out.println("BooKload called");
			rs.close();
			return bl;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		finally {
			try {
				pre.close();
				connection.close();
			} catch (Exception e2) {
					e2.printStackTrace();
			}
		}
		
	}
	
	
	public static Map<String, Book> newReleasedBooks(){
		try {
			connection = ConnectionInit.getConnection();
			
			pre = connection.prepareStatement("select * from books order by release_date desc");
			
			ResultSet rs = pre.executeQuery();
			
			Map<String, Book> bl = new HashMap<String, Book>();
			
			while(rs.next()) {
				bl.put(rs.getString("id"),new Book(rs.getString("id"), rs.getString("name"), rs.getString("author_name"),
						rs.getString("book_img"), rs.getString("genre"), rs.getDouble("dis_price"), rs.getDouble("act_price"), rs.getString("release_date")));
			}
//			System.out.println("BooKload called");
			return bl;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		finally {
			try {
				pre.close();
				connection.close();
			} catch (Exception e2) {
					e2.printStackTrace();
			}
		}
		
	}
	
	public static Map<String, Book> loadAllBooks(){
		try {
			connection = ConnectionInit.getConnection();
			
			pre = connection.prepareStatement("select * from books");
			
			ResultSet rs = pre.executeQuery();
			
			Map<String, Book> bl = new HashMap<String, Book>();
			
			while(rs.next()) {
				bl.put(rs.getString("id"),new Book(rs.getString("id"), rs.getString("name"), rs.getString("author_name"),
						rs.getString("book_img"), rs.getString("genre"), rs.getDouble("dis_price"), rs.getDouble("act_price"), rs.getString("release_date")));
			}
//			System.out.println("BooKload called");
			return bl;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		finally {
			try {
				pre.close();
				connection.close();
			} catch (Exception e2) {
					e2.printStackTrace();
			}
		}
	}
}
