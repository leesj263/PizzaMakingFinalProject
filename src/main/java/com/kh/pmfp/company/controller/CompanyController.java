package com.kh.pmfp.company.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CompanyController {
	
	/*@RequestMapping("/login.me")
	public String loginCheck(HttpServletRequest request, HttpServletResponse response) {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		System.out.println("userId : " + userId);
		System.out.println("userPwd : " + userPwd);
		
		return "main/main";
	}*/
	
	/*@RequestMapping(value = "/login.me", method=RequestMethod.POST)
	public String loginCheck(@RequestParam("userId")String userId, @RequestParam("userPwd")String userPwd) {
			
		
		System.out.println("userId : " + userId);
		System.out.println("userPwd : " + userPwd);
		
				
		return "main/main";
	}*/
	
	/*@RequestMapping(value = "/login.me", method=RequestMethod.POST)
	public String loginCheck(String userId, String userPwd) {
		
		System.out.println("userId : " + userId);
		System.out.println("userPwd : " + userPwd);
		
		return "main/main";
	}*/
	
	/*@RequestMapping(value = "/login.me", method=RequestMethod.POST)
	public String loginCheck(@ModelAttribute Member m) {
		
		System.out.println("member : " + m);
		
		return "main/main";
	}*/

	@RequestMapping(value = "movePage.com", method=RequestMethod.GET)
	public String moveCompanyPage(String movePage) {
		return "company/"+movePage;
	}
	

}
