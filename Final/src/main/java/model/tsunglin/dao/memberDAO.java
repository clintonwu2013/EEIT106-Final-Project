package model.tsunglin.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.POJO.Member;

@Repository
public class memberDAO {
	@Autowired
	SessionFactory sessionFactory;

	public List<Member> findAll() {

		Session session = sessionFactory.getCurrentSession();
		//session.beginTransaction();
		List<Member> rs = null;
		rs = session.createQuery("from Member", Member.class).list();

		return rs;
	}
	public Member findByPK(String mId) {
		
		Session session = sessionFactory.getCurrentSession();
		System.out.println(mId);
		Member mb = session.get(Member.class, mId);
		System.out.println(mb);
		System.out.println(mb.getEmail());
		

		return mb;
	}

	
	
	public void updatePermission(String email,String permission) {
		Session session = sessionFactory.getCurrentSession();
//		session.beginTransaction();
		Member member = session.get(Member.class, email);
		member.setPermission(permission);
	}
	public void updateVcount(String memberEmail, Integer vCount) {
		Session session = sessionFactory.getCurrentSession();
		Member member = session.get(Member.class, memberEmail);
		member.setVcount(vCount);;
		
	}
}
