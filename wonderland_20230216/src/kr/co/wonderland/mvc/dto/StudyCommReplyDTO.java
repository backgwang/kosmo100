package kr.co.wonderland.mvc.dto;

public class StudyCommReplyDTO {
	private int scrnum;
	private int sccode;
	private String scrcontent;
	private String scrwriter;
	private String scrdate;
	private int rownum;
	public int getScrnum() {
		return scrnum;
	}
	public void setScrnum(int scrnum) {
		this.scrnum = scrnum;
	}
	public int getSccode() {
		return sccode;
	}
	public void setSccode(int sccode) {
		this.sccode = sccode;
	}
	public String getScrcontent() {
		return scrcontent;
	}
	public void setScrcontent(String scrcontent) {
		this.scrcontent = scrcontent;
	}
	public String getScrwriter() {
		return scrwriter;
	}
	public void setScrwriter(String scrwriter) {
		this.scrwriter = scrwriter;
	}
	public String getScrdate() {
		return scrdate;
	}
	public void setScrdate(String scrdate) {
		this.scrdate = scrdate;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
}
