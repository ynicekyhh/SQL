package com.bigdata2017.jdbc.bookshop.vo;

public class BookVo {
	private Long no;
	private String title;
	private String state;
	/*
	 * private AuthorVo vo;
	 * 주의 !! 이렇게는 선언하지 않는다. AuthorVo는 비즈니스 SQL쿼리로 가져오게 되기에 객체지향은 깨지지만 아래와 같이 각각을 입력받게 한다.
	 */
	private Long authorNo;
	private String authorName;
	
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Long getAuthorNo() {
		return authorNo;
	}
	public void setAuthorNo(Long authorNo) {
		this.authorNo = authorNo;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	
	@Override
	public String toString() {
		return "BookVo [no=" + no + ", title=" + title + ", state=" + state + ", authorNo=" + authorNo + ", authorName="
				+ authorName + "]";
	}
	
	
}
