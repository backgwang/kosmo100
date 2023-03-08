package kr.co.wonderland.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.wonderland.mvc.dao.CategoryDaoInter;
import kr.co.wonderland.mvc.dto.CategoryDTO;

@Service
public class CategoryService {
	@Autowired
	private CategoryDaoInter categoryDaoInter;
	

	public List<CategoryDTO> getSubject() {
		return categoryDaoInter.getSubject();
	}

	public List<CategoryDTO> getCnumUnit(String subject) {
		return categoryDaoInter.getCnumUnit(subject);
	}
}
