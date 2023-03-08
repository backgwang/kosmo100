package kr.co.wonderland.mvc.controller.teacher;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.wonderland.mvc.dao.TeacherDaoInter;
import kr.co.wonderland.mvc.dto.TeacherDTO;

@RestController
public class TeacherRestController {
	@Autowired
	private TeacherDaoInter teacherDaoInter;
	
	@RequestMapping(value="/tidChk")
	public int tidChk(@RequestParam("tid") String tid) {
		return teacherDaoInter.tidChk(tid);
	}
	
	@RequestMapping(value="/temailChk")
	public int temailChk(@RequestParam("temail") String temail) {
		return teacherDaoInter.temailChk(temail);
	}
	
	@RequestMapping(value="/list", produces = "application/json;charset=utf-8")
    public String teacherList() {
        List<TeacherDTO> list = teacherDaoInter.teacherList();
        ObjectMapper mapper = new ObjectMapper();
        String result = "";
        try {
            result = mapper.writeValueAsString(list);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return result;
    }
}
