package kr.co.wonderland.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.wonderland.mvc.dto.GogekCommDTO;
import kr.co.wonderland.mvc.dto.GogekDTO;

@Repository
public class GogekDao implements GogekDaoInter {
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void addGogek(GogekDTO dto) {
		ss.insert("gogek.add", dto);
	}

	@Override
	public List<GogekDTO> listGogek(String gwriter) {
		return ss.selectList("gogek.list", gwriter);
	}

	@Override
	public GogekDTO detailGogek(int gnum) {
		return ss.selectOne("gogek.detail", gnum);
	}

	@Override
	public void updateGogek(GogekDTO dto) {
		ss.update("gogek.update", dto);
	}

	@Override
	public void deleteGogek(int gnum) {
		ss.delete("gogek.delete", gnum);
	}

	@Override
	public void addGogekComm(GogekCommDTO dto) {
		ss.insert("gogek.addComm", dto);
	}

	@Override
	public void delGogekComm(int cnum) {
		ss.delete("gogek.delComm", cnum);
	}
}
