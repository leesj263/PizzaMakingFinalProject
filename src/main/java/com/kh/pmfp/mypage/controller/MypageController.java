package com.kh.pmfp.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.pmfp.common.model.vo.CommonUtil;
import com.kh.pmfp.common.model.vo.Member;
import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.common.model.vo.Pagination;
import com.kh.pmfp.mypage.model.service.MypageService;
import com.kh.pmfp.mypage.model.vo.Coupon;
import com.kh.pmfp.mypage.model.vo.DelList;
import com.kh.pmfp.mypage.model.vo.Location;
import com.kh.pmfp.mypage.model.vo.MyWriting;
import com.kh.pmfp.mypage.model.vo.OrderList;

@Controller
public class MypageController {
	@Autowired
	private MypageService mps;
	
	//주문내역(마이페이지 메인)
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
			
			orderList.get(i).setOrderMaterial(arr1+arr2);
			
			arr1="";
			arr2="";
		}

		
		model.addAttribute("orderList",orderList);

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
	
	//배송지 추가 팝업
	@RequestMapping(value="myPageDelPopup.mp")
	public String delPopup() {
		
		return "mypage/deliveryPopup";
	}
	
	//위도, 경도 얻기
	@RequestMapping(value="latlon.mp")
	public @ResponseBody ArrayList<Location>latlon(@RequestParam String addr, HttpServletResponse response){
		ArrayList<Location> list = mps.selectComLocation();
		
		System.out.println("addr : " + addr);
		Float[] userAddrLatLon = CommonUtil.geoCoding(addr);
		
		System.out.println(addr +":" + userAddrLatLon[0] + ", " + userAddrLatLon[1]);
		
		
		
		return null;
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
	
	
	
	//내 작성글 - 문의
	@RequestMapping(value="myPageQna.mp")
	public String myWritingQna(HttpServletRequest request, Model model, @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage) {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		int listCount = mps.selectListCount(memberNo, 0);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<MyWriting> myWritingList = mps.selectMyWritingList(memberNo, pi);
		
		model.addAttribute("myWritingList", myWritingList);
		model.addAttribute("boardType", myWritingList.get(0).getBoardType());
		model.addAttribute("pi", pi);
		
		return "mypage/qnaList";
	}
	
	//내 작성글 - 후기
	@RequestMapping(value="myPageReview.mp")
	public String myWritingReview(HttpServletRequest request, Model model, @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage) {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		int listCount = mps.selectListCount(memberNo, 0);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<MyWriting> myWritingList = mps.selectMyWritingReviewList(memberNo, pi);
		
		model.addAttribute("myWritingList", myWritingList);
		model.addAttribute("boardType", myWritingList.get(0).getBoardType());
		model.addAttribute("pi", pi);
		
		return "mypage/qnaList";
	}
	
	//내 작성글 - 공유
	@RequestMapping(value="myPageShare.mp")
	public String myWritingShare(HttpServletRequest request, Model model, @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage) {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		int listCount = mps.selectListCount(memberNo, 1);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<MyWriting> myWritingList = mps.selectMyWritingShareList(memberNo, pi);
		
		model.addAttribute("myWritingList", myWritingList);
		model.addAttribute("boardType", myWritingList.get(0).getBoardType());
		model.addAttribute("pi", pi);
		
		return "mypage/qnaList";
	}
	
	
	
	
	
	
	
}
