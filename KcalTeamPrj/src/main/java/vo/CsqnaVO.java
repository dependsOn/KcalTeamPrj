package vo;

import java.util.List;

public class CsqnaVO {
	
		//csqnaSeq = BIGINT로 지정했기에 int 
	private int csqnaSeq;
		// 나머지는 문자이기에 String
	private String nickname;
	private String password;
	private String title;
	private String contents;
	private int currentPage = 1;
	

	
	//csqna를 List화 시킬 때 쓰는 공식 / 뒤에 csQnaList는 내가 정한 이름
	private List<CsqnaVO> csQnaList;
	
	
	public List<CsqnaVO> getCsQnaList() {
		return csQnaList;
	}
	public void setCsQnaList(List<CsqnaVO> csQnaList) {
		this.csQnaList = csQnaList;
	}
	// 아래는 getters and setters
	public int getCsqnaSeq() {
		return csqnaSeq;
	}
	public void setCsqnaSeq(int csqnaSeq) {
		this.csqnaSeq = csqnaSeq;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	
	
	
}
