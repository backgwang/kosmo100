package kr.co.wonderland.mvc.dao;

import kr.co.wonderland.mvc.dto.MyLoginLoggerDTO;
import kr.co.wonderland.mvc.dto.StudentDTO;

public interface MemberDaoInter {
	// student ȸ�� ����
	public void addStudent(StudentDTO dto);
	// ID �ߺ� Ȯ��
	public int idChk(String sid);
	// email �ߺ� Ȯ��
	public int emailChk(String semail);
	
	// �α���
	public StudentDTO login(StudentDTO dto);
	public int loginChk(StudentDTO dto);
	// AOP���� ���� login loging ó���� ���� �޼���	
	public void addLoginLogging(MyLoginLoggerDTO dto);
	
	// �α��� ���� ã��
	// 1. ���̵� ã��, ��й�ȣ ã��
	public String findId(StudentDTO dto);
	public String findPwd(StudentDTO dto);
	// 2. ��й�ȣ ����
	public void updatePwd(StudentDTO dto);
}
