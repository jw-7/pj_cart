package project.pj_cart.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import project.pj_cart.domain.UserDTO;
import project.pj_cart.persistence.UserDAO;
import project.pj_cart.mail.TempKey;
import project.pj_cart.mail.MailHandler;

@Service
public class UserServiceImpl implements UserService {

	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	private UserDAO udao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	// 회원가입
	@Override
	public void registerUser(UserDTO udto) throws Exception {
		String mail_key = new TempKey().getKey(30, false);
		
		udto.setMail_key(mail_key);
		
		udto.setPwd(passwordEncoder.encode(udto.getPwd()));
		udao.registerUser(udto);
		udao.updateMailKey(udto);
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("인증메일입니다.");
		sendMail.setText(
				"<h1>PJ_CART 메일인증</h1>" +
				"<br>PJ_CART 회원가입을 축하드립니다." +
				"<br><a href='http://localhost:8088/user/signUpEmail?email=" +
				udto.getEmail() + "&mail_key=" + mail_key + "' target='_blank'>이메일 인증 확인</a>");
		sendMail.setFrom("finResLee@gmail.com","PJ_CART");
		sendMail.setTo(udto.getEmail());
		sendMail.send();
	}
	
	// 중복아이디 체크
	@Override
	public int dupIdCk(UserDTO udto) throws Exception {
		return udao.dupIdCk(udto);
	}

	// 중복이메일 체크
	@Override
	public int dupEmailCk(UserDTO udto) throws Exception {
		return udao.dupEmailCk(udto);
	}
	
	// 메일 재전송
	@Override
	public void resendMail(UserDTO udto) throws Exception {
		UserDTO userInfo = udao.searchUser(udto);
		String mail_key = new TempKey().getKey(30, false);
		
		userInfo.setMail_key(mail_key);
		udao.updateMailKey(userInfo);
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("인증메일입니다.");
		sendMail.setText(
				"<h1>PJ_CART 메일인증</h1>" +
				"<br>PJ_CART 회원가입을 축하드립니다." +
				"<br><a href='http://localhost:8088/user/signUpEmail?email=" +
				userInfo.getEmail() + "&mail_key=" + mail_key + "' target='_blank'>이메일 인증 확인</a>");
		sendMail.setFrom("finResLee@gmail.com","PJ_CART");
		sendMail.setTo(userInfo.getEmail());
		sendMail.send();
	}
	
	// 회원조회
	@Override
	public UserDTO searchUser(UserDTO udto) throws Exception {
		return udao.searchUser(udto);
	}
	
	// 메일인증키 생성
	@Override
	public int updateMailKey(UserDTO udto) throws Exception {
		return udao.updateMailKey(udto);
	}
	
	// 메일인증 상태 변경
	@Override
	public int updateMailAuth(UserDTO udto) throws Exception {
		return udao.updateMailAuth(udto);
	}
	
	// 이메일 인증 유/무 체크
	@Override
	public int emailAuthFail(String id) throws Exception {
		return udao.emailAuthFail(id);
	}
	
	// 로그인 처리
	@Override
	public int loginProc(UserDTO udto) throws Exception {
		if((udto.getId() == null || udto.getId() == "") || (udto.getPwd() == null || udto.getPwd() == "")) {
			logger.info("ID or Password Please input value.");
			return 0;
		}
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		UserDTO user = udao.searchUser(udto);
		if(user != null) {
			if(encoder.matches(udto.getPwd(), user.getPwd())) {
				return 1;
			}
		}		
		
		logger.info("ID or Password Check Please.");
		return 0;
	}

}
