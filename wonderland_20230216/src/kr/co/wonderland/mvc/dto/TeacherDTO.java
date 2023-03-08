package kr.co.wonderland.mvc.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class TeacherDTO {

	private int tnum;
	private String tid;
	private String tname;
	private String tinfo;
	private String temail;
	private String tpwd;
	private String tbday;
	private String timgn;
	private String regdate;
	private String subject;

	private MultipartFile mfile; // 선생님 프로필 사진 업로드용

	private List<LecturesDTO> lectures; // 선생님의 강좌 목록
	private List<TeacherQuestionDTO> question; // 선생님의 질문 게시판
	
	public int getTnum() {
		return tnum;
	}
	public void setTnum(int tnum) {
		this.tnum = tnum;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTinfo() {
		return tinfo;
	}
	public void setTinfo(String tinfo) {
		this.tinfo = tinfo;
	}
	public String getTemail() {
		return temail;
	}
	public void setTemail(String temail) {
		this.temail = temail;
	}
	public String getTpwd() {
		return tpwd;
	}
	public void setTpwd(String tpwd) {
		this.tpwd = tpwd;
	}
	public String getTbday() {
		return tbday;
	}
	public void setTbday(String tbday) {
		this.tbday = tbday;
	}
	public String getTimgn() {
		return timgn;
	}
	public void setTimgn(String timgn) {
		this.timgn = timgn;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public MultipartFile getMfile() {
		return mfile;
	}
	public void setMfile(MultipartFile mfile) {
		this.mfile = mfile;
	}
	public List<LecturesDTO> getLectures() {
		return lectures;
	}
	public void setLectures(List<LecturesDTO> lectures) {
		this.lectures = lectures;
	}
	public List<TeacherQuestionDTO> getQuestion() {
		return question;
	}
	public void setQuestion(List<TeacherQuestionDTO> question) {
		this.question = question;
	}
}
