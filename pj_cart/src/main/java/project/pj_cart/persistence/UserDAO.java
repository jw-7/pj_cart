package project.pj_cart.persistence;

import project.pj_cart.domain.UserDTO;

public interface UserDAO {

	// 회원가입
	public void registerUser(UserDTO udto) throws Exception;
	
	// 회원조회
	public UserDTO searchUser(UserDTO udto) throws Exception;
	
	// 중복아이디 체크
	public int dupIdCk(UserDTO udto) throws Exception;
	
	// 중복이메일 체크
	public int dupEmailCk(UserDTO udto) throws Exception;
	
	// 메일인증키 생성
	public int updateMailKey(UserDTO udto) throws Exception;
	
	// 메일인증 상태 변경
	public int updateMailAuth(UserDTO udto) throws Exception;
	
	// 이메일 인증 유/무 체크
	public int emailAuthFail(String id) throws Exception;
	
	// 아이디 / 비밀번호 찾기
	public int findIdOrPwd(UserDTO udto) throws Exception;
}
