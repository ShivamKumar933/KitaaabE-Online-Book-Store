package DB;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class ConnectionInit{
	private static Connection con;
	public static Connection getConnection() {
		try {
			Properties p = new Properties();
			
			
			InputStream is = ConnectionInit.class.getClassLoader().getResourceAsStream("dataconfig.properties");
			p.load(is);
			
			String driver = p.getProperty("driver");
			String db_url = p.getProperty("db_url");
			String db_user = p.getProperty("db_user");
			String db_password = p.getProperty("db_password");
		
			
			Class.forName(driver);
			con = DriverManager.getConnection(db_url, db_user, db_password);
		}catch (Exception e) {
			System.out.println("Error occured in connection building "+e.getMessage());
		}
		return con;
	}
}
