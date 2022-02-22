package user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
	
	@Autowired
	UserService service;

	@GetMapping("/user/login.do")
	public String login() {
		return "user/login";
	}
	
	@PostMapping("/user/login.do")
	public String loginProcess(Model model, UserVo vo, HttpSession sess) {
		if (service.login(vo, sess)) {
			return "redirect:/index.do";
		} else {
			model.addAttribute("msg", "이메일, 비밀번호를 확인해 주세요");
			return "include/return";
		}
	}
	
	@GetMapping("/user/logout.do")
	public String logOut(Model model, HttpSession sess) {
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "/project/index.do");
		sess.invalidate();
		return "include/return";
	}
	
	@GetMapping("/user/emailCheck.do")
	public String emailCheck(Model model, @RequestParam String email) {
		model.addAttribute("result", service.emailCheck(email));
		return "include/result";
	}
	
	@GetMapping("/user/join.do")
	public String join() {
		return "user/join";
	}
	
	@PostMapping("/user/insert.do")
	public String insert(UserVo vo, HttpServletRequest req) {
		if (service.insert(vo) > 0) {
			req.setAttribute("msg", "정상적으로 가입되었습니다.");
			req.setAttribute("url", "/project/index.do");
		} else {
			req.setAttribute("msg", "가입오류");
		}
		return "include/return";
	}
	
	@RequestMapping(value="/user/searchId.do", method=RequestMethod.GET)
	public String searchId() {
		return "user/searchId";
	}
	@RequestMapping(value="/user/searchId.do", method=RequestMethod.POST)
	public String searchId(Model model, UserVo vo) {
		UserVo uv = service.searchId(vo);
		//String email = "";
		//if (uv != null) email = uv.getEmail();
		model.addAttribute("result", uv == null ? "" : uv.getEmail());
		return "include/result";
	}
	
	@RequestMapping(value="/user/searchPwd.do", method=RequestMethod.GET)
	public String searchPwd() {
		return "user/searchPwd";
	}
	@RequestMapping(value="/user/searchPwd.do", method=RequestMethod.POST)
	public String searchPwd(Model model, UserVo vo) {
		UserVo uv = service.searchPwd(vo);
		//String email = "";
		//if (uv != null) email = uv.getEmail();
		model.addAttribute("result", uv == null ? "" : "ok");
		return "include/result";
	}
	
	
}
