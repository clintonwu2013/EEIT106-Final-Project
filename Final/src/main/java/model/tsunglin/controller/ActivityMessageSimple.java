package model.tsunglin.controller;

import java.util.Date;

import model.POJO.Activity;
import model.POJO.Member;

public class ActivityMessageSimple {

	private Integer messageId;
	private Integer activityId;
	private String activityName;
	
	private String email;
	private String memberName;
	private Integer vCount;
	
	private String message;
	private Date messageTime;
	
	private String response1;
	private Date responseTime;
	public Integer getMessageId() {
		return messageId;
	}
	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}
	
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getMessageTime() {
		return messageTime;
	}
	public void setMessageTime(Date messageTime) {
		this.messageTime = messageTime;
	}
	public Integer getActivityId() {
		return activityId;
	}
	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
//	public String getMemberPhoto() {
//		return memberPhoto;
//	}
//	public void setMemberPhoto(String memberPhoto) {
//		this.memberPhoto = memberPhoto;
//	}
	public Integer getvCount() {
		return vCount;
	}
	public void setvCount(Integer vCount) {
		this.vCount = vCount;
	}
	public String getResponse1() {
		return response1;
	}
	public void setResponse1(String response1) {
		this.response1 = response1;
	}
	public Date getResponseTime() {
		return responseTime;
	}
	public void setResponseTime(Date responseTime) {
		this.responseTime = responseTime;
	}
}
