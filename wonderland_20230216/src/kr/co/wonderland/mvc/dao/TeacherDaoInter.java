package kr.co.wonderland.mvc.dao;

import java.util.List;

import kr.co.wonderland.mvc.dto.LecturesReviewDTO;
import kr.co.wonderland.mvc.dto.TeacherDTO;
import kr.co.wonderland.mvc.dto.TeacherQuestionDTO;

public interface TeacherDaoInter {
	// 선생님 등록
	public void addTeacher(TeacherDTO dto);
	// 선생님 등록 시 아이디, 이메일 중복 체크
	public int tidChk(String tid);
	public int temailChk(String temail);
	
	// 선생님 리스트
	public List<TeacherDTO> teacherList();
	
	// 선생님 정보
	public TeacherDTO lecturesDetail(int tnum);
	public List<TeacherQuestionDTO> questionDetail(int tnum);
	public List<LecturesReviewDTO> reviewDetail(int tnum);
	public void addquestion(TeacherQuestionDTO dto);
}
