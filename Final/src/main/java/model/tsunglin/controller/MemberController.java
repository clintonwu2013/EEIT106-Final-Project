package model.tsunglin.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.POJO.Member;
import model.tsunglin.dao.activityDAO;
import model.tsunglin.dao.memberDAO;
import model.tsunglin.service.activityService;
import model.tsunglin.service.memberService;

@Controller
@SessionAttributes
public class MemberController {
	@Autowired
	private memberDAO memberDAO;
	@Autowired
	private memberService memberService;
	
	
	
	
	@RequestMapping(path= {"/findMembers"} )
	public String method1(Model model) {
		List<Member> members = memberService.findAll();
		System.out.println("ooooooooo");
		model.addAttribute("members", members);
		return "backstage";
	}
	
	
	@RequestMapping(path= {"/updatePermission"} )
	public String method2(String email, String permission, Model model) {
		
		System.out.println(email);
		System.out.println(permission);
		memberService.updatePermission(email, permission);
		List<Member> members = memberService.findAll();
		model.addAttribute("members", members);
		return "backstage";
	}
	

	
	
	
}
