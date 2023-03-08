package kr.co.wonderland.mvc.dao;

import java.util.List;

import kr.co.wonderland.mvc.dto.GogekCommDTO;
import kr.co.wonderland.mvc.dto.GogekDTO;

public interface GogekDaoInter {
	// ���ǻ��� �ۼ�
	public void addGogek(GogekDTO dto);
	// ���ǻ��� ����Ʈ
	public List<GogekDTO> listGogek(String gwriter);
	
	// ���ǻ��� ������ ������
	public GogekDTO detailGogek(int gnum);
	
	// ���ǻ��� ����
	public void updateGogek(GogekDTO dto);
	public void deleteGogek(int gnum);
	
	// ���ǻ��� ��� �ۼ� (������)
	public void addGogekComm(GogekCommDTO dto);
	public void delGogekComm(int cnum);
}
