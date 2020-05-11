package model.tsunglin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogOutController {
	@RequestMapping(path= {"/logoutController"})
	public String logout(HttpSession session) {
		if(session !=null) {
			session.invalidate();
			session=null;
		}
		return "index";
	}
}
