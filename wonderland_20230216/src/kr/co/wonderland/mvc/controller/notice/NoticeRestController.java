package kr.co.wonderland.mvc.controller.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.wonderland.mvc.dao.NoticeDaoInter;
import kr.co.wonderland.mvc.dto.NoticeDTO;

@RestController
public class NoticeRestController {
	
	@Autowired
	private NoticeDaoInter noticeDaoInter;
	
	@RequestMapping(value ="/ajaxNoticeList",produces="application/json;charset=utf-8")
	public String ajaxNoticeList() {
		List<NoticeDTO> list = noticeDaoInter.listNotice();
		String result = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			result = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return result;
	}
}
