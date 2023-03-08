package kr.co.wonderland.mvc.controller.mypage;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.wonderland.mvc.dao.MyPageDaoInter;
import kr.co.wonderland.mvc.dto.LecturesDTO;
import kr.co.wonderland.mvc.dto.TeacherDTO;

@RestController
public class MyPageRestController {

	@Autowired
	private MyPageDaoInter mypageDaoInter;

	@RequestMapping(value = "/info", produces = "application/json;charset=utf-8")
	public LecturesDTO info(String sid, int lsnum) {
		Map<String, Object> map = new HashedMap();
		map.put("sid", sid);
		map.put("lsnum", lsnum);
		return mypageDaoInter.mylectureinfo(map);
	}
	
	
	@RequestMapping(value = "/endlectures",produces = "application/json;charset=utf-8")
	public List<TeacherDTO> abcd(String sid) {
		return mypageDaoInter.endlectures(sid);
	}
}
