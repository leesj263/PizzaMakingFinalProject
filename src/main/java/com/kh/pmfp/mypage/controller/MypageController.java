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
import com.kh.pmfp.customer.model.vo.MyPizza;
import com.kh.pmfp.mypage.model.service.MypageService;
import com.kh.pmfp.mypage.model.vo.Coupon;
import com.kh.pmfp.mypage.model.vo.DelList;
import com.kh.pmfp.mypage.model.vo.DistanceLoc;
import com.kh.pmfp.mypage.model.vo.Location;
import com.kh.pmfp.mypage.model.vo.MyWriting;
import com.kh.pmfp.mypage.model.vo.OrderDetail;
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
		ArrayList<String> baseList = new ArrayList<>();
		ArrayList<String> toppingList = new ArrayList<>();
		
		orderList = mps.selectOrderList(memberNo);
		System.out.println("orderList : " + orderList);
		
		//주문 토핑 split(도우,소스,크러스트는 수량 없애기)
		String[] splitArr;
		String arr1 = ""; //도우,소스,크러스트
		String arr2 = ""; //나머지 토핑
		
		for(int i=0;i<orderList.size();i++) {
			splitArr = orderList.get(i).getOrderMaterial().split("/");
			for(int j=0;j<3;j++) {
				if(j == 2) {
					arr1 += splitArr[j].substring(0, splitArr[j].lastIndexOf("1"));
				}else {
					arr1 += splitArr[j].substring(0, splitArr[j].lastIndexOf("1")) + " / ";
				}
			}
			for(int k=3;k<splitArr.length;k++) {
				if(k == splitArr.length-1) {
					arr2 += splitArr[k];
				}else {
					arr2 += splitArr[k]+" / ";					
				}
			}
			
			//orderList.get(i).setOrderMaterial(arr1+"\n"+arr2);
			baseList.add(arr1);
			toppingList.add(arr2);
			
			arr1="";
			arr2="";
		}

		model.addAttribute("baseList",baseList);
		model.addAttribute("toppingList",toppingList);
		model.addAttribute("orderList",orderList);

		return "mypage/orderList";
	}
	
	
	//주문내역 - 상세보기
	@RequestMapping(value="mpOderDetail.mp")
	public String mpOderDetail(HttpServletRequest request, @RequestParam(value="orderNo")int orderNo, Model model) {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();

		System.out.println("orderNo : " + orderNo);
		
		//사용쿠폰내역 카운트 조회
		int result = mps.selectUseCouponList(memberNo, orderNo);
		System.out.println("result : " + result);

		//model로 보낼것
		ArrayList<OrderDetail> modelDetailList = new ArrayList<>();
		
		
		String custom = ""; //토우,소스,엣지
		String custom2 = ""; //나머지 토핑
		int customPrice = 0; //커스텀만 합친 가격
		int sidePrice = 0; //사이드만 합친 가격
		
		ArrayList<OrderDetail> orderDetailList;
		OrderDetail od = new OrderDetail();
		
		if(result>0) {
			//쿠폰 사용내역 O - 상세보기
			orderDetailList = mps.selectOrderDetailList2(orderNo);
			
			od.setCouponCateg(orderDetailList.get(0).getCouponCateg());
			od.setCouponName(orderDetailList.get(0).getCouponName());
			od.setrDiscount(orderDetailList.get(0).getrDiscount());
			od.setpDiscount(orderDetailList.get(0).getpDiscount());
			
		}else {
			//쿠폰 사용내역 X - 상세보기
			orderDetailList = mps.selectOrderDetailList(orderNo);
		}	
			od.setOrderDate(orderDetailList.get(0).getOrderDate());
			od.setOrderReceiver(orderDetailList.get(0).getOrderReceiver());
			od.setOrderRtel(orderDetailList.get(0).getOrderRtel());
			
			od.setDeliveryAddr(orderDetailList.get(0).getDeliveryAddr());
			od.setComName(orderDetailList.get(0).getComName());
			od.setOrderIsize(orderDetailList.get(0).getOrderIsize());
			
			for(int i=0;i<orderDetailList.size();i++) {
				if(orderDetailList.get(i).getMaterialCateg() <= 3) { //도우,소스,엣지
					custom += orderDetailList.get(i).getMaterialName() + " / ";
					customPrice += orderDetailList.get(i).getMaterialSellprice() * orderDetailList.get(i).getOrderTcount();
				}else if(orderDetailList.get(i).getMaterialCateg() == 4) { //토핑
					custom2 += orderDetailList.get(i).getMaterialName() + " "+ orderDetailList.get(i).getOrderTcount() + " / ";
					customPrice += orderDetailList.get(i).getMaterialSellprice() * orderDetailList.get(i).getOrderTcount();
				}else if(orderDetailList.get(i).getMaterialCateg() == 5) { //사이드메뉴
					OrderDetail side = new OrderDetail();
					
					side.setMaterialName(orderDetailList.get(i).getMaterialName());
					side.setOrderTcount(orderDetailList.get(i).getOrderTcount());
					side.setMaterialCateg(orderDetailList.get(i).getMaterialCateg());
					side.setMaterialSellprice(orderDetailList.get(i).getMaterialSellprice());
					
					sidePrice += side.getMaterialSellprice() * orderDetailList.get(i).getOrderTcount();
					
					modelDetailList.add(side);
				}
				
			}
			custom2 = custom2.substring(0, custom2.length()-2);
			System.out.println("custom : " + custom);
			System.out.println("customPrice : " + customPrice);
			
			od.setOrderTcount2(orderDetailList.get(0).getOrderTcount2()); //완전체(도우,엣지,소스,토핑들 다 합친 것) 개수
			od.setMaterialName(custom); //줄바꿈 처리하려고 따로 했음
			od.setMaterialName2(custom2); //줄바꿈 처리하려고 따로 했음
			od.setMaterialSellprice(customPrice); //완전체 '하나' 가격
			
			//총 가격(커스텀+사이드)
			od.setPayPrice((customPrice * orderDetailList.get(0).getOrderTcount2())+sidePrice);
			
			modelDetailList.add(od);
			
			System.out.println(modelDetailList);

		model.addAttribute("modelDetailList",modelDetailList);
		
		return "mypage/orderDetail";
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
	
	//사용자주소와 매장주소 좌표비교 & 가까운 곳 배정
	@RequestMapping(value="comLatLon.mp", produces="application/text;charset=utf8")
	public @ResponseBody void comLatLon(@RequestParam String latlonVal, HttpServletResponse response){
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println("latlonVal : " + latlonVal);
		
		String[] latlonValArr = latlonVal.split(",");
		
		double userLat = Double.parseDouble(latlonValArr[1]);
		double userLon = Double.parseDouble(latlonValArr[0]);
		
		System.out.println("userLat : " + userLat);
		System.out.println("userLon : " + userLon);
		
		//지점 전체의 위도, 경도 얻기
		ArrayList<Location> list = mps.selectComLocation();
		
		ArrayList<DistanceLoc> locDistanceArr = new ArrayList<>();

		//가까운곳 배정
		for(int i=0;i<list.size();i++) {
			//new Distance();
			System.out.println(i +" : "+ list.get(i).getLat());
			System.out.println(i +" : "+ list.get(i).getLon());
			double locDistance = Distance.distance(list.get(i).getLat(), list.get(i).getLon(), userLat, userLon);
			
			locDistanceArr.add(new DistanceLoc(locDistance, list.get(i).getComNo()));
		}
		
		Collections.sort(locDistanceArr);
		
		for(DistanceLoc d : locDistanceArr) {
			System.out.println(d.getLocDistance());
		}
		
		if(locDistanceArr.get(0).getLocDistance() < 3) {
			System.out.println(locDistanceArr.get(0).getComNo());
			
			try {
				response.getWriter().print(locDistanceArr.get(0).getComNo());
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}else {
			try {
				response.getWriter().print("실패");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	
	}
	
	
	//배송지 추가
	@RequestMapping(value="deliveryAdd.mp")
	public String deliveryAdd(HttpServletRequest request, int finalDeliveryLoc, String addr, String deliName ,Model model) {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		int result = mps.insertUserDelAddr(memberNo, finalDeliveryLoc, addr, deliName);
		
		if(result>0) {
			
			return "redirect:myPageDelAddr.mp";
		}else {
			//model.addAttribute("msg", "배송지 추가 실패");
			//return "common/errorPage";
			return null;
		}
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
	
	//내피자
	@RequestMapping(value="myPageMyMenu.mp")
	public String myPizzaList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		ArrayList<MyPizza> myPizzaList = mps.selectMypizzaList(memberNo);
		
		model.addAttribute("myPizzaList",myPizzaList);
		
		return "mypage/myMenu";
	}
	
	
	
	
	
}
