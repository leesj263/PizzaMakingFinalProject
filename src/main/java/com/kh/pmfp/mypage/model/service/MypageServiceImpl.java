package com.kh.pmfp.mypage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pmfp.mypage.model.dao.MypageDao;
import com.kh.pmfp.mypage.model.vo.Coupon;
import com.kh.pmfp.mypage.model.vo.DelList;
import com.kh.pmfp.mypage.model.vo.OrderList;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MypageDao md;
	

	//마이페이지 메인 - 주문내역
	@Override
	public ArrayList<OrderList> selectOrderList(int memberNo) {
		ArrayList<OrderList> orderList = md.selectOrderList(sqlSession, memberNo);
		return orderList;
	}

	//배송지 내역
	@Override
	public ArrayList<DelList> selectDelList(int memberNo) {
		ArrayList<DelList> delList = md.selectDelList(sqlSession, memberNo);
		return delList;
	}

	//쿠폰함 - 사용가능쿠폰
	@Override
	public ArrayList<Coupon> selectPCouponList(int memberNo) {
		ArrayList<Coupon> pCouponList = md.selectPCouponList(sqlSession, memberNo);
		return pCouponList;
	}

	//쿠폰함 - 사용만료쿠폰
	@Override
	public ArrayList<Coupon> selectICouponList(int memberNo) {
		ArrayList<Coupon> iCouponList = md.selectICouponList(sqlSession, memberNo);
		return iCouponList;
	}

	
	
	
	
	
	
	
	
	
	
}
