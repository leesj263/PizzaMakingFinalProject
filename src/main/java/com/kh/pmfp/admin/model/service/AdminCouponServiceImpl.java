package com.kh.pmfp.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pmfp.admin.model.dao.AdminCouponDao;
import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.vo.AdminCoupon;
import com.kh.pmfp.common.model.vo.PageInfo;

@Service
public class AdminCouponServiceImpl implements AdminCouponService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminCouponDao cd;

	//생성된 쿠폰 리스트 조회수
	@Override
	public int selectListCount(AdminCoupon coupon) throws AdminCountException {
		
		int couponListCount = cd.selectListCount(sqlSession,coupon);
		
		return couponListCount;
	}

	//생성된 쿠폰 목록
	@Override
	public ArrayList<AdminCoupon> selectSearchCouponList(PageInfo pi) throws AdminSelectException {

		ArrayList<AdminCoupon> searchCouponList = cd.selectSearchCouponList(sqlSession,pi);
		
		return searchCouponList;
	}

	//쿠폰 생성하기
	@Override
	public int insertCreateCoupon(AdminCoupon couponCreate) {
		
		int result = cd.insertCreateCoupon(sqlSession,couponCreate);
		
		return result;
	}
	
	//쿠폰 이름 검색
	@Override
	public ArrayList<AdminCoupon> selectListCouponName(AdminCoupon coupon) {
		
		ArrayList<AdminCoupon> searchCouponNameList = cd.selectListCouponName(sqlSession,coupon);
		return searchCouponNameList;
	}
	
	
}
