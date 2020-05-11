package model.tsunglin.controller;

import java.util.Date;

import model.POJO.Activity;
import model.POJO.ActivityMessage;
import model.POJO.Member;

public class ReportSimple {
	
	private Integer activityId;
	private String activityName;
	private String violateType;
	private String memberEmail; 
	private String memberName;
	private Integer messageNo;
	private String messageTime;
	private String messageContent;
	private String response;
	private Date responseTime;
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
	public String getViolateType() {
		return violateType;
	}
	public void setViolateType(String violateType) {
		this.violateType = violateType;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public Integer getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(Integer messageNo) {
		this.messageNo = messageNo;
	}
	public String getMessageTime() {
		return messageTime;
	}
	public void setMessageTime(String messageTime) {
		this.messageTime = messageTime;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public String getResponse() {
		return response;
	}
	public void setResponse(String response) {
		this.response = response;
	}
	public Date getResponseTime() {
		return responseTime;
	}
	public void setResponseTime(Date responseTime) {
		this.responseTime = responseTime;
	}
	
}
