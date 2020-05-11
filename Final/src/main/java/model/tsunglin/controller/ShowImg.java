package model.tsunglin.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.POJO.Activity;
import model.tsunglin.service.activityService;

@Controller
public class ShowImg {
	@Autowired
	activityService activityService;
	
	@RequestMapping(path= {"/showImg/{aId}"})
	@ResponseBody
	public String createFolw(HttpServletRequest request,
			HttpServletResponse response, @PathVariable(value = "aId") Integer aId, Model model) {
		// response.setContentType("image/*");
		System.out.println("lklklklknnnnnnnnnnnnnnnn");
		OutputStream os = null;
		try {
			
			os = response.getOutputStream();
			byte[] photo = activityService.findByPK(aId).getPhoto();
			if(photo != null) {
				os.write(photo, 0, photo.length);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "ok";
	}
//	public String show(@PathVariable(value = "aId") String aId) {
//		 int aid = Integer.parseInt(aId);
//		 System.out.println(aid);
//		 Activity activity = activityService.findByPK(aid);
//		 System.out.println(activity.getAcontent());
//		 return "backstage";
//	}
}
