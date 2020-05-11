package model.tsunglin.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import model.POJO.ActivityMessage;
@Repository
public class ActivityMessageDAO {
	@Autowired
	SessionFactory sessionFactory;
	public ActivityMessage findByPK(Integer messageId) {
		Session session = sessionFactory.getCurrentSession();
		ActivityMessage rs = session.get(ActivityMessage.class, messageId);
		
		return rs;
	}

}
