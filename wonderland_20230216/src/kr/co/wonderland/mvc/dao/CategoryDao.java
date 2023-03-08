package kr.co.wonderland.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.wonderland.mvc.dto.CategoryDTO;

@Repository
public class CategoryDao implements CategoryDaoInter {
	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public List<CategoryDTO> getSubject() {
		return ss.selectList("category.getSubject");
	}

	@Override
	public List<CategoryDTO> getCnumUnit(String subject) {
		return ss.selectList("category.getCnumUnit", subject);
	}

}
