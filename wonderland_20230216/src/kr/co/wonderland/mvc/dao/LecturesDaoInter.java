package kr.co.wonderland.mvc.dao;

import kr.co.wonderland.mvc.dto.LecturesReviewDTO;
import kr.co.wonderland.mvc.dto.TeacherDTO;

public interface LecturesDaoInter {
	// ���� ������
	public TeacherDTO lecturesDetail(int lsnum);
	
	// ���� ���� ���
	public void addlecturesReview(LecturesReviewDTO dto);
	
}
