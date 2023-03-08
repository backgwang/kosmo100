package kr.co.wonderland.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.wonderland.mvc.dao.StudyDaoInter;
import kr.co.wonderland.mvc.dto.KeywordDTO;
import kr.co.wonderland.mvc.dto.SearchPageDTO;
import kr.co.wonderland.mvc.dto.StudyCommDTO;
import kr.co.wonderland.mvc.dto.StudyDTO;

@Service
public class StudyService {
	@Autowired
	private StudyDaoInter studyDaoInter;
	
	@Transactional
	public void addStudy(StudyDTO dto, List<KeywordDTO> list) {
		studyDaoInter.addStudy(dto);
		studyDaoInter.addKeyword(list);
	}
	
	public List<StudyDTO> listStudy(SearchPageDTO dto){
		return studyDaoInter.listStudy(dto);
	}
	
	public int searchCount(SearchPageDTO dto) {
		return studyDaoInter.searchCount(dto);
	}
	
	public StudyDTO detailStudy(int stnum) {
		return studyDaoInter.detailStudy(stnum);
	}
	
	public void updateCount(int stnum) {
		studyDaoInter.updateCount(stnum);
	}
	
	public void addComm(StudyCommDTO dto) {
		studyDaoInter.addStudyComm(dto);
	}
}
