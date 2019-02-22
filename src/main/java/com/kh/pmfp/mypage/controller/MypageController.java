package com.kh.pmfp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.pmfp.common.model.vo.Distance;
import com.kh.pmfp.common.model.vo.Member;
import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.common.model.vo.Pagination;
import com.kh.pmfp.common.model.vo.Pagination8;
import com.kh.pmfp.customer.model.vo.MyPizza;
import com.kh.pmfp.mypage.model.exception.MypageCountException;
import com.kh.pmfp.mypage.model.exception.MypageInsertException;
import com.kh.pmfp.mypage.model.exception.MypageListException;
import com.kh.pmfp.mypage.model.service.MypageService;
import com.kh.pmfp.mypage.model.vo.Coupon;
import com.kh.pmfp.mypage.model.vo.DelList;
import com.kh.pmfp.mypage.model.vo.DistanceLoc;
import com.kh.pmfp.mypage.model.vo.Location;
import com.kh.pmfp.mypage.model.vo.MyWriting;
import com.kh.pmfp.mypage.model.vo.MypizzaPopup;
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
		
		try {
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
			
		} catch (MypageListException e) {
			request.setAttribute("msg", "주문 내역 목록 조회 실패");
			return "common/errooPage";
		}	
	}
	
	
	//주문내역 - 상세보기
	@RequestMapping(value="mpOderDetail.mp")
	public String mpOderDetail(HttpServletRequest request, @RequestParam(value="orderNo")int orderNo, Model model) {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();

		System.out.println("orderNo : " + orderNo);
		
		try {
			//사용쿠폰내역 카운트 조회
			int result = mps.selectUseCouponList(memberNo, orderNo);
			System.out.println("result : " + result);
	
			//model로 보낼것
			ArrayList<OrderDetail> modelDetailList = new ArrayList<>();
			
			
			String custom = ""; //토우,소스,엣지
			String custom2 = ""; //나머지 토핑
			int customPrice = 0; //커스텀만 합친 가격
			int sidePrice = 0; //사이드만 합친 가격
		
			ArrayList<OrderDetail> orderDetailList = new ArrayList<>();
			OrderDetail od = new OrderDetail();
			
			if(result>0) {
				//쿠폰 사용내역 O - 상세보기
				orderDetailList = mps.selectOrderDetailList2(orderNo);
				
				od.setCouponCateg(orderDetailList.get(0).getCouponCateg());
				od.setCouponName(orderDetailList.get(0).getCouponName());
				od.setrDiscount(orderDetailList.get(0).getrDiscount());
				od.setpDiscount(orderDetailList.get(0).getpDiscount());
			} 

			else {
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
			
		} catch (MypageCountException e1) {
			request.setAttribute("msg", "주문 상세보기 - 쿠폰 사용여부 조회 실패");
			return "common/errorPage";
		} catch (MypageListException e2) {
			request.setAttribute("msg", "주문 상세보기  조회 실패");
			return "common/errorPage";
		}
	}
	
	
	
	//배송지 내역
	@RequestMapping(value="/myPageDelAddr.mp")
	public String delList(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		ArrayList<DelList> delList = new ArrayList<DelList>();
		
		try {
			delList = mps.selectDelList(memberNo);
			
			model.addAttribute("delList", delList);
			
			return "mypage/deliList";
			
		} catch (MypageListException e) {
			request.setAttribute("msg", "배송지 내역  조회 실패");
			return "common/errorPage";
		}
		
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
		
		int result;
		try {
			result = mps.insertUserDelAddr(memberNo, finalDeliveryLoc, addr, deliName);
			if(result>0) {
				return "redirect:myPageDelAddr.mp";
			}else {
				System.out.println("배송지 insert 실패");
				return null;
			}
		} catch (MypageInsertException e) {
			model.addAttribute("msg", "배송지 추가 실패");
			return "common/errorPage";
		}
		
	}
	
	//배송지 삭제
	@RequestMapping(value="deliveryDelete.mp")
	public String deliveryDelete() {
		
		return null;
	}
	
	
	
	
	//쿠폰함 - 사용가능쿠폰
	@RequestMapping(value="myPageCoupon.mp")
	public String possibleCoupon(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		ArrayList<Coupon> pCouponList;
		try {
			pCouponList = mps.selectPCouponList(memberNo);
			
			model.addAttribute("pCouponList", pCouponList);
			
			return "mypage/coupon";
			
		} catch (MypageListException e) {
			request.setAttribute("msg", "사용가능쿠폰 조회 실패");
			return "common/errorPage";
		}
	}
	
	//쿠폰함 - 사용만료쿠폰
	@RequestMapping(value="myPageCouponTimeOut.mp")
	public String impossibleCoupon(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		ArrayList<Coupon> iCouponList;
		try {
			iCouponList = mps.selectICouponList(memberNo);
			model.addAttribute("iCouponList", iCouponList);
			
			return "mypage/coupon2";
			
		} catch (MypageListException e) {
			request.setAttribute("msg", "사용가능쿠폰 조회 실패");
			return "common/errorPage";
		}
		
	}
	
	
	
	//내 작성글 - 문의
	@RequestMapping(value="myPageQna.mp")
	public String myWritingQna(HttpServletRequest request, Model model, @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage) {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		try {
			int listCount = mps.selectListCount(memberNo, 3);
			
			if(listCount>0) {
				PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
				
				ArrayList<MyWriting> myWritingList;
				myWritingList = mps.selectMyWritingList(memberNo, pi);
				
				model.addAttribute("myWritingList", myWritingList);
				model.addAttribute("boardType", myWritingList.get(0).getBoardType());
				model.addAttribute("pi", pi);
			}else {
				model.addAttribute("boardType", 3);
			}
			
			return "mypage/qnaList";
			
		} catch (MypageListException e) {
			request.setAttribute("msg", "내 문의글 조회 실패 ");
			return "common/qnaErrorPage";
		} catch (MypageCountException e) {
			request.setAttribute("msg", "내 후기글 카운트 조회 실패 ");
			return "common/errorPage";
		}
		
	}
	
	//내 작성글 - 후기
	@RequestMapping(value="myPageReview.mp")
	public String myWritingReview(HttpServletRequest request, Model model, @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage) {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		try {
			int listCount = mps.selectListCount(memberNo, 0);
			
			if(listCount>0) {
				PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
				
				ArrayList<MyWriting> myWritingList;
			
				myWritingList = mps.selectMyWritingReviewList(memberNo, pi);
				
				model.addAttribute("myWritingList", myWritingList);
				model.addAttribute("pi", pi);
				model.addAttribute("boardType", myWritingList.get(0).getBoardType());
				
			}else {
				model.addAttribute("boardType", 0);
			}
				return "mypage/qnaList";
				
			} catch (MypageListException e) {
				request.setAttribute("msg", "내 후기글 조회 실패 ");
				return "common/errorPage";
			} catch (MypageCountException e) {
				request.setAttribute("msg", "내 후기글 카운트 조회 실패 ");
				return "common/errorPage";
			} 
	}
	
	//내 작성글 - 공유
	@RequestMapping(value="myPageShare.mp")
	public String myWritingShare(HttpServletRequest request, Model model, @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage) {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		try {
			int listCount = mps.selectListCount(memberNo, 1);
			
			if(listCount>0) {
				PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
				
				ArrayList<MyWriting> myWritingList;
				myWritingList = mps.selectMyWritingShareList(memberNo, pi);
				
				model.addAttribute("myWritingList", myWritingList);
				model.addAttribute("boardType", myWritingList.get(0).getBoardType());
				model.addAttribute("pi", pi);
				
			}else {
				model.addAttribute("boardType", 1);
			}
			
			return "mypage/qnaList";
			
		} catch (MypageListException e) {
			request.setAttribute("msg", "내 공유글 조회 실패 ");
			return "common/errorPage";
		} catch (MypageCountException e) {
			request.setAttribute("msg", "내 후기글 카운트 조회 실패 ");
			return "common/errorPage";
		} 
		
	}
	
	//내피자
	@RequestMapping(value="myPageMyMenu.mp")
	public String myPizzaList(HttpServletRequest request, Model model, @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage) {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		try {
			int listCount = mps.selectMypizzaCount(memberNo);
			
			PageInfo pi = Pagination8.getPageInfo(currentPage, listCount);
			
			ArrayList<MyPizza> myPizzaList;
			myPizzaList = mps.selectMypizzaList(memberNo, pi);
			
			model.addAttribute("myPizzaList",myPizzaList);
			model.addAttribute("pi",pi);
			
			return "mypage/myMenu";
			
		} catch (MypageListException e) {
			request.setAttribute("msg", "내 피자 조회 실패 ");
			return "common/errorPage";
		} catch (MypageCountException e) {
			request.setAttribute("msg", "내 피자 카운트 조회 실패 ");
			return "common/errorPage";
		}
		
	}
	
	//내피자 상세보기 - 팝업
	@RequestMapping(value="myPageMyMenuPop.mp")
	public String mypizzaPopup(@RequestParam(value="mypizzaNo")int mypizzaNo, String mypizzaName, String mypizzaImgChangeName, Model model, HttpServletRequest request) {
		System.out.println("mypizzaNo :" + mypizzaNo);
		System.out.println("mypizzaName :" + mypizzaName);
		System.out.println("mypizzaImgChangeName :" + mypizzaImgChangeName);
		
		//내피자 상세보기 - 팝업
		try {
			Map<Integer, MypizzaPopup> hmap = mps.selectMypizzaPopup(mypizzaNo);
			TreeMap<Integer, MypizzaPopup> tmap = new TreeMap<>(hmap); 

			Iterator<Integer> i = tmap.keySet().iterator();
			
			int priceSum = 0;
			ArrayList<String> toppingList = new ArrayList<>();
			
			System.out.println("i는 뭐지 : " + i);
			
			while(i.hasNext()) {
				int k = i.next();
				MypizzaPopup v = tmap.get(k);
				
				System.out.println("key : " + k);
				System.out.println("value : " + v);
				System.out.println("길이는 과연....! : " + tmap.size());
				
				priceSum += v.getMaterialSellprice() * v.getMaterialCount();
				System.out.println("재료번호&키값 " + v.getMaterialNo());
				
				if(v.getMaterialNo() <= 14) {
					System.out.println("데헷 : "+v.getMaterialNameAndCount().substring(0, v.getMaterialNameAndCount().lastIndexOf("1")));
					toppingList.add(v.getMaterialNameAndCount().substring(0, v.getMaterialNameAndCount().lastIndexOf("1")));
				}else if(v.getMaterialNo() > 14) {
					System.out.println("흠 : "+v.getMaterialNameAndCount());
					toppingList.add(v.getMaterialNameAndCount());
				}
				
			}
			System.out.println("priceSum : " + priceSum);
			System.out.println("toppingList : " + toppingList);
			
			model.addAttribute("mypizzaNo",mypizzaNo);
			model.addAttribute("mypizzaName",mypizzaName);
			model.addAttribute("mypizzaImgChangeName",mypizzaImgChangeName);
			
			model.addAttribute("priceSum",priceSum);
			model.addAttribute("toppingList",toppingList);
			
			return "mypage/myMenuPopup";
			
		} catch (MypageListException e) {
			request.setAttribute("msg", "내피자 상세보기 실패");
			return "common/errorPage";
		}
	}
	
	
}
