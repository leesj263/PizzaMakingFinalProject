package com.kh.pmfp.mypage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pmfp.mypage.model.vo.Coupon;
import com.kh.pmfp.mypage.model.vo.DelList;
import com.kh.pmfp.mypage.model.vo.OrderList;

@Repository
public class MypageDaoImpl implements MypageDao{

	//마이페이지 메인 - 주문내역
	@Override
	public ArrayList<OrderList> selectOrderList(SqlSessionTemplate sqlSession, int memberNo) {
		ArrayList<OrderList> orderList = new ArrayList<OrderList>();
		
		orderList = (ArrayList)sqlSession.selectList("Mypage.selectOrderList", memberNo);
		
		if(orderList==null) {
			System.out.println("예외처리 하기: 주문내역 조회 실패");
		}
		
		return orderList;
	}

	//배송지 내역
	@Override
	public ArrayList<DelList> selectDelList(SqlSessionTemplate sqlSession, int memberNo) {
		ArrayList<DelList> delList = (ArrayList)sqlSession.selectList("Mypage.selectDelList", memberNo);
		
		if(delList==null) {
			System.out.println("예외처리 하기: 배송지내역 조회 실패");
		}
		
		System.out.println("dao : " + delList);
		
		return delList;
	}

	//쿠폰함 - 사용가능쿠폰
	@Override
	public ArrayList<Coupon> selectPCouponList(SqlSessionTemplate sqlSession, int memberNo) {
		ArrayList<Coupon> pCouponList = (ArrayList)sqlSession.selectList("Mypage.selectPCouponList", memberNo);
		
		if(pCouponList==null) {
			System.out.println("예외처리 하기: 사용가능 쿠폰 조회 실패");
		}
		
		System.out.println("dao : " + pCouponList);
		
		return pCouponList;
	}

	//쿠폰함 - 사용만료쿠폰
	@Override
	public ArrayList<Coupon> selectICouponList(SqlSessionTemplate sqlSession, int memberNo) {
		ArrayList<Coupon> iCouponList = (ArrayList)sqlSession.selectList("Mypage.selectICouponList", memberNo);
		
		if(iCouponList==null) {
			System.out.println("예외처리 하기: 사용만료 쿠폰 조회 실패");
		}
		
		System.out.println("dao : " + iCouponList);
		
		return iCouponList;
	}

	
	

}
