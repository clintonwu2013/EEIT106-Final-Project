package model.tsunglin.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.POJO.Mail;
import model.POJO.Member;
import model.tsunglin.dao.MailDAO;

@Controller
@SessionAttributes(names= {"pageNo"})
public class MailController {
	@Autowired
	MailDAO mailDAO;
	@Autowired
	SessionFactory sessionFactory;
	int pageNo;
	@RequestMapping(path= {"/findMails"})
	public String method1(Model model,HttpSession session, HttpServletRequest request) {
		
		String pageNoStr = request.getParameter("pageNo");
		System.out.println("pageNoStr="+pageNoStr);
		if (pageNoStr == null) {  
			pageNo = 1;}
		else {
			pageNo = Integer.parseInt(pageNoStr.trim());
		}
		
		Member mb = (Member) session.getAttribute("member");
		List<Mail> rs = null;
		
		mailDAO.setPageNo(pageNo);
		
		
		int totalPages = mailDAO.getTotalPages();
		if(mb!=null) {
			mailDAO.setEmail2(mb.getEmail());
			rs = mailDAO.findByEmail2(mb.getEmail());
		}
		
		
		model.addAttribute("mails", rs);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("totalPages",totalPages);
		return "backstageMessage";
		
	}
	
	@RequestMapping(path= {"/findMailByPK"})
	public String method2(Model model,HttpSession session, Integer mailNo, String status) {
		
//		Mail mail = mailDAO.findByPK(mailNo);
		Mail mail = mailDAO.updateMailStatus(mailNo, status);
		model.addAttribute("mail", mail);
		
		return "backstageMessage";
		
	}
	
//	@RequestMapping(path= {"/insertSystemMail"})
//	public String method3(Model model,String message,String reciever, String sender, String title ) {
//		
//		Mail mail = new Mail();
//		mail.setDeliveryTime(new Date());
//		Session session = sessionFactory.getCurrentSession();
//		mail.setMemberByEmail1(session.get(Member.class, sender));
//		mail.setMemberByEmail2(session.get(Member.class, reciever));
//		mail.setMessage(message);
//		mail.setTitle(title);
//		mail.setStatus("未讀");
//		mailDAO.insert(mail);
//		System.out.println("kkkkkk");
//		
//		
//		return "backstageMessage";
//		
//	}
}
