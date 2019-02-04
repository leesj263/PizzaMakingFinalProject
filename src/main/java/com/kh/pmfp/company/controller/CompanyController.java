package com.kh.pmfp.company.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.pmfp.company.model.exception.FailSelectAdminMessage;
import com.kh.pmfp.company.model.exception.FaileDetailMessage;
import com.kh.pmfp.company.model.service.CompanyService;
import com.kh.pmfp.company.model.vo.CompanyBoard;

@Controller
public class CompanyController {
	@Autowired
	private CompanyService cs;
	
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
	
	@RequestMapping(value = "goMain.com", method = RequestMethod.GET)
	public String goCompanyMain(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CompanyBoard> adminMessage = new ArrayList<CompanyBoard>();
		
		try {
			adminMessage = cs.selectAdminMessage();
			//System.out.println("adminMessage : " + adminMessage);
			request.setAttribute("adminMessage", adminMessage);
			return "company/companyMain";
			//return "redirect:RedirectGoMain.com";
		} catch (FailSelectAdminMessage e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}
	
	@RequestMapping("detailAdminMessage.com")
	public String detailAdminMessage(int boardNo, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("클릭한 게시글 번호 : " + boardNo);
		
		try {
			CompanyBoard detailMessage = cs.detailAdminMessage(boardNo);
			System.out.println("detailMessage : " + detailMessage);
			request.setAttribute("detailMessage", detailMessage);
			return "company/DetailAdminMessage";
			
			
		} catch (FaileDetailMessage e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	
	
	@RequestMapping("RedirectGoMain.com")
	public String goMain() {
		return "company/companyMain";
	}

}
