package kr.co.wonderland.mvc.dto;

public class MyLoginLoggerDTO {

	private int num;
	private String idn;
	private String reip;
	private String uagent;
	private String status; // �α��� ����
	private String sstime; // �α��� �ð���
	private String eetime; // �α��� �ð���

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getIdn() {
		return idn;
	}

	public void setIdn(String idn) {
		this.idn = idn;
	}

	public String getReip() {
		return reip;
	}

	public void setReip(String reip) {
		this.reip = reip;
	}

	public String getUagent() {
		return uagent;
	}

	public void setUagent(String uagent) {
		this.uagent = uagent;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSstime() {
		return sstime;
	}

	public void setSstime(String sstime) {
		this.sstime = sstime;
	}

	public String getEetime() {
		return eetime;
	}

	public void setEetime(String eetime) {
		this.eetime = eetime;
	}
}
