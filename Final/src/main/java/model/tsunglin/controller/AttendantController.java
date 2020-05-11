package model.tsunglin.controller;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.POJO.Activity;
import model.POJO.Attendant;
import model.POJO.Mail;
import model.POJO.Member;
import model.tsunglin.dao.AttendentDAO;
import model.tsunglin.dao.MailDAO;

@Controller
public class AttendantController {
	
	@Autowired
	AttendentDAO attendantDAO;
	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	MailDAO mailDAO;
	@RequestMapping(path= {"/getUncensoredAttendants"})
	public String method1(Integer aId, Model model) {
//		System.out.println("hhhhhhhhhhhhhhhhhhhhhhhhuuuuuuu");
		
		
		List<Attendant> rs = attendantDAO.getUncensoredAttendants(aId);
		model.addAttribute("UncensoredAttendants",rs);
		
		Session session = sessionFactory.getCurrentSession();
		Activity activity = session.get(Activity.class, aId);
		
		model.addAttribute("aId", aId);
		model.addAttribute("peopleUplimit", activity.getPeopleUplimit());
		model.addAttribute("availablePeople", activity.getPeopleUplimit()-activity.getAccessPeople());
		return "manageActivity";
		
	}
	
	@RequestMapping(path= {"/updateAttendantStatus"})
	public String method7(Integer aId, Integer attendantId,String status, Model model){
			System.out.println(aId);
			System.out.println(attendantId);
			System.out.println(status);
			attendantDAO.updateMemberStatus(aId, attendantId, status);
			Session session = sessionFactory.getCurrentSession();
			Attendant attendant = session.get(Attendant.class, attendantId);
			if("同意".equals(status)) {
				Mail mail = new Mail();
				mail.setDeliveryTime(new Date());
				mail.setMemberByEmail1(session.get(Member.class, "系統"));
				mail.setMemberByEmail2(attendant.getMember());
				mail.setMessage("Hi,"+ attendant.getMember().getMname()+ "。您申請參加活動:"+ attendant.getActivity().getAname()+" 已通過。");
				mail.setStatus("未讀");
				mail.setTitle("您申請參加活動通過");
				mailDAO.insert(mail);
			}else if("拒絕".equals(status)) {
				Mail mail = new Mail();
				mail.setDeliveryTime(new Date());
				mail.setMemberByEmail1(session.get(Member.class, "系統"));
				mail.setMemberByEmail2(attendant.getMember());
				mail.setMessage("Hi,"+ attendant.getMember().getMname()+ "。您申請參加活動:"+ attendant.getActivity().getAname()+" 被拒絕。");
				mail.setStatus("未讀");
				mail.setTitle("您申請參加活動被拒絕");
				mailDAO.insert(mail);
			}
			List<Attendant> rs = attendantDAO.getUncensoredAttendants(aId);
			
			Activity activity = session.get(Activity.class, aId);
			model.addAttribute("UncensoredAttendants",rs);
			model.addAttribute("aId", aId);
			model.addAttribute("peopleUplimit", activity.getPeopleUplimit());
			model.addAttribute("availablePeople", activity.getPeopleUplimit()-activity.getAccessPeople());
		return "manageActivity";
	}
	
	@RequestMapping(path= {"/getAgreedAttendants"})
	public String method8(Integer aId, Model model){
//			System.out.println(aId);
//			System.out.println(attendantId);
//			System.out.println(status);
//			attendantDAO.updateMemberStatus(aId, attendantId, status);
//			System.out.println("ggggggggggggggggggggggggggg");
			List<Attendant> rs = attendantDAO.getAgreedAttendants(aId);
//			System.out.println(rs);
//			System.out.println("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
			Session session = sessionFactory.getCurrentSession();
			Activity activity = session.get(Activity.class, aId);
			model.addAttribute("agreedAttendants",rs);
			model.addAttribute("aId", aId);
			model.addAttribute("peopleUplimit", activity.getPeopleUplimit());
			model.addAttribute("accessPeople", activity.getAccessPeople());
		return "manageActivity";
	}
	
	
	@RequestMapping(path= {"/deleteAgreedAttendant"})
	public String method9(Integer aId,Integer attendantId, Model model){
//			System.out.println(aId);
//			System.out.println(attendantId);
//			System.out.println(status);
//			attendantDAO.updateMemberStatus(aId, attendantId, status);
//			System.out.println("ggggggggggggggggggggggggggg");
			attendantDAO.deleteAgreedAttendant(aId, attendantId);
			List<Attendant> rs = attendantDAO.getAgreedAttendants(aId);
			Session session = sessionFactory.getCurrentSession();
			Activity activity = session.get(Activity.class, aId);
			model.addAttribute("agreedAttendants",rs);
			model.addAttribute("aId", aId);
			model.addAttribute("peopleUplimit", activity.getPeopleUplimit());
			model.addAttribute("accessPeople", activity.getAccessPeople());
		return "manageActivity";
	}
	
	
	@RequestMapping(path= {"/getAttendancy"})
	public String method10(Integer aId, Model model){
//			System.out.println(aId);
//			System.out.println(attendantId);
//			System.out.println(status);
//			attendantDAO.updateMemberStatus(aId, attendantId, status);
//			System.out.println("ggggggggggggggggggggggggggg");
			
			
			List<Attendant> rs = attendantDAO.getAgreedAttendants(aId);
			Session session = sessionFactory.getCurrentSession();
			Activity activity = session.get(Activity.class, aId);
			model.addAttribute("AttendantsForAttendancy",rs);
			model.addAttribute("aId", aId);
			model.addAttribute("peopleUplimit", activity.getPeopleUplimit());
			model.addAttribute("accessPeople", activity.getAccessPeople());
		return "manageActivity";
	}
	
	@RequestMapping(path= {"/manageAttendency"})
	public String method11(Integer aId, Integer attendantId, String attendency, Model model){
//			System.out.println(aId);
//			System.out.println(attendantId);
//			System.out.println(status);
//			attendantDAO.updateMemberStatus(aId, attendantId, status);
//			System.out.println("ggggggggggggggggggggggggggg");
			
			
		
			List<Attendant> rs = attendantDAO.getAgreedAttendants(aId);
			attendantDAO.updateAttendency(attendantId, attendency);
			
			Session session = sessionFactory.getCurrentSession();
			Activity activity = session.get(Activity.class, aId);
			
			model.addAttribute("AttendantsForAttendancy",rs);
			model.addAttribute("aId", aId);
			model.addAttribute("peopleUplimit", activity.getPeopleUplimit());
			model.addAttribute("accessPeople", activity.getAccessPeople());
		return "manageActivity";
	}
}
