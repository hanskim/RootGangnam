package it.util;

import java.sql.Connection;
import java.sql.DriverManager;


public class ConnUtil {
	public static Connection open() throws Exception {			// ctrl+shift+o : smart import
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url ="jdbc:oracle:thin:@192.168.10.113:1521:xe";
		String user ="salz";
		String password="1111";
		
		Connection conn = DriverManager.getConnection(url, user, password);
		return conn;
	}
}
