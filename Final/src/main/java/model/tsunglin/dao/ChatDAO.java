package model.tsunglin.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.POJO.Chat;
import model.POJO.Member;

@Repository
public class ChatDAO {
	@Autowired
	SessionFactory sessionFactory;
	public boolean insert(String email1, String email2, String content) {
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Chat chat = new Chat();
		chat.setMemberByEmail1(session.get(Member.class,email1 ));
		chat.setMemberByEmail2(session.get(Member.class,email2 ));
		chat.setContent(content);
		chat.setMessageTime(new Date());
		session.save(chat);
		session.getTransaction().commit();
		return true;
		
	}
	
	public List<Chat> findByEmail(String email1, String email2) {
		Session session = sessionFactory.getCurrentSession();
		
		List<Chat> rs = session.createQuery( "from Chat where email1=:email1 and email2=:email2", Chat.class)
							.setParameter("email1" , email1)
							.setParameter("email2" , email2)
							.list();
		
		return rs;
	}
}
