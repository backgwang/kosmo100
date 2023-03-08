package kr.co.admin.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping(value= {"/", "/main"})
	public String admin() {
		return "adminPage";
	}
}
