package com.kh.pmfp.admin.controller;

import java.util.ArrayList;

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
import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.common.model.vo.Pagination;

@Controller
public class AdminCouponController {
	
	@Autowired
	private AdminCouponService cs;
	

	
	@RequestMapping("searchCoupon.co")
	public String searchCoupon(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, HttpServletRequest request, HttpServletResponse response) throws AdminCountException {
		
		ArrayList<AdminCoupon> searchCouponList = new ArrayList<>();
		AdminCoupon coupon = new AdminCoupon();
		int couponListCount = cs.selectListCount(coupon);
		
		System.out.println("전체 게시글 수"+couponListCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, couponListCount);
		
		//생성된 쿠폰 목록
		try {
			searchCouponList = cs.selectSearchCouponList(pi);
			System.out.println("생성된 쿠폰 목록 :(controller) "+searchCouponList);
			request.setAttribute("searchCouponList", searchCouponList);
			request.setAttribute("pi", pi);
			return "admin/coupon/searchCoupon";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
		//return null;
	}
	

}