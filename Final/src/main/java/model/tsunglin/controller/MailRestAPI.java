package model.tsunglin.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import model.POJO.Mail;
import model.POJO.Member;
import model.tsunglin.dao.MailDAO;
import model.tsunglin.dao.memberDAO;

@RestController
public class MailRestAPI {
	@Autowired
	MailDAO mailDAO;
	@Autowired
	memberDAO memberDAO;
	@Autowired
	SessionFactory sessionFactory;

	@PostMapping(path = { "/insertMail" }, produces = { "application/json", "application/xml" })
	public ResponseEntity<Object> update(String reciever, String sender, String message, String title) {
		boolean rs =false;
		Session session = sessionFactory.getCurrentSession();
		Member mb = session.get(Member.class, reciever);
		
		if(!"all".equals(reciever) && mb!=null) {
			Mail mail = new Mail();
			mail.setDeliveryTime(new Date());
			mail.setMemberByEmail1(session.get(Member.class, sender));
			mail.setMemberByEmail2(session.get(Member.class, reciever));
			mail.setMessage(message);
			mail.setTitle(title);
			mail.setStatus("未讀");
			rs = mailDAO.insert(mail);
			System.out.println("kkkkkkkkkkkkkkkkkkkkkkkkkkk");
			
		}else if("all".equals(reciever)){
			List<Member> members = memberDAO.findAll();
			for(Member member: members) {
				Mail mail = new Mail();
				mail.setDeliveryTime(new Date());
				mail.setMemberByEmail1(session.get(Member.class, sender));
				mail.setMemberByEmail2(session.get(Member.class, member.getEmail()));
				mail.setMessage(message);
				mail.setTitle(title);
				mail.setStatus("未讀");
				rs = mailDAO.insert(mail);
				System.out.println("kkkkkkkkkkkkkkkkkkkkkkkkkkk");
			}
		}
		
		if(rs ) {
			return ResponseEntity.noContent().build();
		}else {
			return ResponseEntity.notFound().build(); 
		}

	}

}
