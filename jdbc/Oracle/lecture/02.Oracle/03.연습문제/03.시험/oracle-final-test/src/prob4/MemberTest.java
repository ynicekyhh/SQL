package prob4;

import kr.ac.smu.prob4.main.MemberDao;
import kr.ac.smu.prob4.main.MemberVo;

public class MemberTest {

	public static void main(String[] args) {
		
		MemberDao dao = new MemberDao();
		
		// 김상명 추가
		MemberVo vo = new MemberVo();
		vo.setEmail( "kim@smu.ac.kr" );
		vo.setName( "김상명" );
		vo.setGender( "남" );
		vo.setPassword( "12345" );
		
		dao.insertMember( vo );
		
		// 현재 멤버 리스트 출력
		printAllMemebrList();

		// 이상명 추가
		vo.setEmail( "lee@smu.ac.kr" );
		vo.setName( "이상명" );
		vo.setGender( "여" );
		vo.setPassword( "12345" );

		dao.insertMember( vo );
		
		// 현재 멤버 리스트 출력
		printAllMemebrList();
		
		// 이상명 비밀번호 변경
		vo.setEmail( "lee@smu.ac.kr" );
		vo.setName( "" );
		vo.setGener( "" );
		vo.setPassword( "54321" );

		dao.alterPassword( vo );
		
		// 현재 멤버 리스트 출력
		printAllMemebrList();
		
		// 김상명 삭제
		dao.deleteMember( "kim@smu.ac.kr" );

		// 현재 멤버 리스트 출력
		printAllMemebrList();
		
	}
	
	public static void printAllMemebrList() {
		System.out.println( "***** 현재  멤버 리스트 *****" );
	}
}
