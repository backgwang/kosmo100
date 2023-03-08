package kr.co.wonderland.mvc.controller.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.wonderland.mvc.dto.CategoryDTO;
import kr.co.wonderland.mvc.service.CategoryService;

@RestController
public class CategoryRestController {
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value="/getSubject", produces = "application/json;charset=utf-8")
	public List<CategoryDTO> getSubject(){
		List<CategoryDTO> subject = categoryService.getSubject();
		return subject;
	} 
	
	@RequestMapping(value="/getCnumUnit", produces = "application/json;charset=utf-8")
	public List<CategoryDTO> getCnumUnit(String subject){
		List<CategoryDTO> unit = categoryService.getCnumUnit(subject);
		return unit;
	}
}
