package kr.co.wonderland.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.wonderland.mvc.dto.LecturesReviewDTO;
import kr.co.wonderland.mvc.dto.TeacherDTO;

@Repository
public class LecturesDao implements LecturesDaoInter {
	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public TeacherDTO lecturesDetail(int lsnum) {
		return ss.selectOne("lectures.detail", lsnum);
	}

	@Override
	public void addlecturesReview(LecturesReviewDTO dto) {
		ss.insert("lectures.addReview", dto);
	}
}
