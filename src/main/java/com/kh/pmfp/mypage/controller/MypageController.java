package com.kh.pmfp.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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

import com.kh.pmfp.common.model.vo.CommonUtils;
import com.kh.pmfp.common.model.vo.Distance;
import com.kh.pmfp.common.model.vo.Member;
import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.common.model.vo.Pagination;
import com.kh.pmfp.mypage.model.service.MypageService;
import com.kh.pmfp.mypage.model.vo.Coupon;
import com.kh.pmfp.mypage.model.vo.DelList;
import com.kh.pmfp.mypage.model.vo.DistanceLoc;
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
	
	//@RequestMapping(value="comLatLon.mp", produces="application/text;charset=utf8")
	@RequestMapping(value="comLatLon.mp")
	public @ResponseBody int comLatLon(@RequestParam String latlonVal, HttpServletResponse response){
		System.out.println("latlonVal : " + latlonVal);
		String[] latlonValArr = latlonVal.split(",");
		//double[] arr = new double[2];
		//arr[0] = Double.parseDouble(userAddrList[0]);
		//arr[1] = Double.parseDouble(userAddrList[1]);
		System.out.println("double lat :" + latlonValArr[0]);
		System.out.println("double lon :" + latlonValArr[1]);
		
		double userLat = Double.parseDouble(latlonValArr[0]);
		double userLon = Double.parseDouble(latlonValArr[1]);
		
		//지점 전체의 위도, 경도 얻기
		ArrayList<Location> list = mps.selectComLocation();
		
		//String finalDeliveryLoc = "";
		//int finalDeliveryLoc = 0;
		
		ArrayList<DistanceLoc> locDistanceArr = new ArrayList<>();
		
		
		//가까운곳 배정
		for(int i=0;i<list.size();i++) {
			new Distance();
			double locDistance = Distance.distance(list.get(i).getLat(), list.get(i).getLon(), userLat, userLon);
			
			//System.out.println(list.get(i).getComName()+ " locDistance : " + locDistance);
			
			locDistanceArr.add(new DistanceLoc(locDistance, list.get(i).getComNo()));
			System.out.println("흠 : " + locDistanceArr);
			//locDistanceArr.add(locDistance);
		}
		
		Collections.sort(locDistanceArr);
		
		for(DistanceLoc d : locDistanceArr) {
			System.out.println(d.getLocDistance());
		}
		

		if(locDistanceArr.get(0).getLocDistance() < 3) {
			System.out.println("insert작업");
			System.out.println(locDistanceArr.get(0).getComNo());
			
			return locDistanceArr.get(0).getComNo();
			
		}else {
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('배달 가능한 매장이 없습니다.')");
				out.flush();
				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			return 0;
		}
		
		
		
	}
	
	
	//배송지 추가
	@RequestMapping(value="deliveryAdd.mp")
	public String deliveryAdd(HttpServletRequest request, String finalDeliveryLoc, String addr, String deliName ,Model model) {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		System.out.println("memberNo : " + memberNo);
		System.out.println("finalDeliveryLoc : " + finalDeliveryLoc);
		System.out.println("addr : " + addr);
		System.out.println("deliName : " + deliName);
		
		int result = mps.insertUserDelAddr(memberNo, finalDeliveryLoc, addr, deliName);
		
		if(result>0) {
			return "redirect:mypage/deliList";
		}else {
			//model.addAttribute("msg", "배송지 추가 실패");
			//return "common/errorPage";
		}
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
