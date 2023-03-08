package kr.co.wonderland.mvc.dao;

import java.util.List;

import kr.co.wonderland.mvc.dto.NoticeDTO;
import kr.co.wonderland.mvc.dto.TeacherDTO;

public interface MainDaoInter {
	public List<TeacherDTO> mainTeacher(String subject);
	public List<NoticeDTO> mainNotice();
}
