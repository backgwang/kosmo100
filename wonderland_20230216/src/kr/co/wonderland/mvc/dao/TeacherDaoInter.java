package kr.co.wonderland.mvc.dao;

import java.util.List;

import kr.co.wonderland.mvc.dto.LecturesReviewDTO;
import kr.co.wonderland.mvc.dto.TeacherDTO;
import kr.co.wonderland.mvc.dto.TeacherQuestionDTO;

public interface TeacherDaoInter {
	// ������ ���
	public void addTeacher(TeacherDTO dto);
	// ������ ��� �� ���̵�, �̸��� �ߺ� üũ
	public int tidChk(String tid);
	public int temailChk(String temail);
	
	// ������ ����Ʈ
	public List<TeacherDTO> teacherList();
	
	// ������ ����
	public TeacherDTO lecturesDetail(int tnum);
	public List<TeacherQuestionDTO> questionDetail(int tnum);
	public List<LecturesReviewDTO> reviewDetail(int tnum);
	public void addquestion(TeacherQuestionDTO dto);
}
