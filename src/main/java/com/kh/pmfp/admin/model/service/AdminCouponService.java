package com.kh.pmfp.admin.model.service;

import java.util.ArrayList;

import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.vo.AdminCoupon;
import com.kh.pmfp.admin.model.vo.AdminCoupon2;
import com.kh.pmfp.admin.model.vo.AdminCouponIssue;
import com.kh.pmfp.admin.model.vo.AdminCouponIssue2;
import com.kh.pmfp.common.model.vo.PageInfo;

public interface AdminCouponService {

	//생성된 쿠폰 리스트 조회수
	int selectListCount(AdminCoupon coupon)throws AdminCountException;

	//생성된 쿠폰 목록
	ArrayList<AdminCoupon> selectSearchCouponList(PageInfo pi) throws AdminSelectException;

	//쿠폰 생성하기
	int insertCreateCoupon(AdminCoupon couponCreate);

	//쿠폰 이름으로 검색하고 가져오기
	ArrayList<AdminCoupon> selectListCouponName(AdminCoupon coupon);

	//쿠폰 번호로 검색하고 가져오기
	ArrayList<AdminCoupon> selectListCouponCode(AdminCoupon coupon);

	//쿠폰 이름 검색 Count
	int selectcouponNameCount(AdminCoupon coupon);

	//쿠폰 번호 검색 Count
	int selectCouponCodeCount(AdminCoupon coupon);

	//발급된 쿠폰 전체 목록 Count
	int selectIssuingCouponCount();

	//발급된 쿠폰 전체 목록 조회
	ArrayList<AdminCouponIssue> selectIssuingCouponAllList();

	//발급쿠폰 번호 검색
	ArrayList<AdminCouponIssue2> selectIssuingCouponCode(AdminCouponIssue2 coupon);

	//발급쿠폰 검색-번호 Count
	int selectlssuingCouponCodeCount(AdminCouponIssue2 coupon);

	//발급쿠폰 검색-이름 
	ArrayList<AdminCouponIssue2> selectIssuingCouponName(AdminCouponIssue2 coupon);
	
	//발급쿠폰 검색-이름 Count
	int selectlssuingCouponCodeName(AdminCouponIssue2 coupon);

	//모든 쿠폰 조회해오기
	ArrayList<AdminCoupon> selectAllCouponList();

	
	

}
