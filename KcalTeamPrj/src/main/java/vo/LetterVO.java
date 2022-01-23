package vo;

import java.sql.Date;

public class LetterVO {
	private int lnum;
	private String rnick;
	private String snick;
	private String title;
	private String content;
	private Date date;
	private String ischeck;
	private int start;
	private int count;
	
	public LetterVO() {
		this.start = 0;
		this.count = 10;
	}

	public int getLnum() {
		return lnum;
	}

	public void setLnum(int lnum) {
		this.lnum = lnum;
	}

	public String getRnick() {
		return rnick;
	}

	public void setRnick(String rnick) {
		this.rnick = rnick;
	}

	public String getSnick() {
		return snick;
	}

	public void setSnick(String snick) {
		this.snick = snick;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getIscheck() {
		return ischeck;
	}

	public void setIscheck(String ischeck) {
		this.ischeck = ischeck;
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
