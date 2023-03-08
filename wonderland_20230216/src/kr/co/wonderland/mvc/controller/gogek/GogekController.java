package kr.co.wonderland.mvc.controller.gogek;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.wonderland.mvc.dao.GogekDaoInter;
import kr.co.wonderland.mvc.dto.GogekCommDTO;
import kr.co.wonderland.mvc.dto.GogekDTO;

@Controller
@RequestMapping(value = "/gogek")
public class GogekController {

	@Autowired
	private GogekDaoInter gogekDaoInter;

	@GetMapping(value = "/main")
	public String gogekMain() {
		return "gogek/gogekMain";
	}

	@GetMapping(value = "/form")
	public String gogekForm() {
		return "gogek/gogekForm";
	}

	@PostMapping(value = "/add")
	public String addGogek(GogekDTO dto) {
		gogekDaoInter.addGogek(dto);
		return "redirect:list?gwriter=" + dto.getGwriter();
	}

	@GetMapping(value = "/list")
	public ModelAndView gogekList(String gwriter) {
		ModelAndView mav = new ModelAndView("gogek/gogekList");
		List<GogekDTO> list = gogekDaoInter.listGogek(gwriter);
		mav.addObject("list", list);
		return mav;
	}

	@GetMapping(value = "/detail")
	public ModelAndView detailGogek(int gnum) {
		ModelAndView mav = new ModelAndView("gogek/gogekDetail");
		GogekDTO dto = gogekDaoInter.detailGogek(gnum);
		mav.addObject("dto", dto);
		return mav;
	}

	@PostMapping(value = "/addComm")
	public String addGogekComm(GogekCommDTO dto) {
		gogekDaoInter.addGogekComm(dto);
		return "redirect:detail?gnum=" + dto.getGcode();
	}

	@GetMapping(value = "/delete")
	public String deleteGogek(int gnum, String gwriter) {
		gogekDaoInter.deleteGogek(gnum);
		return "redirect:list?gwriter=" + gwriter;
	}

	@GetMapping(value = "/upform")
	public String updateForm(Model m, int gnum) {
		GogekDTO dto = gogekDaoInter.detailGogek(gnum);
		m.addAttribute("dto", dto);
		return "gogek/gogekUpForm";
	}

	@PostMapping(value = "/update")
	public String updateGogek(GogekDTO dto) {
		gogekDaoInter.updateGogek(dto);
		return "redirect:detail?gnum=" + dto.getGnum();
	}
}
