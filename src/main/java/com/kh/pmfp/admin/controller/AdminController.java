package com.kh.pmfp.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.service.AdminService;
import com.kh.pmfp.admin.model.vo.AdminBoard;
import com.kh.pmfp.admin.model.vo.AdminMember;
import com.kh.pmfp.admin.model.vo.AdminOrder;
import com.kh.pmfp.admin.model.vo.AdminSeller;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService as;

	@RequestMapping(value="admin", method=RequestMethod.GET)
	public String adminPage(@RequestParam("admin")String admin) {
		System.out.println(admin);
		return "admin/"+admin;
	}
	
	//회원 목록 출력용
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
	
	//회원 상세조회용
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
	
	//업체 목록 출력용
	@RequestMapping("sellerList.ad")
	public String sellerList(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminSeller> sellerList=new ArrayList<AdminSeller>();
		
		try {
			sellerList=as.selectSellerList();
			System.out.println("지점 목록 : "+sellerList);
			request.setAttribute("sellerList", sellerList);
			return "admin/seller/sellerList";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}	
	}
	
	//승인 대기 목록 조회용
	@RequestMapping("waitSeller.ad")
	public String waitSeller(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminSeller> waitSeller=new ArrayList<AdminSeller>();
		
		try {
			waitSeller=as.selectWaitSeller();
			System.out.println("지점 목록 : "+waitSeller);
			request.setAttribute("waitSeller", waitSeller);
			return "admin/seller/waitSeller";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}	
	}
	
	//업체 상세 조회용
	@RequestMapping(value="sellerDetail.ad", method=RequestMethod.GET)
	public String sellerDetail(int num, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("업체 번호 : "+num);
		AdminSeller seller=new AdminSeller();
		//ArrayList<AdminOrder> orderList=new ArrayList<AdminOrder>();
		
		try {
			seller=as.selectSeller(num);
			//orderList=as.selectSellerOrder(num);
			System.out.println("조회 업체 : "+seller);
			//System.out.println("주문 목록 : "+orderList);
			
			request.setAttribute("seller", seller);
			//request.setAttribute("orderList", orderList);
			
			return "admin/seller/sellerDetail";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//업체 주문 목록 조회용
	
	@RequestMapping("sellerOrder.ad")
	public String sellerOrder(HttpServletRequest request, HttpServletResponse response) {
		//ArrayList<AdminSeller> sellerOrder=new ArrayList<AdminSeller>();
		/*
		try {
			sellerOrder=as.selectWaitSeller();
			System.out.println("업체 주문 : "+sellerOrder);
			request.setAttribute("sellerOrder", sellerOrder);
			return "admin/seller/sellerOrder";
			
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}	*/
		return "admin/seller/sellerOrder";
	}
	
	
	//업체 주문 상세 조회용
	/*
	@RequestMapping(value="sellerOrderDetail.ad", method=RequestMethod.GET)
	public String sellerOrderDetail(int num, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("재료주문번호 : "+num);
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
	*/
	
	@RequestMapping("noticeList.ad")
	public String selectNoticeList(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminBoard> noticeList=new ArrayList<AdminBoard>();
		
		try {
			noticeList=as.selectNoticeList();
			System.out.println("공지사항 목록 : "+noticeList);
			request.setAttribute("noticeList", noticeList);
			
			return "admin/board/noticeList";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
	}
	
	//공지사항 상세보기용
	@RequestMapping(value="noticeDetail.ad", method=RequestMethod.GET)
	public String selectNotice(int num, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("게시글 번호 : "+num);
		AdminBoard notice=new AdminBoard();
		
		try {
			notice=as.selectNotice(num);
			System.out.println("공지사항 : "+notice);
			request.setAttribute("notice", notice);
			
			return "admin/board/noticeDetail";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}

	}
	@RequestMapping("noticeWriteView.ad")
	public String noticeWriteView() {
		return "admin/board/noticeWrite";
	}
}
