package kr.co.wonderland.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.wonderland.mvc.dto.KeywordDTO;
import kr.co.wonderland.mvc.dto.SearchPageDTO;
import kr.co.wonderland.mvc.dto.StudyCommDTO;
import kr.co.wonderland.mvc.dto.StudyDTO;

@Repository
public class StudyDao implements StudyDaoInter {
	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public void addStudy(StudyDTO dto) {
		ss.insert("study.add",dto);
	}

	@Override
	public void addKeyword(List<KeywordDTO> list) {
		ss.insert("study.addKeyword", list);
	}

	@Override
	public StudyDTO detailStudy(int stnum) {
		return ss.selectOne("study.detail", stnum);
	}
	
	@Override
	public void updateCount(int stnum) {
		ss.update("study.cnt", stnum);
	}

	@Override
	public void addStudyComm(StudyCommDTO dto) {
		ss.insert("study.addComm", dto);
	}

	@Override
	public List<StudyDTO> listStudy(SearchPageDTO dto) {
		return ss.selectList("study.listpage", dto);
	}

	@Override
	public int searchCount(SearchPageDTO dto) {
		return ss.selectOne("study.searchCount", dto);
	}
}
