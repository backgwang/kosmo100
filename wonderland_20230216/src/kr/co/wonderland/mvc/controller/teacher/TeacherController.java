package kr.co.wonderland.mvc.controller.teacher;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.wonderland.mvc.dao.TeacherDaoInter;
import kr.co.wonderland.mvc.dto.TeacherDTO;

@Controller
@RequestMapping(value="/teacher")
public class TeacherController {
	@Autowired
	private TeacherDaoInter teacherDaoInter;

	@GetMapping(value="/form")
	public String teacherJoin() {
		return "teacher/teacherJoin";
	}
	
	@PostMapping(value="/add")
	public String addTeacher(Model m, TeacherDTO dto, HttpServletRequest request
			,String tbday1, String tbday2) {
		// form에서 받은 파일을 복사할 장소 : resource/imgfile
		String imgpath = "resources\\imgfile";
		// 프로젝트의 실제 주소
		String rpath = request.getRealPath("/");
		String cpath = request.getContextPath();
		// form에서 받은 파일의 이름
		String oriFn = dto.getMfile().getOriginalFilename();
		
		// 파일이 복사될 경로를 StringBuffer로 생성
		StringBuffer path = new StringBuffer();
		path.append(rpath).append("\\").append(imgpath).append("\\").append(oriFn);
		
		//String imgn = oriFn.substring(0, oriFn.indexOf("."));
		// 해당하는 경로에 File 객체 생성
		File file = new File(path.toString());
		try {
			// MultipartFile 객체를 가져와서 transferTo로 생성한다
			dto.getMfile().transferTo(file);
			// dto의 timgn에 파일의 이름과 확장자를 저장한다
			dto.setTimgn(oriFn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setTbday(tbday1+"-"+tbday2);
		teacherDaoInter.addTeacher(dto);
		return "redirect:form";
	}
	
	@GetMapping(value="/list")
	public String teacherList(Model m) {
		List<TeacherDTO> list = teacherDaoInter.teacherList();
		m.addAttribute("list", list);
		return "teacher/teacherList";
	}
	
	@GetMapping(value="/detail")
	public String teacherDetail(Model m, int tnum) {
		m.addAttribute("lectures", teacherDaoInter.lecturesDetail(tnum));
		m.addAttribute("review", teacherDaoInter.reviewDetail(tnum));
		m.addAttribute("question", teacherDaoInter.questionDetail(tnum));
		return "teacher/teacherDetail";
	}
}
