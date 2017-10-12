package com.bigdata2017.jdbc.bookshop.main;

import java.util.List;
import java.util.Scanner;

import com.bigdata2017.jdbc.bookshop.dao.BookDao;
import com.bigdata2017.jdbc.bookshop.vo.BookVo;

/* practice04 - prob02참고 */
public class BookShopApp {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		BookDao dao = new BookDao();
		
		System.out.println("*****도서 정보 출력하기******");
		displayBookInfo();

		System.out.print("대여 하고 싶은 책의 번호를 입력하세요:");
		long num = scanner.nextInt();
		
		dao.updateState(num, "대여중");
		
		System.out.println(dao.getBookTitle(num) + "이(가) 대여 되었습니다.");
		/* state 정보 setting */
		
		
		System.out.println("*****도서 정보 출력하기******");
		displayBookInfo();
		
		
		scanner.close();
	}

	private static void displayBookInfo() {
		//만들어놓은 DAO를 이용, 여기서 쿼리문을 쫙 넣을 필요가 없어짐
		BookDao dao = new BookDao();
		
		List<BookVo> list = dao.getList();
		
		for(BookVo vo : list) {
			System.out.println(
					"번호:" + vo.getNo() + 
					", 책 제목:" + vo.getTitle() + 
					", 저자:" + vo.getAuthorName() +
					", 대여 유무:" + vo.getState() );
		}
	}

}
