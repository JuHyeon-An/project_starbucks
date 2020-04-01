 
package bean;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	public static Connection getConn() {
		String driver = "oracle.jdbc.driver.OracleDriver";
//		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
//		String dbUser = "starbucks";
//		String dbPwd = "1234";
		String url = "jdbc:oracle:thin:@192.168.0.32:1521:xe";
		String dbUser = "hr";
		String dbPwd = "hr";
		Connection conn = null;
		
		try {
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url, dbUser, dbPwd);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return conn;
	}
}

