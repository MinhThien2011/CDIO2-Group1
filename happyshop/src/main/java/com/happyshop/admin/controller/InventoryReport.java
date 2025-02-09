package com.happyshop.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.happyshop.dao.ReportDAO;

@Controller
public class InventoryReport {
	@Autowired
	ReportDAO dao;
	
	@RequestMapping("/admin/inventory/index")
	public String index(Model model) {
		model.addAttribute("data", dao.inventory());
		return "admin/report/inventory";
	}
	
	@RequestMapping("/admin/revenue/category")
	public String revenueByCategory(Model model) {
		model.addAttribute("data", dao.revenueByCategory());
		return "admin/report/revenue-by-category";
	}
	
	@RequestMapping("/admin/revenue/customer")
	public String revenueByCustomer(Model model) {
		model.addAttribute("data", dao.revenueByCustomer());
		return "admin/report/revenue-by-customer";
	}
	
	@RequestMapping("/admin/revenue/year")
	public String revenueByYear(Model model) {
		model.addAttribute("data", dao.revenueByYear());
		return "admin/report/revenue-by-year";
	}
	
	@RequestMapping("/admin/revenue/quarter")
	public String revenueByQuarter(Model model) {
		model.addAttribute("data", dao.revenueByQuarter());
		return "admin/report/revenue-by-quarter";
	}
	
	@RequestMapping("/admin/revenue/month")
	public String revenueByMonth(Model model) {
		model.addAttribute("data", dao.revenueByMonth());
		return "admin/report/revenue-by-month";
	}
	
}
