package model.tsunglin.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import model.POJO.Activity;
import model.POJO.Attendant;
import model.POJO.Mail;
import model.POJO.Member;

@Repository
public class AttendentDAO {

	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	MailDAO mailDAO;

	public List<Attendant> getUncensoredAttendants(Integer aId) {
		Session session = sessionFactory.getCurrentSession();

		List<Attendant> rs = session.createQuery("from Attendant where aId=:aId and status=:status", Attendant.class)
				.setParameter("aId", aId).setParameter("status", "審核中").list();

		return rs;
	}

	public List<Attendant> getAgreedAttendants(Integer aId) {
		Session session = sessionFactory.getCurrentSession();
		
		List<Attendant> rs = session.createQuery("from Attendant where aId=:aId and status=:status", Attendant.class)
				.setParameter("aId", aId).setParameter("status", "同意").list();

		return rs;
	}

	public void updateMemberStatus(Integer aId, Integer attendantId, String status) {

		Session session = sessionFactory.getCurrentSession();
		Attendant attendant = session.get(Attendant.class, attendantId);
		Activity activity = session.get(Activity.class, aId);
		if("同意".equals(status)) {
			activity.setAccessPeople(activity.getAccessPeople() + attendant.getCompanion());
		}
		
		attendant.setStatus(status);

	}

	public void deleteAgreedAttendant(Integer aId, Integer attendantId) {

		Session session = sessionFactory.getCurrentSession();
		Attendant attendant = session.get(Attendant.class, attendantId);
		Activity activity = session.get(Activity.class, aId);

		activity.setAccessPeople(activity.getAccessPeople() - attendant.getCompanion());
		attendant.setStatus("拒絕");

	}
	
	public void updateAttendency(Integer attendantId, String attendency) {

		Session session = sessionFactory.getCurrentSession();
		Attendant attendant = session.get(Attendant.class, attendantId);
		Activity activity = attendant.getActivity();
		Member member = attendant.getMember();
		if("出席".equals(attendency)) {
			attendant.setAttendency(attendency);
		}else if("未出席".equals(attendency)) {
			attendant.setAttendency(attendency);
			attendant.getMember().setVcount(attendant.getMember().getVcount()+1);
			
			Mail mail = new Mail();
			mail.setMemberByEmail2(attendant.getMember());
			mail.setMemberByEmail1(session.get(Member.class, "系統"));
			mail.setTitle("您未出席活動");
			mail.setStatus("未讀");
			mail.setMessage("Hi, "+attendant.getMember().getMname() +"您未出席活動: "+activity.getAname()+", 違規次數加一。目前累積: "+ member.getVcount()+"次違規");
			mail.setDeliveryTime(new Date());
			mailDAO.insert(mail);
		}
		
		

	}

}
