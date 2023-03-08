package kr.co.wonderland.mvc.dao;

import kr.co.wonderland.mvc.dto.LecturesReviewDTO;
import kr.co.wonderland.mvc.dto.TeacherDTO;

public interface LecturesDaoInter {
	// °­ÁÂ µðÅ×ÀÏ
	public TeacherDTO lecturesDetail(int lsnum);
	
	// °­ÁÂ ¸®ºä µî·Ï
	public void addlecturesReview(LecturesReviewDTO dto);
	
}
