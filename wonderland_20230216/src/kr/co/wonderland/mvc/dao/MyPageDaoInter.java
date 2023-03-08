package kr.co.wonderland.mvc.dao;

import java.util.List;
import java.util.Map;

import kr.co.wonderland.mvc.dto.LecturesDTO;
import kr.co.wonderland.mvc.dto.StudentDTO;
import kr.co.wonderland.mvc.dto.TeacherDTO;

public interface MyPageDaoInter {
	public StudentDTO myinfo(String sid);
	public List<TeacherDTO> mylectures(String sid);
	public LecturesDTO mylectureinfo(Map<String, Object> map);
	public List<TeacherDTO> endlectures(String sid);
}
