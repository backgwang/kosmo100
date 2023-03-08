package kr.co.wonderland.mvc.controller.study;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.wonderland.mvc.dao.StudyDaoInter;
import kr.co.wonderland.mvc.dto.KeywordDTO;
import kr.co.wonderland.mvc.dto.SearchPageDTO;
import kr.co.wonderland.mvc.dto.StudyCommDTO;
import kr.co.wonderland.mvc.dto.StudyDTO;
import kr.co.wonderland.mvc.service.StudyService;

@Controller
@RequestMapping(value = "/study")
public class StudyController {

	@Autowired
	private StudyService studyService;
	@Autowired
	private StudyDaoInter studyDaoInter;
	
  

	@GetMapping(value = "/form")
	public String studyForm() {
		return "study/studyForm";
	}

	@PostMapping(value = "/addStudy")
	public String addStudy(StudyDTO dto, HttpServletRequest request) {
		// 같은 이름으로 넘어오는 파라미터는 배열로 받을 수 있다 => input:checkbox[name="keyword"]
		String[] keywords = request.getParameterValues("keyword");
		if (keywords[0].equals("")) {
			// 키워드 값이 하나도 없이 넘어왔을 때 동작하는 부분
			studyDaoInter.addStudy(dto);
		} else {
			// 키워드 값이 한개 이상 넘어왔을 때 동작하는 부분
			List<KeywordDTO> list = new ArrayList<KeywordDTO>();
			char ktype = 'A';
			for (String e : keywords) {
				KeywordDTO kdto = new KeywordDTO();
				kdto.setStcode(dto.getStnum());
				kdto.setKeyword(e);
				kdto.setKtype(ktype);
				list.add(kdto);
				ktype++;
			}
			// 나도 몰?루 dto.setKeywords(list);
			studyService.addStudy(dto, list);
		}
		return "redirect:list";
	}

	@RequestMapping(value = "/list")
	public ModelAndView studyList(SearchPageDTO dto) {
		ModelAndView mav = new ModelAndView("study/studyList");
		int numPerPage = 5;
		int pagePerBlock = 5;
		dto.setPagePerBlock(pagePerBlock);
		// 검색했을 때의 총 게시물 수를 가져와서 한 페이지당 보여질 게시물 수로 나눠줌.
		// totalPage : 페이지버튼 갯수
		dto.setTotalPage((int)Math.ceil(studyService.searchCount(dto) / (double) numPerPage));
		if(dto.getcPage() != null) {
			dto.setNowPage(Integer.parseInt(dto.getcPage()));
		} else {
			dto.setNowPage(1);
		}
		dto.setStartPage((dto.getNowPage() - 1) * numPerPage + 1);
		dto.setEndPage((dto.getStartPage() - 1) + numPerPage);
		List<StudyDTO> list = studyService.listStudy(dto);
		dto.setStartPage(((dto.getNowPage() -1) / pagePerBlock) * pagePerBlock + 1);
		dto.setEndPage(dto.getStartPage() + pagePerBlock -1);
		if(dto.getEndPage() > dto.getTotalPage()) {
			dto.setEndPage(dto.getTotalPage());
		}
		mav.addObject("list", list);
		mav.addObject("page", dto);
		return mav;
	}

	@GetMapping(value = "/detail")
	public ModelAndView studyDetail(int stnum) {
		ModelAndView mav = new ModelAndView("study/studyDetail");
		// 디테일 페이지에 들어가면 조회수가 증가하고,
		studyService.updateCount(stnum);
		// 세부 내용이 나온다
		StudyDTO dto = studyService.detailStudy(stnum);
		mav.addObject("dto", dto);
		return mav;
	}

	@PostMapping(value="/addComm")
	public String addComm(StudyCommDTO dto) {
		studyService.addComm(dto);
		return "redirect:detail?stnum=" + dto.getStcode();
	}
	
	@GetMapping(value="/upform")
	public String studyUpForm(Model m, int stnum) {
		m.addAttribute("dto", studyService.detailStudy(stnum));
		return "study/studyUpForm";
	}
}
