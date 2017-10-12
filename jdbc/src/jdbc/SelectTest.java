package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SelectTest {

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			//1. JDBC 드라이버 로딩(JDBC 클래스 로딩)
			Class.forName( "oracle.jdbc.driver.OracleDriver" );

			//2. Connection 가져오기
			/* "jdbc:oracle:thin:" 이건 정해져 있는 포맷 */
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection( url, "hr", "hr" );

			//3. Statement 객체 생성
			stmt = conn.createStatement();
			
			//4. SQL문 실행 - 쿼리문은 에러가 많을 수 있으니, 따로 쿼리문만 테스트해 본 후 추가할 것, JDBC를 사용할 때는 ';'이 있으면 jdbc가 쿼리문이 더 있는 것으로 생각함
			String sql = "select employee_id," +
					     "		 first_name," +
					     "		 last_name," +
					     "		 salary" +
					     "  from EMPLOYEES";
			rs = stmt.executeQuery(sql);
			
			//5. 결과 가져오기 - 입력한 순서대로 컬럼이 만들어지니 컬럼의 번호로 가져옴
			while( rs.next() ) {
				long employeeId = rs.getLong( 1 );	// 보통 employee_id같은 no는 큰 값이니까 넉넉하게 long으로 사용
				String firstName = rs.getString( 2 );
				String lastName = rs.getString( 3 );
				int salary = rs.getInt( 4 );
				
				System.out.println( employeeId + ":" + firstName + ":" + lastName + ":" + salary);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println( "드라이버 로딩 실패:" + e );
		} catch (SQLException e) {
			System.out.println( "연결실패 : " + e );
		} finally {
			//3. 자원 정리
			try {
				if( rs != null ) {
					rs.close();
				}
				if( stmt != null ) {
					stmt.close();
				}
				if( conn != null ) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
