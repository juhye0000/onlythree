package com.onlythree.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	@RequestMapping("/admin")
	public String adminIndex(Model model) {
		model.addAttribute("page", "dashboard");
		//return "template";
		return "adminindex";
	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(Model model) {
		model.addAttribute("page", "dashboard");
		//return "template";
		return "adminindex";
	}
}

