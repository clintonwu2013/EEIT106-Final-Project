package model.tsunglin.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import model.POJO.Activity;
import model.POJO.Mail;
import model.POJO.Member;
import model.tsunglin.service.MailService;
import model.tsunglin.service.activityService;



@RestController
public class ActivityRestAPI {
	@Autowired
	activityService activityService;
	@Autowired
	MailService mailService;
	@GetMapping(path = { "/activities/{aId}" }, produces = { "application/json", "application/xml" })
	public ResponseEntity<Object> findByPK(@PathVariable(value = "aId") String temp) {
		System.out.println("method21() id=" + temp);
//		成功：200 (OK)、message body包含1個resource的資料
//		失敗(resource不存在)：404 (Not Found)
		try {
			int aId = Integer.parseInt(temp);
			Activity rs = activityService.findByPK(aId);
			ActivitySimple activity = new ActivitySimple();

			activity.setAid(rs.getAid());                                    
			activity.setAname(rs.getAname());
			activity.setAcontent(rs.getAcontent());
			activity.setAtype(rs.getAtype());
			activity.setBeginTime(rs.getBeginTime());
			activity.setEndTime(rs.getEndTime());
			activity.setAddress(rs.getAddress());
			activity.setPeopleUplimit(rs.getPeopleUplimit());
			activity.setAccessPeople(rs.getAccessPeople());
			activity.setGood(rs.getAccessPeople());
			activity.setStatus(rs.getStatus());
			activity.setCost(rs.getCost());
			activity.setAttendLimitTime(rs.getAttendLimitTime());
			activity.setPermission(rs.getPermission());
			
			activity.setMname(rs.getMember().getMname());
			activity.setEmail(rs.getMember().getEmail());
			
			
			if (rs != null) {
				return ResponseEntity.ok(activity);
			} else {
				return ResponseEntity.notFound().build();
			}
		} catch (NumberFormatException e) {
			
			e.printStackTrace();
			return ResponseEntity.badRequest().build();
		}
		
	}
	
	@PostMapping(
			path = { "/updateActivity" },
			produces = { "application/json", "application/xml" }
		)
	public ResponseEntity<Object> update(Integer aId,
		     String permission, HttpSession session) {
		System.out.println("ooooooooooooooooooooooooooooooo");
		System.out.println(aId);
		System.out.println(permission);
		
		Activity rs = activityService.updatePermission(aId, permission);
		
		Mail mail = new Mail();
		if("通過".equals(permission)) {
			
			mail.setMemberByEmail1((Member)session.getAttribute("member"));
			mail.setMemberByEmail2(rs.getMember());
			mail.setMessage("Hi, "+rs.getMember().getMname()+", 您申請舉辦的活動: "+rs.getAname()+", 已經通過審核囉!!!");
			mail.setTitle("您申請舉辦的活動已經通過囉!!!");
			mail.setStatus("未讀");
			mail.setDeliveryTime(new java.util.Date());
			mailService.insert(mail);
			
			
		}else if("不通過".equals(permission)) {
			
			mail.setMemberByEmail1((Member)session.getAttribute("member"));
			mail.setMemberByEmail2(rs.getMember());
			mail.setMessage("Hi, "+rs.getMember().getMname()+", 您申請舉辦的活動: "+rs.getAname()+", 沒有通過審查!  但世界還是很美好,  請保持愉快。");
			mail.setTitle("您申請舉辦的活動未通過審查!");
			mail.setStatus("未讀");
			mail.setDeliveryTime(new java.util.Date());
			mailService.insert(mail);
			
			
		}
		
		ActivitySimple activity = new ActivitySimple();

		activity.setAid(rs.getAid());                                    
		activity.setAname(rs.getAname());
		activity.setAcontent(rs.getAcontent());
		activity.setAtype(rs.getAtype());
		activity.setBeginTime(rs.getBeginTime());
		activity.setEndTime(rs.getEndTime());
		activity.setAddress(rs.getAddress());
		activity.setPeopleUplimit(rs.getPeopleUplimit());
		activity.setAccessPeople(rs.getAccessPeople());
		activity.setGood(rs.getAccessPeople());
		activity.setStatus(rs.getStatus());
		activity.setCost(rs.getCost());
		activity.setAttendLimitTime(rs.getAttendLimitTime());
		activity.setPermission(rs.getPermission());
		
		activity.setMname(rs.getMember().getMname());
		activity.setEmail(rs.getMember().getEmail());
//		成功(resource存在、替換成功)：200 (OK)、message body包含修改(整體替換)過的resource資料
//		失敗(resource不存在、不新增resource)：404 (Not Found)
		if(rs !=null) {
			return ResponseEntity.ok(activity);
		}else {
			return ResponseEntity.notFound().build(); 
		}
		
	}
	
//	@RequestMapping(value = "/image-response-entity/{aId}", method = RequestMethod.GET)
//	public ResponseEntity<byte[]> getImageAsResponseEntity(@PathVariable(value = "aId") String temp, Model model) {
//	    HttpHeaders headers = new HttpHeaders();
//	    
//	    
//	    headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//	    int aId = Integer.parseInt(temp);
//	    System.out.println("aId");
//		Activity rs = activityService.findByPK(aId);
//		byte[] photo = rs.getPhoto();
//		model.addAttribute("photo", photo);
//	    ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(photo, headers, HttpStatus.OK);
//	    return responseEntity;
//	}
//	
//	@RequestMapping(value = "/image-byte-array/{aId}", method = RequestMethod.GET)
//	public @ResponseBody byte[] getImageAsByteArray(@PathVariable(value = "aId") String temp) throws IOException {
//		int aId = Integer.parseInt(temp);
//		System.out.println("aId");
//		Activity rs = activityService.findByPK(aId);
//		byte[] photo = rs.getPhoto();
//	    return photo;
//	}
}
