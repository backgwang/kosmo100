package kr.co.wonderland.mvc.dto;

public class LectureDTO {

	private int lnum;
	private int lscode; // °­ÁÂ fk
	private String ltitle;
	private int lruntime;
	
	public int getLnum() {
		return lnum;
	}
	public void setLnum(int lnum) {
		this.lnum = lnum;
	}
	public int getLsode() {
		return lscode;
	}
	public void setLsode(int lsode) {
		this.lscode = lsode;
	}
	public String getLtitle() {
		return ltitle;
	}
	public void setLtitle(String ltitle) {
		this.ltitle = ltitle;
	}
	public int getLruntime() {
		return lruntime;
	}
	public void setLruntime(int lruntime) {
		this.lruntime = lruntime;
	}
}