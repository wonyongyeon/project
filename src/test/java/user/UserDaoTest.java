package user;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"classpath:/config/spring-config.xml"})
public class UserDaoTest {

	@Autowired
	UserDao dao;
	
	// @Test
	public void insertTest() {
		UserVo vo = new UserVo();
		vo.setEmail("aaa@gmail.com");
		vo.setName("홍길동");
		vo.setGender(1);
		vo.setBirthday("2020-01-01");
		vo.setPwd("aaa");
		vo.setTel("010-123-1234");
		
		int r = dao.insert(vo);
		assertEquals(r, 1);
	}
	
	@Test
	public void emailCheckTest() {
		assertEquals(dao.emailCheck("aaa@gmail.com"), 1);
	}
	@Test
	public void emailCheckTest2() {
		assertEquals(dao.emailCheck("bbb@gmail.com"), 0);
	}
	// 로그인성공테스트
	@Test
	public void loginSuccess() {
		UserVo vo = new UserVo();
		vo.setEmail("aaa@gmail.com");
		vo.setPwd("aaa");
		assertNotNull(dao.login(vo));
	}
	// 로그인실패테스트
	@Test
	public void loginFail() {
		UserVo vo = new UserVo();
		vo.setEmail("aaa@gmail.com");
		vo.setPwd("bbb");
		assertNull(dao.login(vo));
	}
}
