package model.tsunglin.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import model.POJO.Activity;
import model.tsunglin.dao.activityDAO;
import model.tsunglin.service.activityService;
@Controller
public class ActivityController {
	@Autowired
	private activityDAO activityDAO;
	@Autowired
	private activityService activityService;
	@Autowired
	private SessionFactory sessionFactory;
	@InitBinder
	public void intitBinder(WebDataBinder binder) {
		binder.registerCustomEditor(java.util.Date.class, 
				new CustomDateEditor(new SimpleDateFormat("yyyy/MM/dd hh:mm"), true));
		
		
		
		binder.registerCustomEditor(byte[].class,
	            new ByteArrayMultipartFileEditor());
//		binder.registerCustomEditor(Double.class, new CustomNumberEditor(Double.class, true) );
//		
//		binder.registerCustomEditor(Integer.class, new CustomNumberEditor(Integer.class, true)  );
	}
	
	
	@RequestMapping(path= {"/findUnreviewed"} )
	public String method3(Model model) {
		List<Activity> unreviewedActivities = activityService.findUnreviewed();
//		System.out.println("ccccccccc");
		model.addAttribute("unreviewedActivities",unreviewedActivities);
		return "backstage";
	}
	
	@RequestMapping(path= {"/findActivityByPK"} )
	public String method4(Integer unreviewedActivityId, Model model) {
		Activity activity = activityService.findByPK(unreviewedActivityId);
//		System.out.println(activity.getAcontent());
		return "backstage";
	}
	
	@RequestMapping(path= {"/getManageActivity"} )
	public String method5(Integer aId, Model model) {
		Activity activity = activityService.findByPK(aId);
		model.addAttribute("activity", activity);
		model.addAttribute("aId", aId);
		System.out.println(aId);
//		System.out.println(activity.getAcontent());
		return "manageActivity";
	}
	
	
	@RequestMapping(path= {"/updateActivityAll"}, headers={"content-type=multipart/form-data"})
	public String method6(Activity activity,BindingResult bindingResult, Model model, MultipartFile photo) throws IOException {
//		System.out.println(activity.getAname());
//		System.out.println(activity.getEndTime());
//		System.out.println(activity.getBeginTime());
//		System.out.println(activity.getAcontent());
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/mm/dd hh:mm");
//		System.out.println(activity.getBeginTime());
//		System.out.println(activity.getEndTime());
		
		
		byte[] pic = photo.getBytes();
		
		if(pic.length !=0) {
			
			activity.setPhoto(pic);
		}else {
			Session session = sessionFactory.getCurrentSession();
			Activity activityOld = session.get(Activity.class, activity.getAid());
			activity.setPhoto(activityOld.getPhoto());
		}
		
		activityDAO.updateAll(activity);
		model.addAttribute("activity", activity);
		model.addAttribute("aId", activity.getAid());
		return "manageActivity";
	}
	
	
	
	@RequestMapping(path= {"/findActivityByTypes"} )
	public String method6(String selectType, String inputDate, Model model) {
		
		System.out.println(selectType);
		System.out.println(inputDate);
		List<Activity> rs = null;
		if(!inputDate.trim().equals("")){
			System.out.println("jjjjjjjj");
			java.sql.Date tempDate = java.sql.Date.valueOf(inputDate);
			
			Date date = new Date(tempDate.getTime());
			rs = activityDAO.findActivityByTypes(selectType, date);
			model.addAttribute("ActivitiesByTypes", rs);
		}else {
			rs = activityDAO.findActivityByTypes(selectType, null);
			model.addAttribute("ActivitiesByTypes", rs);
		}
		
		
		
		
		
		if("通過".equals(selectType)) {
			model.addAttribute("alreadyPress","通過");
		}else if("不通過".equals(selectType)) {
			model.addAttribute("alreadyPress","不通過");
		}
		
		return "ReturnBackstageIndexForTypes";
	}
	
	
}
