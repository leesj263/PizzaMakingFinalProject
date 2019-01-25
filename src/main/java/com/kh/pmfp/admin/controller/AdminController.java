package com.kh.pmfp.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {

	@RequestMapping(value="admin", method=RequestMethod.GET)
	public String adminPage(@RequestParam("admin")String admin) {
		System.out.println(admin);
		return "admin/"+admin;
	}
}
