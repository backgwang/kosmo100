package kr.co.wonderland.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.wonderland.mvc.dao.MainDaoInter;
import kr.co.wonderland.mvc.dto.TeacherDTO;

@RestController
public class MainRestController {
	@Autowired
	private MainDaoInter mainDaoInter;
	
	@RequestMapping(value="/test", produces = "application/json;charset=utf-8")
	public List<TeacherDTO> test(String subject){
		return mainDaoInter.mainTeacher(subject);
	}
}
