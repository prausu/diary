package board;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public DBConnect() {}
	
	public Connection getConnection() {
		String jdbcDriver = "jdbc:mysql://koers.asuscomm.com/s201245811" +
				"?useUnicode=true&characterEncoding=euckr";
		String dbUser = "s201245811";
		String dbPass = "201245811";
		
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}
}
