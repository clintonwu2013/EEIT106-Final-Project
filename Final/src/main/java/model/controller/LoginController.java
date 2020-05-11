package model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.POJO.Member;
import model.service.LoginService;

@Controller
@SessionAttributes(names= {"member"})
public class LoginController {
	@Autowired
	LoginService loginService;
	
	@RequestMapping(path= {"/login.controller"},method= {RequestMethod.GET})
	public String method1(String id, String password, Model model) {
		System.out.println(id);
		Member member = loginService.login(id, password);
		
		if(member !=null) {
			model.addAttribute("member", member);
			return "backstageIndex";
		}else {
			return "backstageLogin.input";
		}
		
	}
}
