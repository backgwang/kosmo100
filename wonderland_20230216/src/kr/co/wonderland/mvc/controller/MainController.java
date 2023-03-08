package kr.co.wonderland.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.wonderland.mvc.dao.MainDaoInter;

@Controller
public class MainController {
	@Autowired
	private MainDaoInter mainDaoInter;
	
	@RequestMapping(value= {"/","/main"})
	public String main(Model m) {
		m.addAttribute("teacher", mainDaoInter.mainTeacher("±¹¾î"));
		m.addAttribute("notice", mainDaoInter.mainNotice());
		return "main/index";
	}
	
	@RequestMapping(value="/admin")
	public String mypage() {
		return "";
	}
}