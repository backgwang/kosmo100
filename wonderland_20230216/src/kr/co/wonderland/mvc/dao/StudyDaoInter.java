package kr.co.wonderland.mvc.dao;

import java.util.List;

import kr.co.wonderland.mvc.dto.KeywordDTO;
import kr.co.wonderland.mvc.dto.SearchPageDTO;
import kr.co.wonderland.mvc.dto.StudyCommDTO;
import kr.co.wonderland.mvc.dto.StudyDTO;

public interface StudyDaoInter {
	// 스터디 모집 글 작성
	public void addStudy(StudyDTO dto);
	public void addKeyword(List<KeywordDTO> list);
	
	// 스터디 모집 글 리스트
	public List<StudyDTO> listStudy(SearchPageDTO dto);
	// 검색했을 때 조건에 해당하는 게시글의 수
	public int searchCount(SearchPageDTO dto);
	
	// 스터디 디테일
	public StudyDTO detailStudy(int stnum);
	public void updateCount(int stnum);
	
	// 스터디 신청
	public void addStudyComm(StudyCommDTO dto);
}