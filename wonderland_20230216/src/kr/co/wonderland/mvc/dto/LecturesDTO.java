package kr.co.wonderland.mvc.dto;

import java.util.List;

public class LecturesDTO {
	private int lsnum;
	private int tcode;
	private int ccode;
	private String lstitle;
	private String lsinfo;
	private String lsdiff;
	private int cnt; // 총 강의 수
	private int runtime; // 총 강의 시간 합
	
	private List<LectureDTO> lecture; // 강의 목록
	private List<EnrolmentDTO> enrolment; // 수강 강좌 목록
	private List<LecturesReviewDTO> lecturesReview; // 강좌 평가
	
	public int getLsnum() {
		return lsnum;
	}
	public void setLsnum(int lsnum) {
		this.lsnum = lsnum;
	}
	public int getTcode() {
		return tcode;
	}
	public void setTcode(int tcode) {
		this.tcode = tcode;
	}
	public int getCcode() {
		return ccode;
	}
	public void setCcode(int ccode) {
		this.ccode = ccode;
	}
	public String getLstitle() {
		return lstitle;
	}
	public void setLstitle(String lstitle) {
		this.lstitle = lstitle;
	}
	public String getLsinfo() {
		return lsinfo;
	}
	public void setLsinfo(String lsinfo) {
		this.lsinfo = lsinfo;
	}
	public String getLsdiff() {
		return lsdiff;
	}
	public void setLsdiff(String lsdiff) {
		this.lsdiff = lsdiff;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getRuntime() {
		return runtime;
	}
	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}
	public List<LectureDTO> getLecture() {
		return lecture;
	}
	public void setLecture(List<LectureDTO> lecture) {
		this.lecture = lecture;
	}
	public List<EnrolmentDTO> getEnrolment() {
		return enrolment;
	}
	public void setEnrolment(List<EnrolmentDTO> enrolment) {
		this.enrolment = enrolment;
	}
	public List<LecturesReviewDTO> getLecturesReview() {
		return lecturesReview;
	}
	public void setLecturesReview(List<LecturesReviewDTO> lecturesReview) {
		this.lecturesReview = lecturesReview;
	}
}