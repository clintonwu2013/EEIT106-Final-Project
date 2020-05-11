package model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.POJO.Member;


@Repository
public class LoginDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public void insert(Member member) {
		
		Session session = sessionFactory.getCurrentSession();
		
		session.save(member);
		
	}
	public Member findByPK(String id) {
		Member member = null;
		Session session = sessionFactory.getCurrentSession();
		member = session.get(Member.class, id);
		
		return member;
	}

}
