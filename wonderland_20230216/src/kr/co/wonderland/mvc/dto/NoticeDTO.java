package kr.co.wonderland.mvc.dto;

public class NoticeDTO {

	private int nnum;
	private String nsubject;
	private String ncontent;
	private String nwriter;
	private String ndate;
	private String nip;
	private String nfix;
	private int ncount;
	private int rownum;

	public int getNnum() {
		return nnum;
	}

	public void setNnum(int nnum) {
		this.nnum = nnum;
	}

	public String getNsubject() {
		return nsubject;
	}

	public void setNsubject(String nsubject) {
		this.nsubject = nsubject;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getNwriter() {
		return nwriter;
	}

	public void setNwriter(String nwriter) {
		this.nwriter = nwriter;
	}

	public String getNdate() {
		return ndate;
	}

	public void setNdate(String ndate) {
		this.ndate = ndate;
	}

	public String getNip() {
		return nip;
	}

	public void setNip(String nip) {
		this.nip = nip;
	}

	public String getNfix() {
		return nfix;
	}

	public void setNfix(String nfix) {
		this.nfix = nfix;
	}

	public int getNcount() {
		return ncount;
	}

	public void setNcount(int ncount) {
		this.ncount = ncount;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
}
