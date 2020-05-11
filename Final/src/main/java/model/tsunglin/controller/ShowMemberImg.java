package model.tsunglin.controller;

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

import model.tsunglin.service.activityService;
import model.tsunglin.service.memberService;

@Controller
public class ShowMemberImg {
	@Autowired
	memberService memberService;

	@RequestMapping(path = { "/{aId}/showMemberImg" })
	@ResponseBody
	public String createFolw(HttpServletRequest request, HttpServletResponse response,
			@PathVariable(value = "aId") String aId, Model model) {
		// response.setContentType("image/*");

		OutputStream os = null;
		try {

			os = response.getOutputStream();
			byte[] photo = memberService.findByPK(aId).getPhoto();
			
			if (photo != null) {
			
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

}
