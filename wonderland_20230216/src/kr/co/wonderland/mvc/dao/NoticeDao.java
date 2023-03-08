package kr.co.wonderland.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.wonderland.mvc.dto.NoticeDTO;

@Repository("noticeDaoInter")
public class NoticeDao implements NoticeDaoInter {
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void addNotice(NoticeDTO dto) {
		ss.insert("notice.add",dto);
	}

	@Override
	public List<NoticeDTO> listNotice() {
		return ss.selectList("notice.list");
	}

	@Override
	public NoticeDTO detailNotice(int nnum) {
		return ss.selectOne("notice.detail", nnum);
	}
	@Override
	public void updateCount(int nnum) {
		ss.update("notice.updateCount", nnum);
	}

	@Override
	public void updateNotice(NoticeDTO dto) {
		ss.update("notice.update", dto);
	}

	@Override
	public void deleteNotice(int nnum) {
		ss.delete("notice.delete", nnum);
	}

}
