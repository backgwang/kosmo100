package kr.co.wonderland.mvc.dto;

public class EnrolmentDTO {

	private int elnum;
	private int scode;
	private int lscode;
	
	private String startdate;
	
	public int getElnum() {
		return elnum;
	}
	public void setElnum(int elnum) {
		this.elnum = elnum;
	}
	public int getScode() {
		return scode;
	}
	public void setScode(int scode) {
		this.scode = scode;
	}
	public int getLscode() {
		return lscode;
	}
	public void setLscode(int lscode) {
		this.lscode = lscode;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
}
