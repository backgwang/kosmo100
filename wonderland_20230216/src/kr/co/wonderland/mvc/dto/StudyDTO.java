package kr.co.wonderland.mvc.dto;

import java.util.List;

public class StudyDTO {

	private int stnum;
	private int ccode;
	private String sttitle;
	private String stcontent;
	private String stwriter;
	private String enddate;
	private String stdate;
	private int stcount;
	private int sccount;

	private List<StudyCommDTO> studycomm;
	private List<KeywordDTO> keywords;
	private List<StudySubDTO> studysub;
	
	public int getStnum() {
		return stnum;
	}
	public void setStnum(int stnum) {
		this.stnum = stnum;
	}
	public int getCcode() {
		return ccode;
	}
	public void setCcode(int ccode) {
		this.ccode = ccode;
	}
	public String getSttitle() {
		return sttitle;
	}
	public void setSttitle(String sttitle) {
		this.sttitle = sttitle;
	}
	public String getStcontent() {
		return stcontent;
	}
	public void setStcontent(String stcontent) {
		this.stcontent = stcontent;
	}
	public String getStwriter() {
		return stwriter;
	}
	public void setStwriter(String stwriter) {
		this.stwriter = stwriter;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getStdate() {
		return stdate;
	}
	public void setStdate(String stdate) {
		this.stdate = stdate;
	}
	public int getStcount() {
		return stcount;
	}
	public void setStcount(int stcount) {
		this.stcount = stcount;
	}
	public int getSccount() {
		return sccount;
	}
	public void setSccount(int sccount) {
		this.sccount = sccount;
	}
	public List<StudyCommDTO> getStudycomm() {
		return studycomm;
	}
	public void setStudycomm(List<StudyCommDTO> studycomm) {
		this.studycomm = studycomm;
	}
	public List<KeywordDTO> getKeywords() {
		return keywords;
	}
	public void setKeywords(List<KeywordDTO> keywords) {
		this.keywords = keywords;
	}
	public List<StudySubDTO> getStudysub() {
		return studysub;
	}
	public void setStudysub(List<StudySubDTO> studysub) {
		this.studysub = studysub;
	}
}
