package kr.co.wonderland.mvc.controller.lectures;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.wonderland.mvc.dao.LecturesDaoInter;
import kr.co.wonderland.mvc.dto.LecturesReviewDTO;

@Controller
@RequestMapping(value = "/lectures")
public class LecturesController {

	@Autowired
	private LecturesDaoInter lecturesDaoInter;
	
	// ���� ������ : ������ ����, ���� ����, ���� ����Ʈ, ���� ����Ʈ
	@GetMapping(value="/detail")
	public String lectureDetail(Model m, int lsnum) {
		m.addAttribute("dto", lecturesDaoInter.lecturesDetail(lsnum));
		return "lectures/lecturesDetail";
	}
	
	// ���� ���� ���
	@PostMapping(value="/addReview")
	public String addReview(LecturesReviewDTO dto) {
		lecturesDaoInter.addlecturesReview(dto);
		return "redirect:detail?lsnum="+dto.getLscode();
	}
}
