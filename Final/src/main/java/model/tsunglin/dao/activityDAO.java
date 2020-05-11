package model.tsunglin.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import model.POJO.Activity;
import model.POJO.Member;

@Repository
public class activityDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	
	public List<Activity> findUnreviewed() {
		Session session = sessionFactory.getCurrentSession();
		//session.beginTransaction();
		List<Activity> rs = null;
		rs = session.createQuery("from Activity where permission='待審核'  order by aid" , Activity.class).list();

		return rs;
	}
	
	public Activity findByPK(Integer aid) {
		Session session = sessionFactory.getCurrentSession();
		//session.beginTransaction();
		Activity rs = session.get(Activity.class, aid);

		return rs;
	}
	
	public Activity updatePermission(Integer aid, String permission) {
		Session session = sessionFactory.getCurrentSession();
		//session.beginTransaction();
		Activity activity = session.get(Activity.class, aid);
		activity.setPermission(permission);
		
		return activity;
	}
	
	public Activity updateAll(Activity activity) {
		Session session = sessionFactory.getCurrentSession();
		Activity activityOld = session.get(Activity.class, activity.getAid());
		activityOld.setAcontent(activity.getAcontent());
		activityOld.setAddress(activity.getAddress());
		activityOld.setAname(activity.getAname());
		activityOld.setAtype(activity.getAtype());
		activityOld.setBeginTime(activity.getBeginTime());
		activityOld.setEndTime(activity.getEndTime());
		
		activityOld.setPeopleUplimit(activity.getPeopleUplimit());
		activityOld.setPhoto(activity.getPhoto());
		activityOld.setStatus(activity.getStatus());
		
		
		return activity;
		
	}
	public List<Activity> findActivityByTypes(String selectType, Date inputDate) {
		Session session = sessionFactory.getCurrentSession();
		List<Activity> rs = null;
		
		if(inputDate != null) {
			long inputDatePlusOneDaySeconds = inputDate.getTime()+86400000;
			Date inputDatePlusOneDay = new Date(inputDatePlusOneDaySeconds);
			rs = session.createQuery("from Activity where permission= :permission and beginTime >= :inputDate and beginTime < :inputDatePlusOneDay order by beginTime desc",Activity.class)
			.setParameter("permission", selectType)
			.setParameter("inputDate", inputDate)
			.setParameter("inputDatePlusOneDay", inputDatePlusOneDay).list();
		}else {
			rs = session.createQuery("from Activity where permission= :permission order by beginTime desc",Activity.class)
			.setParameter("permission", selectType).list();
			
		}
		return rs;
		
	}
}
