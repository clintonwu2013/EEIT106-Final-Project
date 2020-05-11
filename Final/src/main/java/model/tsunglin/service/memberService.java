package model.tsunglin.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.POJO.Member;
import model.tsunglin.dao.memberDAO;

@Service
public class memberService {
	@Autowired
	memberDAO memberDAO;
	@Autowired
	SessionFactory sessionFactory;

	
	public List<Member> findAll() {

		List<Member> rs = memberDAO.findAll();

		return rs;
	}

	
	public void updatePermission(String email,String permission) {

		memberDAO.updatePermission(email, permission);

		
	}
	
	public Member findByPK(String mId) {

		Member mb = memberDAO.findByPK(mId);
		return mb;
	}

}
