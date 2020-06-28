package pos.backoffice.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class mainController {
	

	@GetMapping("/")
	public String index() {
		
		//mail.sendMail("andrew.jeon@shinsegae.com", "테스트 입니다", "테스트메일\n 테스트 ");

		return "/history/work_history";
	}
	
	@RequestMapping(value="/work_history.do")
    public ModelAndView ViewWorkHistory(Map<String,Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/history/work_history");
    		
    	return mv;
    }
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "login-form";
	}
;

@RequestMapping(value="/login.do")
public ModelAndView ViewLogin(Map<String,Object> commandMap) throws Exception{
	ModelAndView mv = new ModelAndView("/login-form");
		
	return mv;
}

}
