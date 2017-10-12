package com.bigdata2017.jdbc.bookshop.dao.test;

import java.util.List;

import com.bigdata2017.jdbc.bookshop.dao.BookDao;
import com.bigdata2017.jdbc.bookshop.vo.BookVo;

public class BookDaoTest {

	public static void main(String[] args) {
		deleteTest();
		insertTest();
		getListTest();
		
		System.out.println("\n");
		updateTest();
		getListTest();
		
		getTitleTest();
	}
	
	public static void getTitleTest() {
		System.out.println(new BookDao().getBookTitle(9L));
	}
	
	public static void deleteTest() {
		new BookDao().delete();
	}
	
	public static void updateTest() {
		new BookDao().updateState( 1L, "대여중");
		new BookDao().updateState( 3L, "대여중");
		new BookDao().updateState( 5L, "대여중");
		new BookDao().updateState( 6L, "대여중");
	}
	
	public static void getListTest() {
		BookDao dao = new BookDao();
		List<BookVo> list = dao.getList();
		
		for( BookVo vo : list ) {
			System.out.println(vo);
		}
		
	}
	
	public static void insertTest() {
		BookDao dao = new BookDao();
		BookVo vo = new BookVo();
		vo.setTitle( "트와일라잇" );
		vo.setAuthorNo( 1L );
		vo.setState( "대여가능" );
		dao.insert(vo);
		
		vo.setTitle( "왜 우리는 술을 마시는가" );
		vo.setAuthorNo( 2L );
		vo.setState( "대여가능" );
		dao.insert(vo);
		
		vo.setTitle( "BBBBB" );
		vo.setAuthorNo( 3L );
		vo.setState( "대여가능" );
		dao.insert(vo);
		
		vo.setTitle( "CCCCC" );
		vo.setAuthorNo( 4L );
		vo.setState( "대여가능" );
		dao.insert(vo);
		
		vo.setTitle( "DDDDD" );
		vo.setAuthorNo( 5L );
		vo.setState( "대여가능" );
		dao.insert(vo);
		
		vo.setTitle( "EEEEE" );
		vo.setAuthorNo( 6L );
		vo.setState( "대여가능" );
		dao.insert(vo);
		
		vo.setTitle( "하하하하하" );
		vo.setAuthorNo( 7L );
		vo.setState( "대여가능" );
		dao.insert(vo);
		
	}

}
