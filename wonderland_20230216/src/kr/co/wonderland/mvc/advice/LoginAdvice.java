package kr.co.wonderland.mvc.advice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import kr.co.wonderland.mvc.dao.MemberDaoInter;
import kr.co.wonderland.mvc.dto.MyLoginLoggerDTO;

// @Component : �Ϲ� ���� ���� �� 
// @Aspect : ���� ���� ���� ����, PointCut
@Component
@Aspect
public class LoginAdvice {
	private String userAgent;
	
	@Autowired
	private MemberDaoInter memberDaoInter;
	
	// Around�� ����, loginf�� �����ϴ� ��� ���ڶ� ������ ��� �޼��忡�� ����
	@Around("execution(* kr.co.wonderland.mvc.controller.member.MemberController.loginf*(..))")
	public ModelAndView loginLogger(ProceedingJoinPoint pjp) {
		//System.out.println("�α���/�ƿ� �α� �ۼ� ����");
		ModelAndView rpath = null;
		// step1 ) �޼����� �̸��� �����ͼ� �α��ΰ� �α׾ƿ��� �����Ѵ�
		String methodName = pjp.getSignature().getName();
		// step2 ) Joinpoint�κ��� Ÿ�� ��ü�� �޼��� ���ڰ��� �޾ƿ���
		Object[] fd = pjp.getArgs();
		
		if(methodName.equals("loginfProcess")) {
			try {
				rpath = (ModelAndView) pjp.proceed(); // �α��� �޼��� ȣ��
			} catch (Throwable e) {
				e.printStackTrace();
			}
			// login )
			// HttpSession session, HttpServletRequest request, StudentVO vo,  @RequestHeader("User-Agent") String userAgent
			// logout )
			// HttpSession session, HttpServletRequest request
			HttpSession session = (HttpSession) fd[0];
			userAgent = (String) fd[3];
			String reip = ((HttpServletRequest)fd[1]).getRemoteAddr();
			String uid = (String) session.getAttribute("id");
			// �α��� ������ �����ͺ��̽��� �����ϱ�
			MyLoginLoggerDTO vo = new MyLoginLoggerDTO();
			vo.setIdn(uid);
			vo.setReip(reip);
			vo.setUagent(userAgent);
			vo.setStatus("login");
			memberDaoInter.addLoginLogging(vo);
		} else if (methodName.equals("loginfoutProcess")){
			HttpSession session = (HttpSession) fd[0];
			String uid = (String) session.getAttribute("id");
			String reip = ((HttpServletRequest)fd[1]).getRemoteAddr();
			// �α׾ƿ� ������ �����ͺ��̽��� �����ϱ�
			MyLoginLoggerDTO vo = new MyLoginLoggerDTO();
			vo.setIdn(uid);
			vo.setReip(reip);
			vo.setUagent(userAgent);
			vo.setStatus("logout");
			memberDaoInter.addLoginLogging(vo);
            try {
                rpath = (ModelAndView) pjp.proceed(); // logout �޼��带 ȣ��
            } catch (Throwable e) {
                e.printStackTrace();
            }
		}
		return rpath;
	}
}