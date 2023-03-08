package kr.co.wonderland.mvc.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class StudentDTO {

	private int snum;
	private String sid;
	private String sname;
	private String semail;
	private String spwd;
	private String sbday;
	private String simgn;
	private String regdate;
	private int cnt;

	private MultipartFile mfile;

	private List<EnrolmentDTO> enrolment;

	public int getSnum() {
		return snum;
	}

	public void setSnum(int snum) {
		this.snum = snum;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSemail() {
		return semail;
	}

	public void setSemail(String semail) {
		this.semail = semail;
	}

	public String getSpwd() {
		return spwd;
	}

	public void setSpwd(String spwd) {
		this.spwd = spwd;
	}

	public String getSbday() {
		return sbday;
	}

	public void setSbday(String sbday) {
		this.sbday = sbday;
	}

	public String getSimgn() {
		return simgn;
	}

	public void setSimgn(String simgn) {
		this.simgn = simgn;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public MultipartFile getMfile() {
		return mfile;
	}

	public void setMfile(MultipartFile mfile) {
		this.mfile = mfile;
	}

	public List<EnrolmentDTO> getEnrolment() {
		return enrolment;
	}

	public void setEnrolment(List<EnrolmentDTO> enrolment) {
		this.enrolment = enrolment;
	}
}
