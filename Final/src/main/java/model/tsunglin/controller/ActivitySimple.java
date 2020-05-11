package model.tsunglin.controller;

import java.util.Date;

public class ActivitySimple {
	private Integer aid;
	private String aname;
	private String acontent;
	private String atype;
	private Date beginTime;
	private Date endTime;
	private String address;
	private Integer peopleUplimit;
	private Integer accessPeople;
	private String permission;
	private Integer good;
	private String status;
	private Integer cost;
	private Date attendLimitTime;
	
	private String mname;
	private String email;
	
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public String getAtype() {
		return atype;
	}
	public void setAtype(String atype) {
		this.atype = atype;
	}
	public Date getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getPeopleUplimit() {
		return peopleUplimit;
	}
	public void setPeopleUplimit(Integer peopleUplimit) {
		this.peopleUplimit = peopleUplimit;
	}
	public Integer getAccessPeople() {
		return accessPeople;
	}
	public void setAccessPeople(Integer accessPeople) {
		this.accessPeople = accessPeople;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public Integer getGood() {
		return good;
	}
	public void setGood(Integer good) {
		this.good = good;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getCost() {
		return cost;
	}
	public void setCost(Integer cost) {
		this.cost = cost;
	}
	public Date getAttendLimitTime() {
		return attendLimitTime;
	}
	public void setAttendLimitTime(Date attendLimitTime) {
		this.attendLimitTime = attendLimitTime;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
