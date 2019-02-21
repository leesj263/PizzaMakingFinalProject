package com.kh.pmfp.admin.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.service.AdminCouponService;
import com.kh.pmfp.admin.model.vo.AdminCoupon;
import com.kh.pmfp.admin.model.vo.AdminCoupon2;
import com.kh.pmfp.admin.model.vo.AdminCouponIssue;
import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.common.model.vo.Pagination;

@Controller
public class AdminCouponController {
	
	@Autowired
	private AdminCouponService cs;
	
	//쿠폰 생성하기
	@RequestMapping("newCouponCreate.co")
	public String newCouponCreate(AdminCoupon2 coupon,HttpServletRequest request, HttpServletResponse response) {
		//System.out.println(coupon);
		AdminCoupon couponCreate = new AdminCoupon();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONDAY, Integer.parseInt(coupon.getCouponEdateStr()));		
		Date date = new Date(cal.getTimeInMillis());
		
		//System.out.println("오늘 날짜 : "+sdf.format(cal.getTime()));
		//System.out.println("오늘 부터 한달 후 "+sdf.format(cal.getTime()));
		//System.out.println("이건 뭐징"+date);
		
		if(coupon.getCouponCategStr().equals("0")) {
			couponCreate.setCouponRdiscount((double)Integer.parseInt(coupon.getCouponRdiscountStr())/100.0);
			//System.out.println("할인율"+coupon.getCouponRdiscountStr());
		}else if(coupon.getCouponCategStr().equals("1")){
			couponCreate.setCouponPdiscount(Integer.parseInt(coupon.getCouponPdiscountStr()));
			//System.out.println("할인금액"+coupon.getCouponPdiscountStr());
		}
		couponCreate.setCouponName(coupon.getCouponName());
		couponCreate.setCouponCondition(Integer.parseInt(coupon.getCouponConditionStr()));
		couponCreate.setCouponCateg(Integer.parseInt(coupon.getCouponCategStr()));
		couponCreate.setCouponCondition(Integer.parseInt(coupon.getCouponConditionStr()));
		couponCreate.setCouponEdate(date);		
		//System.out.println(couponCreate);
		
		int result = cs.insertCreateCoupon(couponCreate);

		if(result>0	) {
			return "redirect:searchCoupon.co";			
		}else {
			return "common/errorPage";
		}
		
	}
	
	
	//생성된 쿠폰 목록 전체 조회
		@RequestMapping("searchCoupon.co")
		public String searchCoupon(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, HttpServletRequest request, HttpServletResponse response) throws AdminCountException {
			
			ArrayList<AdminCoupon> searchCouponList = new ArrayList<>();
			AdminCoupon coupon = new AdminCoupon();
			int couponListCount = cs.selectListCount(coupon);
			
			//System.out.println("전체 게시글 수"+couponListCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, couponListCount);
			
			//생성된 쿠폰 목록
			try {
				searchCouponList = cs.selectSearchCouponList(pi);
				//System.out.println("생성된 쿠폰 목록 :(controller) "+searchCouponList);
				request.setAttribute("searchCouponList", searchCouponList);
				request.setAttribute("pi", pi);
				return "admin/coupon/searchCoupon";
			} catch (AdminSelectException e) {
				request.setAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
			
			//return null;
		}
		
	//발급된 쿠폰 목록 전체 조회
		@RequestMapping("lssuingCouponManageMent.co")
		public String lssuingCoupon(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage,HttpServletRequest request,
				HttpServletResponse response) {
			
			ArrayList<AdminCouponIssue> issuingCouponAllList = new ArrayList<>();
			
			int issuingCouponCount = cs.selectIssuingCouponCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, issuingCouponCount);
			System.out.println(issuingCouponCount);
			System.out.println(pi);
			
			issuingCouponAllList=cs.selectIssuingCouponAllList();
			request.setAttribute("issuingCouponAllList", issuingCouponAllList);
			request.setAttribute("pi", pi);
			System.out.println(issuingCouponAllList);
			return "admin/coupon/lssuingCouponManageMent";
		}
	
	//생성된 쿠폰 검색(이름, 내용)
	@RequestMapping("searchTwoCoupon.co")
	public String searchTwoCoupon(@RequestParam(value="currentPage",required=false,defaultValue="1")int currentPage,HttpServletRequest request,
						 HttpServletResponse response,@RequestParam String searchType,@RequestParam String searchContent) {
		System.out.println(searchType);
		System.out.println(searchContent);
		
		//searchType,searchContent 를 담아서 arrayList에 담아오기
		if(searchType.equals("1")) {	//1일때 쿠폰 내용 검색
			//System.out.println("1 여기루 오닝");
			ArrayList<AdminCoupon> searchCouponNameList = new ArrayList<>();
			AdminCoupon coupon = new AdminCoupon();
			coupon.setCouponName(searchContent);
			searchCouponNameList = cs.selectListCouponName(coupon);
			
			//페이징 숫자 받아오기
			int couponNameCount = cs.selectcouponNameCount(coupon);
			PageInfo pi = Pagination.getPageInfo(currentPage, couponNameCount);
			
			//System.out.println(searchCouponNameList);
			//System.out.println(pi);
			
			request.setAttribute("searchCouponListAll", searchCouponNameList);
			request.setAttribute("pi", pi);
			request.setAttribute("searchContent", searchContent);
			request.setAttribute("searchType", searchType);
			return "admin/coupon/searchCoupon2";
			
			
			
		}else if(searchType.equals("0")) {	//0일때 쿠폰 번호 검색
			//System.out.println("2 여기루 오닝");
			ArrayList<AdminCoupon> searchCouponCodeList = new ArrayList<>();
			AdminCoupon coupon = new AdminCoupon();
			coupon.setCouponNo(Integer.parseInt(searchContent));
			searchCouponCodeList = cs.selectListCouponCode(coupon);
			
			int couponCodeCount = cs.selectCouponCodeCount(coupon);
			PageInfo pi = Pagination.getPageInfo(currentPage, couponCodeCount);
			
			request.setAttribute("searchCouponListAll", searchCouponCodeList);
			request.setAttribute("pi", pi);
			request.setAttribute("searchContent", searchContent);
			request.setAttribute("searchType", searchType);
			
			System.out.println(searchCouponCodeList);
			return "admin/coupon/searchCoupon2";
			
			
		}
		
		return "common/errorPage";
	}

	

}