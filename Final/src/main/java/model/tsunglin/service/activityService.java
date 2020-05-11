package model.tsunglin.service;

import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.POJO.Activity;
import model.tsunglin.dao.activityDAO;

@Service
public class activityService {
	@Autowired
	activityDAO activityDAO;
	
	@Autowired
	SessionFactory sessionFactory;
	
	
	public List<Activity> findUnreviewed() {
		
		List<Activity> rs = activityDAO.findUnreviewed();

		return rs;
	}
	
	
	public Activity findByPK(Integer aid) {
		
		Activity activity = activityDAO.findByPK(aid);

		return activity;
	}
	
	
	public Activity updatePermission(Integer aid, String permission) {
//		Session session = sessionFactory.getCurrentSession();
//		session.beginTransaction();
		Activity activity = activityDAO.updatePermission(aid, permission);
		
		
		return activity;
	}

}
