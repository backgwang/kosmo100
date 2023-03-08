package kr.co.wonderland.mvc.dto;

public class StudySubDTO {
	private int ssnum;
	private int stcode;
	private String sscontent;
	private String sswriter;
	private String ssdate;
	private int rownum;
	
	public int getSsnum() {
		return ssnum;
	}
	public void setSsnum(int ssnum) {
		this.ssnum = ssnum;
	}
	public int getStcode() {
		return stcode;
	}
	public void setStcode(int stcode) {
		this.stcode = stcode;
	}
	public String getSscontent() {
		return sscontent;
	}
	public void setSscontent(String sscontent) {
		this.sscontent = sscontent;
	}
	public String getSswriter() {
		return sswriter;
	}
	public void setSswriter(String sswriter) {
		this.sswriter = sswriter;
	}
	public String getSsdate() {
		return ssdate;
	}
	public void setSsdate(String ssdate) {
		this.ssdate = ssdate;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
}
