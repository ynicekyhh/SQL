package prob4.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class HRDao {
	public Connection getConnection() 
		throws ClassNotFoundException, SQLException {
		
		Class.forName( "oracle.jdbc.driver.OracleDriver" );
			
		String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection	connection = DriverManager.getConnection( dbUrl, "hr", "hr" );
		
		return connection;
		
	}
}
