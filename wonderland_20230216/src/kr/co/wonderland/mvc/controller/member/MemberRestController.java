package kr.co.wonderland.mvc.controller.member;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.wonderland.mvc.dao.MemberDaoInter;
import kr.co.wonderland.mvc.dto.StudentDTO;

@RestController
public class MemberRestController {
	static final String emailFromRecipient = "jye0928@naver.com";
	
	@Autowired
	MemberDaoInter memberDaoInter;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@RequestMapping(value="/idChk")
	public int idChk(@RequestParam("sid") String sid) {
		return memberDaoInter.idChk(sid);
	}
	
	@RequestMapping(value="/emailChk")
	public int emailChk(@RequestParam("semail") String semail) {
		return memberDaoInter.emailChk(semail);
	}
	
	@RequestMapping(value="/sendEmail")
	public String sendEmail(String email) {
		// 랜덤으로 6자리 숫자를 문자열로 만들기
		StringBuffer sb = new StringBuffer();
		int num;
		for(int i=0; i<6; i++) {
			num = (int) Math.floor(Math.random()*10);
			sb.append(num);
		}
		String random = sb.toString();
		// 이메일 보낼 준비
		/*
		mailSender.send(new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                mimeMsgHelperObj.setTo(email);
                mimeMsgHelperObj.setFrom(emailFromRecipient);
                mimeMsgHelperObj.setText(random);
                mimeMsgHelperObj.setSubject("인증번호");
            }
        });
        */
		System.out.println(random);
		return random;
	}
	
	@RequestMapping(value="/certCheck")
	public int certCheck(String num, String certnum) {
		int cnt = 0;
		if(certnum.isEmpty() || certnum == null) {
			cnt = 1;
		} else {
			if(num.isEmpty() || certnum == null) {
				cnt = 2;
			} else {
				if(num.equals(certnum)) {
					cnt = 4;
				} else {
					cnt = 3;
				}
			}
		}
		return cnt;
	}
	
	@RequestMapping(value="/loginChk")
	public int loginCheck(String sid, String spwd) {
		StudentDTO dto = new StudentDTO();
		dto.setSid(sid);
		dto.setSpwd(spwd);
		return memberDaoInter.loginChk(dto);
	}
}