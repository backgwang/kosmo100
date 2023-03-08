package kr.co.wonderland.mvc.dao;

import java.util.List;

import kr.co.wonderland.mvc.dto.CategoryDTO;

public interface CategoryDaoInter {
	public List<CategoryDTO> getSubject();
	public List<CategoryDTO> getCnumUnit(String subject);
}
