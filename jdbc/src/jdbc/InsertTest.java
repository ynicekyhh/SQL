package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertTest {

	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			//1. JDBC 드라이버 로딩(JDBC 클래스 로딩)
			Class.forName( "oracle.jdbc.driver.OracleDriver" );

			//2. Connection 가져오기
			/* "jdbc:oracle:thin:" 이건 정해져 있는 포맷 */
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection( url, "dev", "dev" );

			//3. Statement 준비
			String sql = 	" insert" +
							"   into author" +
							" values( seq_author.nextval, ?, ?)";
			/* prepareStatement는 Statement의 상속을 받아 구현되었으며, jdbc에 sql문을 미리 준비시켜놓고, 값들은 '?'로 놔두었다가 나중에 java코드에서 바인딩하면서 값을 세팅한다. */
			pstmt = conn.prepareStatement(sql);

			//4. 바인딩 - ?에다가 값을 세팅하게됨
			pstmt.setString( 1, "공자" );			//1번째 ?에 "공자"를 세팅
			pstmt.setString( 2, "어쩌구저쩌구" );	//2번째 ?에 "어쩌구저쩌구"를 세팅

			//5. SQL문 실행 - 주의!!!!sql을 넣어주면 안됨!!
			int count = pstmt.executeUpdate();
			
			//6. 성공유무 - 실패했다면 쿼리가 실패한 것이 아니라 비즈니스적인 요소에서 update가 실패한 것
			System.out.println( count == 1 ? "성공" : "실패" );

		} catch (ClassNotFoundException e) {
			System.out.println( "드라이버 로딩 실패:" + e );
		} catch (SQLException e) {
			System.out.println( "연결실패 : " + e );
		} finally {
			//3. 자원 정리
			try {
				if( pstmt != null ) {
					pstmt.close();
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
