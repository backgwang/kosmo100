package kr.co.wonderland.mvc.dao;

import java.util.List;

import kr.co.wonderland.mvc.dto.NoticeDTO;

public interface NoticeDaoInter {
	// 공지사항 글 작성
	public void addNotice(NoticeDTO dto);
	
	// 공지사항 리스트
	public List<NoticeDTO> listNotice();
	
	// 공지사항 디테일
	public NoticeDTO detailNotice(int nnum);
	public void updateCount(int nnum);
	
	// 공지사항 수정
	public void updateNotice(NoticeDTO dto);
	
	// 공지사항 삭제
	public void deleteNotice(int nnum);
}