package com.kh.pmfp.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.service.AdminService;
import com.kh.pmfp.admin.model.vo.AdminMember;
import com.kh.pmfp.admin.model.vo.AdminOrder;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService as;

	@RequestMapping(value="admin", method=RequestMethod.GET)
	public String adminPage(@RequestParam("admin")String admin) {
		System.out.println(admin);
		return "admin/"+admin;
	}
	
	@RequestMapping("userList.ad")
	public String userList(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminMember> userList=new ArrayList<AdminMember>();
		
		try {
			userList=as.selectUserList();
			System.out.println("회원 목록 : "+userList);
			request.setAttribute("memberList", userList);
			return "admin/user/userList";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="userDetail.ad", method=RequestMethod.GET)
	public String userDetail(int num, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("회원번호 : "+num);
		AdminMember am=new AdminMember();
		ArrayList<AdminOrder> orderList=new ArrayList<AdminOrder>();
		
		try {
			am=as.selectUser(num);
			orderList=as.selectUserOrder(num);
			System.out.println("조회 회원 : "+am);
			System.out.println("주문 목록 : "+orderList);
			
			request.setAttribute("member", am);
			request.setAttribute("orderList", orderList);
			
			return "admin/user/userDetail";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
}
