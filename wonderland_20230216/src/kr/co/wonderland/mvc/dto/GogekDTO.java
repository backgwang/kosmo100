package kr.co.wonderland.mvc.dto;

import java.util.List;

public class GogekDTO {

	private int gnum;
	private String gsubject;
	private String gcontent;
	private String gwriter;
	private String gdate;

	private List<GogekCommDTO> gogekcomm;

	public int getGnum() {
		return gnum;
	}

	public void setGnum(int gnum) {
		this.gnum = gnum;
	}

	public String getGsubject() {
		return gsubject;
	}

	public void setGsubject(String gsubject) {
		this.gsubject = gsubject;
	}

	public String getGcontent() {
		return gcontent;
	}

	public void setGcontent(String gcontent) {
		this.gcontent = gcontent;
	}

	public String getGwriter() {
		return gwriter;
	}

	public void setGwriter(String gwriter) {
		this.gwriter = gwriter;
	}

	public String getGdate() {
		return gdate;
	}

	public void setGdate(String gdate) {
		this.gdate = gdate;
	}

	public List<GogekCommDTO> getGogekcomm() {
		return gogekcomm;
	}

	public void setGogekcomm(List<GogekCommDTO> gogekcomm) {
		this.gogekcomm = gogekcomm;
	}
}
