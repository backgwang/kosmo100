package kr.co.wonderland.mvc.dao;

import java.util.List;

import kr.co.wonderland.mvc.dto.GogekCommDTO;
import kr.co.wonderland.mvc.dto.GogekDTO;

public interface GogekDaoInter {
	// 문의사항 작성
	public void addGogek(GogekDTO dto);
	// 문의사항 리스트
	public List<GogekDTO> listGogek(String gwriter);
	
	// 문의사항 디테일 페이지
	public GogekDTO detailGogek(int gnum);
	
	// 문의사항 수정
	public void updateGogek(GogekDTO dto);
	public void deleteGogek(int gnum);
	
	// 문의사항 댓글 작성 (관리자)
	public void addGogekComm(GogekCommDTO dto);
	public void delGogekComm(int cnum);
}
