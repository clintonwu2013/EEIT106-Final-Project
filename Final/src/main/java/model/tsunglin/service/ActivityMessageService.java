package model.tsunglin.service;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.POJO.ActivityMessage;
import model.tsunglin.dao.ActivityMessageDAO;
import model.tsunglin.dao.activityDAO;
@Service
public class ActivityMessageService {
	@Autowired
	ActivityMessageDAO activityMessageDAO; 
	public ActivityMessage findByPK(Integer messageId) {
		ActivityMessage rs = activityMessageDAO.findByPK(messageId);
		
		return rs;
	}
}
