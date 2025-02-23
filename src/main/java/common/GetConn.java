package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConn {
	private static Connection conn = null;
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/javaclass";
	private String user = "root";
	private String password = "1234";
	
	private static GetConn instance = new GetConn();
	private GetConn() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,password);
		} catch (ClassNotFoundException e) {
			e.getMessage();
		} catch (SQLException e) {
			e.getMessage();
		}
	}
	public static GetConn getInstance() {
		return instance;
	}
	public static Connection getConn() {
		return conn;
	}
}
