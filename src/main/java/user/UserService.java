package user;

import javax.servlet.http.HttpSession;

public interface UserService {

	boolean login(UserVo vo, HttpSession sess);
	int emailCheck(String email);
	int insert(UserVo vo);
	UserVo searchId(UserVo vo);
	UserVo searchPwd(UserVo vo);
}
