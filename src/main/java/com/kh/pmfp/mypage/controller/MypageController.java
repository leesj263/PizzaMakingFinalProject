package com.kh.pmfp.mypage.controller;

import java.util.ArrayList;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.pmfp.common.model.vo.Member;
import com.kh.pmfp.mypage.model.service.MypageService;
import com.kh.pmfp.mypage.model.vo.Coupon;
import com.kh.pmfp.mypage.model.vo.DelList;
import com.kh.pmfp.mypage.model.vo.MyWriting;
import com.kh.pmfp.mypage.model.vo.OrderList;

@Controller
public class MypageController {
	@Autowired
	private MypageService mps;
	
	//마이페이지 메인 - 주문내역
	@RequestMapping(value="/mypage.mp")
	public String mypageMain(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		ArrayList<OrderList> orderList = new ArrayList<OrderList>();
		
		orderList = mps.selectOrderList(memberNo);
		System.out.println("orderList : " + orderList);
		
		//주문 토핑 split(도우,소스,크러스트는 수량 없애기)
		String[] arr;
		String arr1 = ""; //도우,소스,크러스트
		String arr2 = ""; //나머지 토핑
		
		ArrayList<String> toppingList = new ArrayList<String>();
		
		for(int i=0;i<orderList.size();i++) {
			arr = orderList.get(i).getOrderMaterial().split("/");
			for(int j=0;j<3;j++) {
				arr1 += arr[j].substring(0, arr[j].lastIndexOf("1"))+" / ";
			}
			for(int k=3;k<arr.length;k++) {
				if(k == arr.length-1) {
					arr2 += arr[k];
				}else {
					arr2 += arr[k]+" / ";					
				}
			}
			//toppingList.add(arr1+arr2);
			
			orderList.get(i).setOrderMaterial(arr1+arr2);
			
			arr1="";
			arr2="";
		}
		
		
		
		model.addAttribute("orderList",orderList);
		//model.addAttribute("toppingList", toppingList);
		
		
		return "mypage/orderList";
	}
	
	//배송지 내역
	@RequestMapping(value="/myPageDelAddr.mp")
	public String delList(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		ArrayList<DelList> delList = new ArrayList<DelList>();
		delList = mps.selectDelList(memberNo);
		
		model.addAttribute("delList", delList);
		
		return "mypage/deliList";
	}
	
	//쿠폰함 - 사용가능쿠폰
	@RequestMapping(value="myPageCoupon.mp")
	public String possibleCoupon(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		ArrayList<Coupon> pCouponList = mps.selectPCouponList(memberNo);
	
		model.addAttribute("pCouponList", pCouponList);
		
		return "mypage/coupon";
	}
	
	//쿠폰함 - 사용만료쿠폰
	@RequestMapping(value="myPageCouponTimeOut.mp")
	public String impossibleCoupon(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		ArrayList<Coupon> iCouponList = mps.selectICouponList(memberNo);
		
		model.addAttribute("iCouponList", iCouponList);
		
		return "mypage/coupon2";
	}
	
	
	
	//내 작성글
	@RequestMapping(value="myPageQna.mp")
	public String myWriting(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		ArrayList<MyWriting> myWritingList = mps.selectMyWritingList(memberNo);
		
		model.addAttribute("myWritingList", myWritingList);
		
		return "mypage/qnaList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
