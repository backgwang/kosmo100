package kr.co.wonderland.mvc.dto;

import java.util.List;

public class CategoryDTO {

	private int cnum;
	private String subject;
	private String unit;

	private List<LecturesDTO> lectures; // 강좌 정보
	private List<StudyDTO> study; // 스터디 정보
	
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public List<LecturesDTO> getLectures() {
		return lectures;
	}
	public void setLectures(List<LecturesDTO> lectures) {
		this.lectures = lectures;
	}
	public List<StudyDTO> getStudy() {
		return study;
	}
	public void setStudy(List<StudyDTO> study) {
		this.study = study;
	}
}