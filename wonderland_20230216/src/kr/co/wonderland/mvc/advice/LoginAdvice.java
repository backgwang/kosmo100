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

// @Component : 일반 빈을 만들 때 
// @Aspect : 공통 관심 사항 적용, PointCut
@Component
@Aspect
public class LoginAdvice {
	private String userAgent;
	
	@Autowired
	private MemberDaoInter memberDaoInter;
	
	// Around로 동작, loginf로 시작하는 어떠한 인자라도 가지는 모든 메서드에서 적용
	@Around("execution(* kr.co.wonderland.mvc.controller.member.MemberController.loginf*(..))")
	public ModelAndView loginLogger(ProceedingJoinPoint pjp) {
		//System.out.println("로그인/아웃 로그 작성 시작");
		ModelAndView rpath = null;
		// step1 ) 메서드의 이름을 가져와서 로그인과 로그아웃을 구별한다
		String methodName = pjp.getSignature().getName();
		// step2 ) Joinpoint로부터 타겟 객체의 메서드 인자값들 받아오기
		Object[] fd = pjp.getArgs();
		
		if(methodName.equals("loginfProcess")) {
			try {
				rpath = (ModelAndView) pjp.proceed(); // 로그인 메서드 호출
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
			// 로그인 정보를 데이터베이스에 저장하기
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
			// 로그아웃 정보를 데이터베이스에 저장하기
			MyLoginLoggerDTO vo = new MyLoginLoggerDTO();
			vo.setIdn(uid);
			vo.setReip(reip);
			vo.setUagent(userAgent);
			vo.setStatus("logout");
			memberDaoInter.addLoginLogging(vo);
            try {
                rpath = (ModelAndView) pjp.proceed(); // logout 메서드를 호출
            } catch (Throwable e) {
                e.printStackTrace();
            }
		}
		return rpath;
	}
}