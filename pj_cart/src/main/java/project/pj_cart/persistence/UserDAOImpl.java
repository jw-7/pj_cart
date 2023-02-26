package project.pj_cart.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.pj_cart.domain.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	private static final String namespace = "project.pj_cart.mappers.userMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	// 회원가입
	@Override
	public void registerUser(UserDTO udto) throws Exception {
		sqlSession.insert(namespace + ".registerUser",udto);
	}
	
	// 회원조회
	@Override
	public UserDTO searchUser(UserDTO udto) throws Exception {
		return sqlSession.selectOne(namespace + ".searchUser",udto);
	}
	
	// 중복아이디 체크
	@Override
	public int dupIdCk(UserDTO udto) throws Exception {
		return sqlSession.selectOne(namespace + ".dupIdCk",udto);
	}

	// 중복이메일 체크
	@Override
	public int dupEmailCk(UserDTO udto) throws Exception {
		return sqlSession.selectOne(namespace + ".dupEmailCk",udto);
	}
	
	// 메일인증키 생성
	@Override
	public int updateMailKey(UserDTO udto) throws Exception {
		return sqlSession.update(namespace + ".updateMailKey",udto);
	}
	
	// 메일인증 상태 변경
	@Override
	public int updateMailAuth(UserDTO udto) throws Exception {
		return sqlSession.update(namespace + ".updateMailAuth",udto);
	}
	
	// 이메일 인증 유/무 체크
	@Override
	public int emailAuthFail(String id) throws Exception {
		return sqlSession.selectOne(namespace + ".emailAuthFail",id);
	}
	
	// 아이디 / 비밀번호 찾기
	@Override
	public int findIdOrPwd(UserDTO udto) throws Exception {
		return sqlSession.selectOne(namespace + ".findIdOrPwd",udto);
	}

	// 비밀번호 변경
	@Override
	public void updatePassword(UserDTO udto) throws Exception {
		sqlSession.update(namespace + ".updatePassword",udto);
	}
}
