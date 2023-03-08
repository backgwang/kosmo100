package kr.co.wonderland.mvc.controller.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.wonderland.mvc.dao.MemberDaoInter;
import kr.co.wonderland.mvc.dto.StudentDTO;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberDaoInter memberDaoInter;

	@GetMapping(value = "/join")
	public String memberForm() {
		return "member/join";
	}

	@PostMapping(value = "/addStudent")
	public String addStudent(StudentDTO vo, String sbday1, String sbday2, String mfileT, Model m, HttpServletRequest request) {
		// 기본 이미지가 넘어오지 않았을 경우 (사진을 업로드 한 경우),
		if(mfileT == null) {
			String imgpath = "resource\\imgfile";
			String rpath = request.getRealPath("/");
			String cpath = request.getContextPath();
			String oriFn = vo.getMfile().getOriginalFilename();
			//System.out.println(oriFn);
			StringBuffer path = new StringBuffer();
			path.append(rpath).append("\\").append(imgpath).append("\\").append(oriFn);
			File file = new File(path.toString());
			try {
				vo.getMfile().transferTo(file);
				vo.setSimgn(oriFn);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 저장될 경로
			//System.out.println(path);
		} else {
			// 기본 이미지의 경로와 이름
			vo.setSimgn(mfileT);
		}
		vo.setSbday(sbday1 + "-" + sbday2);
		memberDaoInter.addStudent(vo);
		// 회원가입 완료 페이지
		return "member/joinChk";
	}

	// 로그인 폼
	@GetMapping(value = "/login")
	public String loginForm() {
		return "member/login";
	}

	// 로그인 과정
	@PostMapping(value = "/loginProcess")
	public ModelAndView loginfProcess(HttpSession session, HttpServletRequest request, StudentDTO vo,
			@RequestHeader("User-Agent") String userAgent) {
		ModelAndView mav = new ModelAndView("redirect:/web/main");
		StudentDTO stdvo = memberDaoInter.login(vo);
		if (stdvo != null) {
			session.setAttribute("id", stdvo.getSid());
			session.setAttribute("name", stdvo.getSname());
		} else if (stdvo == null) {
			// 다음 다음 또 다음 다음 다음
		}
		return mav;
	}

	// 로그아웃 과정
	@GetMapping(value = "/logout")
	public ModelAndView loginfoutProcess(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("id");
		session.removeAttribute("name");
		mav.setViewName("redirect:/web/main");
		return mav;
	}

	// 아이디, 비밀번호 찾기 뷰
	@RequestMapping(value = "/searchidpwd")
	public String searchMemberInfo() {
		return "member/search_id_pwd";
	}

	// 아이디가 뿌려지는 뷰
	@RequestMapping(value = "/findId")
	public ModelAndView findId(StudentDTO dto) {
		ModelAndView mav = new ModelAndView("member/findId");
		String sid = memberDaoInter.findId(dto);
		if (sid == null) {
			mav.addObject("msg", "아이디 혹은 이메일이 틀렸습니다. 다시 확인해 주세요.");
		} else {
			mav.addObject("id", sid);
		}
		return mav;
	}

	// 이메일 인증 후 새로운 비밀번호 변경이 가능한 뷰
	@PostMapping(value = "/newPwd")
	public String newPwd(Model m, StudentDTO dto) {
		m.addAttribute("dto", dto);
		return "member/newPwd";
	}

	// 비밀번호 변경 후 메인으로 redirect
	@RequestMapping(value = "/updatePwd")
	public String updatePwd(StudentDTO dto) {
		memberDaoInter.updatePwd(dto);
		return "redirect:/web/main";
	}
}
