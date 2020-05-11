package model.tsunglin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.POJO.Member;
import model.POJO.Report;
import model.tsunglin.dao.ReportDAO;
import model.tsunglin.service.ReportService;

@Controller
public class ReportController {
	@Autowired
	ReportDAO reportDAO;
	@Autowired
	ReportService reportService;
	 
	@RequestMapping(path= {"/findReports"} )
	public String method1(Model model) {
		List<Report> reports = reportService.findAll();
		System.out.println("oooooxxxxxx");
		model.addAttribute("reports", reports);
		return "backstage";
	}
	
}
