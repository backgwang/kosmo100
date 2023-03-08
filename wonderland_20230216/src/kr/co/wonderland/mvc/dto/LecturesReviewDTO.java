package kr.co.wonderland.mvc.dto;

public class LecturesReviewDTO {
	private int lrnum;
	private int lscode;
	private String lrwriter;
	private String lrcontent;
	private int lrstar;
	private String lrdate;
	
	public int getLrnum() {
		return lrnum;
	}
	public void setLrnum(int lrnum) {
		this.lrnum = lrnum;
	}
	public int getLscode() {
		return lscode;
	}
	public void setLscode(int lscode) {
		this.lscode = lscode;
	}
	public String getLrwriter() {
		return lrwriter;
	}
	public void setLrwriter(String lrwriter) {
		this.lrwriter = lrwriter;
	}
	public String getLrcontent() {
		return lrcontent;
	}
	public void setLrcontent(String lrcontent) {
		this.lrcontent = lrcontent;
	}
	public int getLrstar() {
		return lrstar;
	}
	public void setLrstar(int lrstar) {
		this.lrstar = lrstar;
	}
	public String getLrdate() {
		return lrdate;
	}
	public void setLrdate(String lrdate) {
		this.lrdate = lrdate;
	}
}
