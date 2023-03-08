package kr.co.wonderland.mvc.dao;

import java.util.List;

import kr.co.wonderland.mvc.dto.KeywordDTO;
import kr.co.wonderland.mvc.dto.SearchPageDTO;
import kr.co.wonderland.mvc.dto.StudyCommDTO;
import kr.co.wonderland.mvc.dto.StudyDTO;

public interface StudyDaoInter {
	// ���͵� ���� �� �ۼ�
	public void addStudy(StudyDTO dto);
	public void addKeyword(List<KeywordDTO> list);
	
	// ���͵� ���� �� ����Ʈ
	public List<StudyDTO> listStudy(SearchPageDTO dto);
	// �˻����� �� ���ǿ� �ش��ϴ� �Խñ��� ��
	public int searchCount(SearchPageDTO dto);
	
	// ���͵� ������
	public StudyDTO detailStudy(int stnum);
	public void updateCount(int stnum);
	
	// ���͵� ��û
	public void addStudyComm(StudyCommDTO dto);
}