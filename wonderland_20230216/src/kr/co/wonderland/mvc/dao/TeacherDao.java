package kr.co.wonderland.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.wonderland.mvc.dto.LecturesReviewDTO;
import kr.co.wonderland.mvc.dto.TeacherDTO;
import kr.co.wonderland.mvc.dto.TeacherQuestionDTO;

@Repository
public class TeacherDao implements TeacherDaoInter {
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void addTeacher(TeacherDTO dto) {
		ss.insert("teacher.add", dto);
	}

	@Override
	public List<TeacherDTO> teacherList() {
		return ss.selectList("teacher.list");
	}

	@Override
	public int tidChk(String tid) {
		return ss.selectOne("teacher.tidChk", tid);
	}

	@Override
	public int temailChk(String temail) {
		return ss.selectOne("teacher.temailChk", temail);
	}

	@Override
	public TeacherDTO lecturesDetail(int tnum) {
		return ss.selectOne("teacher.detailLectures", tnum);
	}

	@Override
	public List<TeacherQuestionDTO> questionDetail(int tnum) {
		return ss.selectList("teacher.detailQuestion", tnum);
	}

	@Override
	public List<LecturesReviewDTO> reviewDetail(int tnum) {
		return ss.selectList("teacher.detailReview", tnum);
	}

	@Override
	public void addquestion(TeacherQuestionDTO dto) {
		ss.insert("teacher.addQuestion", dto);
	}
}
