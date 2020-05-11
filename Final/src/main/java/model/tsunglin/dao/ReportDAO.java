package model.tsunglin.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.POJO.Report;
@Repository
public class ReportDAO {
	@Autowired
	SessionFactory sessionFactory;
	
	public List<Report> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List<Report> rs = session.createQuery("from Report where status='待處理'  order by messageId", Report.class).list();
		return rs;
	}
	
	public List<Report> findByMessageId(Integer messageId) {
		Session session = sessionFactory.getCurrentSession();
		List<Report> rs = session.createQuery("from Report where messageId="+ messageId, Report.class).list();
		return rs;
	}
	
	
	
	public void update(Integer messageId, String status, String response1, Date responseTime) {
		Session session = sessionFactory.getCurrentSession();
		List<Report> reports = session.createQuery("from Report where messageId="+messageId, Report.class).list();
		System.out.println(reports.get(0).getContent());
		
		for(Report report: reports) {
			report.setStatus(status);
			report.setResponse1(response1);
			report.setResponseTime(responseTime);	
		}
	}
	
	
}
