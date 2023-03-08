package kr.co.wonderland.mvc.dto;

public class StudyCommDTO {
	private int scnum;
	private int stcode;
	private String sccontent;
	private String scwriter;
	private String scdate;
	private int rownum;

	public int getScnum() {
		return scnum;
	}
	public void setScnum(int scnum) {
		this.scnum = scnum;
	}
	public int getStcode() {
		return stcode;
	}
	public void setStcode(int stcode) {
		this.stcode = stcode;
	}
	public String getsccontent() {
		return sccontent;
	}
	public void setsccontent(String sccontent) {
		this.sccontent = sccontent;
	}
	public String getScwriter() {
		return scwriter;
	}
	public void setScwriter(String scwriter) {
		this.scwriter = scwriter;
	}
	public String getScdate() {
		return scdate;
	}
	public void setScdate(String scdate) {
		this.scdate = scdate;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
}
