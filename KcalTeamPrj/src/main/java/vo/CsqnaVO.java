package vo;

import java.util.List;

public class CsqnaVO {
	
		//csqnaSeq = BIGINT�� �����߱⿡ int 
	private int csqna_seq;
		// �������� �����̱⿡ String
	private String nickname;
	private String password;
	private String title;
	private String contents;
	private int start;
	private int count;
	
	

	public CsqnaVO() {
		super();
		this.start = 0;
		this.count = 10;
	}
	// �Ʒ��� getters and setters
	public int getCsqna_seq() {
		return csqna_seq;
	}
	
	public void setCsqna_seq(int csqna_seq) {
		this.csqna_seq = csqna_seq;
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
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

	

	
	
	
}