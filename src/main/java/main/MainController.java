package main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/index.do")
	public String main() {
		return "index"; // /WEB-INF/view/index.jsp
		// prefix : /WEB-INF/view/
		// suffix : .jsp
	}
	
	@GetMapping("/company/index.do")
	public String companyIndex() {
		return "company/index";
	}
	@GetMapping("/company/map.do")
	public String companyMap() {
		return "company/map";
	}
}
