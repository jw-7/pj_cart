package project.pj_cart.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.pj_cart.domain.UserDTO;
import project.pj_cart.service.UserService;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService uService;

	// 로그인 뷰
	// http://localhost:8088/user/login
	@GetMapping(value = "/user/login")
	public String login() throws Exception {
		return "/user/login";
	}
	
	// 로그인 처리
	@PostMapping(value = "/user/loginProc")
	public String loginProc(UserDTO udto, RedirectAttributes rttr, HttpSession session) throws Exception {
		int result = uService.loginProc(udto);
		if(result == 1) {
			UserDTO user = uService.searchUser(udto);
			if(user.getMail_auth() != 1) {
				rttr.addFlashAttribute("user",user);
				return "redirect:/user/emailAuthFail";
			}
			session.setAttribute("userId", user.getId());
			logger.info("Login Success");
			return "redirect:/main";
		} else {
			return "redirect:/user/login";
		}
	}
	
	// 회원가입 뷰
	// http://localhost:8088/user/signUp
	@GetMapping(value = "/user/signUp")
	public String signUp() throws Exception {
		return "/user/signUp";
	}
	
	// 회원가입 처리
	@PostMapping(value = "/user/signUpProc")
	public String signUpProc(@Valid UserDTO udto, RedirectAttributes rttr) throws Exception {
		uService.registerUser(udto);
		rttr.addFlashAttribute("userID",udto.getId());
		logger.info("Sign Up Success !");
		return "redirect:/user/signUpSuccess";
	}
	
	// 중복아이디 체크
	@PostMapping(value = "/user/dupIdCk")
	@ResponseBody
	public int dupIdCk(UserDTO udto) throws Exception {
		int result = uService.dupIdCk(udto);
		return result;
	}
	
	// 중복이메일 체크
	@PostMapping(value = "/user/dupEmailCk")
	@ResponseBody
	public int dupEmailCk(UserDTO udto) throws Exception {
		int result = uService.dupEmailCk(udto);
		return result;
	}
	
	// 회원가입 성공 뷰
	@GetMapping(value = "/user/signUpSuccess")
	public String signUpSuccess() throws Exception {
		return "/user/signUpSuccess";
	}
	
	// 메일인증 확인
	@GetMapping(value = "/user/signUpEmail")
	public String emailConfirm(UserDTO udto, Model model) throws Exception {
		UserDTO newUser = uService.searchUser(udto);
		if(udto.getMail_key().equals(newUser.getMail_key())) {
			uService.updateMailAuth(udto);
			model.addAttribute("result",1);
		} else {
			model.addAttribute("result",0);
		}
		return "/user/emailAuthSuccess";
	}
	
	// 메일인증 실패
	@GetMapping(value = "/user/emailAuthFail")
	public String emailConfirmFail() throws Exception {
		return "/user/emailAuthFail";
	}
	
	// 메일 재전송
	@PostMapping(value = "/user/resend-mail")
	@ResponseBody
	public int resendMail(UserDTO udto) throws Exception {
		if(udto != null) {
			uService.resendMail(udto);
			logger.info("Re-Send Mail Success!");
			return 1;
		} else {
			logger.info("Re-Send Mail Fail.");
			return 0;
		}
	}
}
