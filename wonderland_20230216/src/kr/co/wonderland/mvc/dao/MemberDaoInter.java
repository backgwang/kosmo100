package kr.co.wonderland.mvc.dao;

import kr.co.wonderland.mvc.dto.MyLoginLoggerDTO;
import kr.co.wonderland.mvc.dto.StudentDTO;

public interface MemberDaoInter {
	// student 회원 가입
	public void addStudent(StudentDTO dto);
	// ID 중복 확인
	public int idChk(String sid);
	// email 중복 확인
	public int emailChk(String semail);
	
	// 로그인
	public StudentDTO login(StudentDTO dto);
	public int loginChk(StudentDTO dto);
	// AOP에서 사용될 login loging 처리를 위한 메서드	
	public void addLoginLogging(MyLoginLoggerDTO dto);
	
	// 로그인 정보 찾기
	// 1. 아이디 찾기, 비밀번호 찾기
	public String findId(StudentDTO dto);
	public String findPwd(StudentDTO dto);
	// 2. 비밀번호 변경
	public void updatePwd(StudentDTO dto);
}
