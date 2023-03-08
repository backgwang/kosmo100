package kr.co.wonderland.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.wonderland.mvc.dto.LecturesDTO;
import kr.co.wonderland.mvc.dto.StudentDTO;
import kr.co.wonderland.mvc.dto.TeacherDTO;

@Repository
public class MyPageDao implements MyPageDaoInter {
	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public StudentDTO myinfo(String sid) {
		return ss.selectOne("mypage.info", sid);
	}

	@Override
	public List<TeacherDTO> mylectures(String sid) {
		return ss.selectList("mypage.lectures",sid);
	}

	@Override
	public LecturesDTO mylectureinfo(Map<String, Object> map) {
		return ss.selectOne("mypage.mylectureinfo", map);
	}

	@Override
	public List<TeacherDTO> endlectures(String sid) {
		return ss.selectList("mypage.endlectures",sid);
	}
}
