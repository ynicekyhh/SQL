package com.bigdata2017.jdbc.bookshop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bigdata2017.jdbc.bookshop.vo.BookVo;

public class BookDao {

	private Connection getConnection() throws SQLException {
		Connection conn = null;
		String url = null;

		try {
			Class.forName( "oracle.jdbc.driver.OracleDriver");
			url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "dev", "dev");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패: " + e);
		}

		return conn;
	}

	public String getBookTitle(long num) {
		String title = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = null;
		
		try {
			conn = getConnection();
			
			sql = "select title from book where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong( 1, num );
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				title = rs.getString("title");
			}
			
		} catch (SQLException e) {
			System.out.println("연결 실패:" + e);
		} finally {
			try {
				if( rs != null ) {
					rs.close();
				}
				if( pstmt != null ) {
					pstmt.close();
				}
				if( conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println("연결 끊기 실패: " + e);
			}
		}
		
		return title;
	}
	
	public List<BookVo> getList() {
		List<BookVo> list = new ArrayList<BookVo>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = null;

		try {
			conn = getConnection();

			/*
			 * no, title, author_name, state
			 */
			sql = 	" select b.NO, b.TITLE, a.NAME, b.STATE" + 
					"   from BOOK b, AUTHOR a" + 
					"  where b.AUTHOR_NO = a.NO" +
					" order by b.NO";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while( rs.next() ) {
				BookVo vo = new BookVo();
				vo.setNo( rs.getLong("no") );
				vo.setTitle( rs.getString("title") );
				vo.setAuthorName( rs.getString("name") );
				vo.setState( rs.getString("state") );

				list.add(vo);
			}

		} catch (SQLException e) {
			System.out.println("연결 실패:" + e);
		} finally {
			try {
				if( pstmt != null ) {
					pstmt.close();
				}
				if( conn != null ) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println("연결끊기 실패: " + e);
			}
		}

		return list;
	}

	public int delete() {
		int count = 0;
		Connection conn = null;
		Statement stmt = null;

		String sql = null;
		
		try {
			conn = getConnection();
			
			stmt = conn.createStatement();
			/* 모두 삭제(author -> book) */
			sql = "delete from book";
			
			count = stmt.executeUpdate(sql);
			
		} catch (SQLException e) {
			System.out.println("연결 실패:" + e);
		} finally {
			try {
				if( stmt != null ) {
					stmt.close();
				}
				if( conn != null ) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println("연결끊기 실패: " + e);
			}
		}

		return count;
	}

	public int insert( BookVo vo ) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = null;
		
		try {
			conn = getConnection();
			
			sql = 	" insert" + 
					"   into book" + 
					" values ( seq_book.nextval, ?, ?, ? )";
			pstmt = conn.prepareStatement(sql);
			/* binding */
			pstmt.setString( 1, vo.getTitle() );
			pstmt.setString( 2, vo.getState() );
			pstmt.setLong( 3, vo.getAuthorNo() );
			
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("연결 실패:" + e);
		} finally {
			try {
				if( conn != null ) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println("연결끊기 실패: " + e);
			}
		}
		
		return count;
	}

	public int updateState( Long no, String state ) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = null;
		
		try {
			conn = getConnection();
			
			sql = " update book set state=? where no=?";
			
			pstmt = conn.prepareStatement(sql);
			/* no binding */
			pstmt.setString( 1, state );
			pstmt.setLong( 2, no );
			
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("연결 실패:" + e);
		} finally {
			try {
				if( conn != null ) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println("연결 끊기 실패: " + e);
			}
		}
		
		return count;
	}

}
