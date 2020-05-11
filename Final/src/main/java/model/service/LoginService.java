package model.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.POJO.Member;
import model.dao.LoginDAO;
@Service
public class LoginService {
	@Autowired
	LoginDAO logDAO;

	public void insert(Member member) {

		logDAO.insert(member);

	}
	
	
	public Member login(String id, String password) {
		Member member = null;
		member = logDAO.findByPK(id);
		if(member!=null && member.getPassword().equals(password)) {
			return member;
		}else {
			return null;
		}
		
		
	}

}
