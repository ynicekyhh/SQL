package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class HRSalary {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			//1. JDBC 드라이버 로딩
			Class.forName( "oracle.jdbc.driver.OracleDriver" );

			//2. Connection 가져오기
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "hr", "hr");

			//3. Statement 준비
			String sql = 	" select e.LAST_NAME || ' ' || e.FIRST_NAME as name, e.SALARY" + 
					"   from EMPLOYEES e" + 
					"  where ? <= e.SALARY and e.SALARY <= ?" + 
					" order by e.SALARY desc";
			pstmt = conn.prepareStatement(sql);

			while(true) {
				//4. 입력값 받기 및 바인딩
				System.out.println("(min max) >>");
				int minSalary = scanner.nextInt();
				int maxSalary = scanner.nextInt();

				pstmt.setInt( 1, minSalary);
				pstmt.setInt( 2, maxSalary);

				//4. SQL문 실행
				rs = pstmt.executeQuery();

				//5. 결과 가져오기
				System.out.println("===============================");
				System.out.println("----Name------------SALARY-----");
				while( rs.next() ) {
					String name = rs.getString("name");
					int salary = rs.getInt("SALARY");

					String result = String.format("%-20s %d", name, salary);
					System.out.println(result);
				}
				
				System.out.println();
			}


		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("연결 실패:" + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
				if(scanner != null) {
					scanner.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
