package kr.co.wonderland.mvc.dto;

public class TeacherQuestionDTO {

	private int tqnum;
	private int tcode;
	private String tqwriter;
	private String tqcontent;
	private String tqstats;
	private String tqdate;

	private TeacherAnswerDTO answer;

	public int getTqnum() {
		return tqnum;
	}

	public void setTqnum(int tqnum) {
		this.tqnum = tqnum;
	}

	public int getTcode() {
		return tcode;
	}

	public void setTcode(int tcode) {
		this.tcode = tcode;
	}

	public String getTqwriter() {
		return tqwriter;
	}

	public void setTqwriter(String tqwriter) {
		this.tqwriter = tqwriter;
	}

	public String getTqcontent() {
		return tqcontent;
	}

	public void setTqcontent(String tqcontent) {
		this.tqcontent = tqcontent;
	}

	public String getTqstats() {
		return tqstats;
	}

	public void setTqstats(String tqstats) {
		this.tqstats = tqstats;
	}

	public String getTqdate() {
		return tqdate;
	}

	public void setTqdate(String tqdate) {
		this.tqdate = tqdate;
	}

	public TeacherAnswerDTO getAnswer() {
		return answer;
	}

	public void setAnswer(TeacherAnswerDTO answer) {
		this.answer = answer;
	}
}
