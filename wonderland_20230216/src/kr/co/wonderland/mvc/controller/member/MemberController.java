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
		// �⺻ �̹����� �Ѿ���� �ʾ��� ��� (������ ���ε� �� ���),
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
			// ����� ���
			//System.out.println(path);
		} else {
			// �⺻ �̹����� ��ο� �̸�
			vo.setSimgn(mfileT);
		}
		vo.setSbday(sbday1 + "-" + sbday2);
		memberDaoInter.addStudent(vo);
		// ȸ������ �Ϸ� ������
		return "member/joinChk";
	}

	// �α��� ��
	@GetMapping(value = "/login")
	public String loginForm() {
		return "member/login";
	}

	// �α��� ����
	@PostMapping(value = "/loginProcess")
	public ModelAndView loginfProcess(HttpSession session, HttpServletRequest request, StudentDTO vo,
			@RequestHeader("User-Agent") String userAgent) {
		ModelAndView mav = new ModelAndView("redirect:/web/main");
		StudentDTO stdvo = memberDaoInter.login(vo);
		if (stdvo != null) {
			session.setAttribute("id", stdvo.getSid());
			session.setAttribute("name", stdvo.getSname());
		} else if (stdvo == null) {
			// ���� ���� �� ���� ���� ����
		}
		return mav;
	}

	// �α׾ƿ� ����
	@GetMapping(value = "/logout")
	public ModelAndView loginfoutProcess(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("id");
		session.removeAttribute("name");
		mav.setViewName("redirect:/web/main");
		return mav;
	}

	// ���̵�, ��й�ȣ ã�� ��
	@RequestMapping(value = "/searchidpwd")
	public String searchMemberInfo() {
		return "member/search_id_pwd";
	}

	// ���̵� �ѷ����� ��
	@RequestMapping(value = "/findId")
	public ModelAndView findId(StudentDTO dto) {
		ModelAndView mav = new ModelAndView("member/findId");
		String sid = memberDaoInter.findId(dto);
		if (sid == null) {
			mav.addObject("msg", "���̵� Ȥ�� �̸����� Ʋ�Ƚ��ϴ�. �ٽ� Ȯ���� �ּ���.");
		} else {
			mav.addObject("id", sid);
		}
		return mav;
	}

	// �̸��� ���� �� ���ο� ��й�ȣ ������ ������ ��
	@PostMapping(value = "/newPwd")
	public String newPwd(Model m, StudentDTO dto) {
		m.addAttribute("dto", dto);
		return "member/newPwd";
	}

	// ��й�ȣ ���� �� �������� redirect
	@RequestMapping(value = "/updatePwd")
	public String updatePwd(StudentDTO dto) {
		memberDaoInter.updatePwd(dto);
		return "redirect:/web/main";
	}
}
