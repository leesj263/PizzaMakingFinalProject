package com.kh.pmfp.company.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.pmfp.company.model.exception.FailSelectAdminMessage;
import com.kh.pmfp.company.model.exception.FailSelectOrder;
import com.kh.pmfp.company.model.exception.FaileDetailMessage;
import com.kh.pmfp.company.model.service.CompanyService;
import com.kh.pmfp.company.model.vo.CompanyBoard;
import com.kh.pmfp.company.model.vo.CompanyOrder;

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
	
	@RequestMapping("orderWaiting.com")
	public String orderWaiting(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		try {
			list = cs.orderWaiting();
			System.out.println("대기중 리스트 : " + list);
			request.setAttribute("list", list);
			return "company/orderListWaitting";
			
		} catch (FailSelectOrder e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
		
	}
	
	@RequestMapping("orderMaking.com")
	public String orderMaking(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		try {
			list = cs.orderMaking();
			System.out.println("제조중 리스트 : " + list);
			request.setAttribute("list", list);
			return "company/orderListMaking";
			
		} catch (FailSelectOrder e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@RequestMapping("orderDelivering.com")
	public String orderDelivering(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		try {
			list = cs.orderDelivering();
			System.out.println("배달중 리스트 : " + list);
			request.setAttribute("list", list);
			return "company/orderListDelivering";
			
		} catch (FailSelectOrder e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@RequestMapping("orderComplete.com")
	public String orderComplete(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		try {
			list = cs.orderComplete();
			System.out.println("배달완료 리스트 : " + list);
			request.setAttribute("list", list);
			return "company/orderListComplete";
			
		} catch (FailSelectOrder e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	

}
