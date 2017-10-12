package kr.ac.smu.prob123.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class SMUDBDao {
	public Connection getConnection() 
		throws ClassNotFoundException, SQLException {
		
		Class.forName( "oracle.jdbc.driver.OracleDriver" );
			
		String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection	connection = DriverManager.getConnection( dbUrl, "smudb", "smudb" );
		
		return connection;
		
	}
}
