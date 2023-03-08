package kr.co.wonderland.mvc.controller.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.wonderland.mvc.dao.NoticeDaoInter;
import kr.co.wonderland.mvc.dto.NoticeDTO;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {
	@Autowired
	private NoticeDaoInter noticeDaoInter;
	
	
	@GetMapping(value="/form")
	public String noticeForm() {
		return "notice/noticeForm";
	}
	
	@PostMapping(value="/add")
	public String addNotice(NoticeDTO dto, HttpServletRequest request) {
		dto.setNip(request.getRemoteAddr());
		noticeDaoInter.addNotice(dto);
		return "redirect:list";
	}
	
	@GetMapping(value="/list")
	public String listNotice(Model m) {
		List<NoticeDTO> list = noticeDaoInter.listNotice();
		m.addAttribute("list", list);
		return "notice/noticeList";
	}
	

	@GetMapping(value="/detail")
	public String detailNotice(Model m, int nnum) {
		NoticeDTO dto = noticeDaoInter.detailNotice(nnum);
		noticeDaoInter.updateCount(nnum);
		m.addAttribute("dto", dto);
		return "notice/noticeDetail";
	}
	
	@GetMapping(value="/upform")
	public String updateNoticeForm(Model m,int nnum) {
		NoticeDTO dto = noticeDaoInter.detailNotice(nnum);
		m.addAttribute("dto", dto);
		return "notice/noticeUpForm";
	}
	
	
	@PostMapping(value="/update")
	public String updateNotice(NoticeDTO dto) {
		noticeDaoInter.updateNotice(dto);
		return "redirect:detail?nnum="+dto.getNnum();
	}
	
	@GetMapping(value="/delete")
	public String deleteNotice(int nnum) {
		noticeDaoInter.deleteNotice(nnum);
		return "redirect:list";
	}
	
	
}
