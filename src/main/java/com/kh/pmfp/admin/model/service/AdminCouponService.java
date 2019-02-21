package com.kh.pmfp.admin.model.service;

import java.util.ArrayList;

import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.vo.AdminCoupon;
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

	
	

}
