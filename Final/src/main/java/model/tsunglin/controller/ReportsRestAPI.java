package model.tsunglin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

//import javax.mail.Address;
//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.NoSuchProviderException;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeBodyPart;
//import javax.mail.internet.MimeMessage;
//import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import model.POJO.Activity;
import model.POJO.ActivityMessage;
import model.POJO.Mail;
import model.POJO.Member;
import model.POJO.Report;
import model.tsunglin.dao.ReportDAO;
import model.tsunglin.service.ActivityMessageService;
import model.tsunglin.service.ReportService;
@RestController
public class ReportsRestAPI {
	@Autowired
	MailSender mailSender;
	@Autowired
	ActivityMessageService activityMessageService;
	@Autowired
	ReportService reportService;
	@Autowired
	ReportDAO reportDAO;
	@GetMapping(path = { "/reports/{messageId}" }, produces = { "application/json", "application/xml" })
	public ResponseEntity<Object> findByPK(@PathVariable(value = "messageId") String temp) {
		System.out.println("method21() id=GGGGGGGGGGGGGGGGGGGGGGGGGG" + temp);
//		成功：200 (OK)、message body包含1個resource的資料
//		失敗(resource不存在)：404 (Not Found)
		try {
			int messageId = Integer.parseInt(temp);
			
			ActivityMessage rs = activityMessageService.findByPK(messageId);
			List<Report> rs2 = reportDAO.findByMessageId(messageId);
		
			
			ActivityMessageSimple activityMessage = new ActivityMessageSimple();
			activityMessage.setResponseTime(rs2.get(0).getResponseTime());
			activityMessage.setResponse1(rs2.get(0).getResponse1());
			
			activityMessage.setActivityId(rs.getActivity().getAid());
			activityMessage.setActivityName(rs.getActivity().getAname());
			activityMessage.setEmail(rs.getMember().getEmail());
			activityMessage.setMemberName(rs.getMember().getMname());
			activityMessage.setvCount(rs.getMember().getVcount());
			
			activityMessage.setMessage(rs.getMessage());
			activityMessage.setMessageId(rs.getMessageId());
			activityMessage.setMessageTime(rs.getMessageTime());
			
			
			if (rs != null) {
				return ResponseEntity.ok(activityMessage);
			} else {
				return ResponseEntity.notFound().build();
			}
		} catch (NumberFormatException e) {
			
			e.printStackTrace();
			return ResponseEntity.badRequest().build();
		}
		
		
	}
	
	
	@PostMapping(
			path = { "/reportsUpdate" }
		)
	public ResponseEntity<ReportSimple> update(Integer activityId,String activityName, String violateType,
			String memberEmail, String memberName, Integer messageNo, String messageTime,
			String messageContent, String response, HttpServletRequest request, HttpSession session) throws Exception {
//		System.out.println(activityId);
//		System.out.println(activityName);
//		System.out.println("vvvvvvvvvvvv");
//		System.out.println(violateType);
//		System.out.println(memberEmail);
//		System.out.println(memberName);
//		System.out.println(messageNo);
//		System.out.println(messageTime);
//		System.out.println(messageContent);
//		System.out.println(response);
		if(response!=null && response.length() !=0 ) {
			if("確認違規並送出".equals(violateType)) {
				reportService.updateReport(messageNo, violateType, response, new Date());
				reportService.updateMember(memberEmail);
			}
			
			SimpleMailMessage mail = new SimpleMailMessage();  
			mail.setFrom("clintonwu2013@gmail.com");  
			mail.setTo(memberEmail);  
			mail.setSubject("您的留言被檢舉了!!!");  
			mail.setText(response);  
			mailSender.send(mail); 
			
		}else if(response == null || response.length() ==0) {
			if("沒有違規".equals(violateType)) {
				reportService.updateReport(messageNo, violateType, response, new Date());
			}
			
		}
		
		
		ReportSimple report = new ReportSimple();
		
		
		report.setActivityId(activityId);
		report.setActivityName(activityName);
		report.setViolateType(violateType);
		report.setMemberEmail(memberEmail);
		report.setMemberName(memberName);
		report.setMessageNo(messageNo);
		report.setMessageTime(messageTime);
		report.setMessageContent(messageContent);
		report.setResponse(response);
		report.setResponseTime(new Date());
		
		
		//update 站內信
		
		
		
		
		return ResponseEntity.ok(report);
		
		
	}
	
	
	
	
	
}
