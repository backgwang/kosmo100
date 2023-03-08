package kr.co.wonderland.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.wonderland.mvc.dto.MyLoginLoggerDTO;
import kr.co.wonderland.mvc.dto.StudentDTO;

@Repository("memberDaoInter")
public class MemberDao implements MemberDaoInter {
	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public void addStudent(StudentDTO dto) {
		ss.insert("student.join", dto);
	}

	@Override
	public int idChk(String sid) {
		return ss.selectOne("student.idChk", sid);
	}

	@Override
	public int emailChk(String semail) {
		return ss.selectOne("student.emailChk", semail);
	}

	@Override
	public StudentDTO login(StudentDTO dto) {
		return ss.selectOne("student.login", dto);
	}

	@Override
	public int loginChk(StudentDTO dto) {
		return ss.selectOne("student.loginChk", dto);
	}

	@Override
	public void addLoginLogging(MyLoginLoggerDTO dto) {
		ss.insert("student.logger_in", dto);
	}

	@Override
	public String findId(StudentDTO dto) {
		return ss.selectOne("student.findId", dto);
	}

	@Override
	public String findPwd(StudentDTO dto) {
		return ss.selectOne("student.findPwd", dto);
	}

	@Override
	public void updatePwd(StudentDTO dto) {
		ss.update("student.updatePwd", dto);
	}
}