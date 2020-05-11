package model.tsunglin.service;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.POJO.Mail;
import model.tsunglin.dao.MailDAO;
@Service
public class MailService {
	@Autowired
	MailDAO mailDAO;
	@Autowired
	SessionFactory sessionFactory;
	
	
	public boolean insert(Mail mail) {
		
		
		boolean flag = mailDAO.insert(mail);
		
		
		return flag;
		
	}

}
