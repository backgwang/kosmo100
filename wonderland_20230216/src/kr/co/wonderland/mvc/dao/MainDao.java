package kr.co.wonderland.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.wonderland.mvc.dto.NoticeDTO;
import kr.co.wonderland.mvc.dto.TeacherDTO;

@Repository
public class MainDao implements MainDaoInter {
	@Autowired
	private SqlSessionTemplate ss;
	

	@Override
	public List<TeacherDTO> mainTeacher(String subject) {
		return ss.selectList("main.teacherList", subject);
	}
	
	@Override
	public List<NoticeDTO> mainNotice() {
		return ss.selectList("main.noticeList");
	}


}
