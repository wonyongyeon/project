package user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 로그인
	public UserVo login(UserVo vo) {
		return sqlSession.selectOne("user.login", vo);
	}
	
	// 이메일 중복체크
	public int emailCheck(String email) {
		return sqlSession.selectOne("user.emailCheck", email);
	}
	
	// 등록
	public int insert(UserVo vo) {
		return sqlSession.insert("user.insert", vo);
	}
	
	public UserVo searchId(UserVo vo) {
		return sqlSession.selectOne("user.searchId", vo);
	}
	public UserVo searchPwd(UserVo vo) {
		return sqlSession.selectOne("user.searchPwd", vo);
	}
	public int updateTempPwd(UserVo vo) {
		return sqlSession.update("user.updateTempPwd", vo);
	}
	
}
