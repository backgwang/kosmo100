package kr.co.wonderland.mvc.dao;

import java.util.List;

import kr.co.wonderland.mvc.dto.NoticeDTO;

public interface NoticeDaoInter {
	// �������� �� �ۼ�
	public void addNotice(NoticeDTO dto);
	
	// �������� ����Ʈ
	public List<NoticeDTO> listNotice();
	
	// �������� ������
	public NoticeDTO detailNotice(int nnum);
	public void updateCount(int nnum);
	
	// �������� ����
	public void updateNotice(NoticeDTO dto);
	
	// �������� ����
	public void deleteNotice(int nnum);
}