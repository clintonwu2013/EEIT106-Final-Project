package model.tsunglin.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.POJO.Activity;
import model.POJO.Mail;
@Repository
public class MailDAO {
	@Autowired
	SessionFactory sessionFactory;
	String email2=null;
	private int pageNo = 0;
	private int recordsPerPage = 5;
	private int totalPages = -1;
	

	@SuppressWarnings("unchecked")
	public long getRecordCounts(String email) {
		long count = 0;
		String hql = "SELECT count(*) FROM Mail where email2= :email2";
		List<Long> list = 
				sessionFactory.getCurrentSession().createQuery(hql).setParameter("email2", email).list();
		if(list.size()>0) {
			count = list.get(0);
		}
		return count;
	}
	
	public int getTotalPages() {
		totalPages = (int)Math.ceil(getRecordCounts(email2) / (double)recordsPerPage);
		return totalPages; 
	}
	
	public int getPageNo() {
		return pageNo;
	}
	
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public int getRecordsPerPage() {
		return recordsPerPage;
	}
	public void setRecordsPerPage(int recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
	}
	
	
	
	public boolean insert(Mail mail) {
		Session session = sessionFactory.getCurrentSession();
		
		Serializable flag = session.save(mail);
		
		if(flag !=null) {
			return true;
		}
		
		return false;
		
	}
	
	public List<Mail> findAll() {
		Session session = sessionFactory.getCurrentSession();
		//session.beginTransaction();
		List<Mail> rs = null;
		rs = session.createQuery("from Mail order by deliveryTime ASC", Mail.class).list();

		return rs;
	}
	
	public List<Mail> findByEmail2(String email) {
		Session session = sessionFactory.getCurrentSession();
		//session.beginTransaction();
		int starRecordNo = (pageNo - 1) * recordsPerPage;
		System.out.println("llllll:"+recordsPerPage);
		List<Mail> rs = null;
		rs = session.createQuery("from Mail where email2='"+email+"' order by deliveryTime desc", Mail.class)
				.setFirstResult(starRecordNo).setMaxResults(recordsPerPage).list();

		return rs;
	}
	
	public Mail findByPK(Integer mailNo) {
		Session session = sessionFactory.getCurrentSession();
		Mail mail = session.get(Mail.class, mailNo);

		return mail;
	}
	
	public Mail updateMailStatus(Integer mailNo, String status) {
		Session session = sessionFactory.getCurrentSession();
		Mail rs = session.get(Mail.class, mailNo);
		rs.setStatus(status);
		
		return rs;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

}
