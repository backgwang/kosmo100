package kr.co.wonderland.mvc.controller.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.wonderland.mvc.dao.MyPageDaoInter;
import kr.co.wonderland.mvc.dao.TeacherDaoInter;
import kr.co.wonderland.mvc.dto.TeacherDTO;
import kr.co.wonderland.mvc.dto.TeacherQuestionDTO;

@Controller
@RequestMapping(value="/mypage")
public class MyPageController {
	@Autowired
	private MyPageDaoInter mypageDaoInter;
	
	@Autowired
	private TeacherDaoInter teacherDatoInter;
	
	@RequestMapping(value="/info")
	public ModelAndView myinfo(String sid) {
		ModelAndView mav = new ModelAndView("mypage/myinfo");
		mav.addObject("dto", mypageDaoInter.myinfo(sid));
		return mav;
	}
	
	@RequestMapping(value="/lecture")
	public ModelAndView mylecture(String sid) {
		ModelAndView mav = new ModelAndView("mypage/mylecture");
		List<TeacherDTO> list = mypageDaoInter.mylectures(sid);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value="/study")
	public ModelAndView mystudy() {
		ModelAndView mav = new ModelAndView("mypage/mystudy");
		return mav;
	}
	
	@RequestMapping(value="/answer")
	public ModelAndView myanswer() {
		ModelAndView mav = new ModelAndView("mypage/myanswer");
		return mav;
	}
	
	@RequestMapping(value="/tanswer")
	public ModelAndView myTanswer() {
		ModelAndView mav = new ModelAndView("mypage/teacherAnswer");
		return mav;
	}
	
	@RequestMapping(value = "/question")
    public ModelAndView myquestion(int tnum) {
        ModelAndView mav = new ModelAndView("mypage/myquestion");
        mav.addObject("tnum", tnum-1);
        return mav;
    }
	
	@RequestMapping(value = "/addquestion")
	public ModelAndView addquestion(TeacherQuestionDTO dto) {
		ModelAndView mav = new ModelAndView("redirect:lecture?sid="+dto.getTqwriter());
		teacherDatoInter.addquestion(dto);
		return mav;
	}
}
