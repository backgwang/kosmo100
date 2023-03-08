package kr.co.wonderland.mvc.dto;

public class KeywordDTO {

	private int stcode;
	private String keyword;
	private char ktype;

	public int getStcode() {
		return stcode;
	}

	public void setStcode(int stcode) {
		this.stcode = stcode;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public char getKtype() {
		return ktype;
	}

	public void setKtype(char ktype) {
		this.ktype = ktype;
	}
}
