package com.kh.pmfp.mypage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.customer.model.vo.MyPizza;
import com.kh.pmfp.mypage.model.dao.MypageDao;
import com.kh.pmfp.mypage.model.exception.MypageCountException;
import com.kh.pmfp.mypage.model.exception.MypageListException;
import com.kh.pmfp.mypage.model.vo.Coupon;
import com.kh.pmfp.mypage.model.vo.DelList;
import com.kh.pmfp.mypage.model.vo.Location;
import com.kh.pmfp.mypage.model.vo.MyWriting;
import com.kh.pmfp.mypage.model.vo.OrderDetail;
import com.kh.pmfp.mypage.model.vo.OrderList;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MypageDao md;
	

	//마이페이지 메인 - 주문내역
	@Override
	public ArrayList<OrderList> selectOrderList(int memberNo) throws MypageListException {
		ArrayList<OrderList> orderList = md.selectOrderList(sqlSession, memberNo);
		return orderList;
	}
	
	//사용쿠폰내역 카운트 조회
	@Override
	public int selectUseCouponList(int memberNo, int orderNo) throws MypageCountException {
		int result = md.selectUseCouponList(sqlSession, memberNo, orderNo);
		return result;
	}
	
	//쿠폰 사용내역 X - 상세보기
	@Override
	public ArrayList<OrderDetail> selectOrderDetailList(int orderNo) throws MypageListException{
		ArrayList<OrderDetail> orderDetailList = md.selectOrderDetailList(sqlSession, orderNo);
		return orderDetailList;
	}
	
	//쿠폰 사용내역 O - 상세보기
	@Override
	public ArrayList<OrderDetail> selectOrderDetailList2(int orderNo) throws MypageListException{
		ArrayList<OrderDetail> orderDetailList = md.selectOrderDetailList2(sqlSession, orderNo);
		return orderDetailList;
	}

	//배송지 내역
	@Override
	public ArrayList<DelList> selectDelList(int memberNo) throws MypageListException {
		ArrayList<DelList> delList = md.selectDelList(sqlSession, memberNo);
		return delList;
	}

	//쿠폰함 - 사용가능쿠폰
	@Override
	public ArrayList<Coupon> selectPCouponList(int memberNo) throws MypageListException{
		ArrayList<Coupon> pCouponList = md.selectPCouponList(sqlSession, memberNo) ;
		return pCouponList;
	}

	//쿠폰함 - 사용만료쿠폰
	@Override
	public ArrayList<Coupon> selectICouponList(int memberNo) throws MypageListException{
		ArrayList<Coupon> iCouponList = md.selectICouponList(sqlSession, memberNo);
		return iCouponList;
	}

	//내 작성글 - 문의
	@Override
	public ArrayList<MyWriting> selectMyWritingList(int memberNo, PageInfo pi) throws MypageListException {
		ArrayList<MyWriting> myWritingList = md.selectMyWritingList(sqlSession, memberNo, pi);
		return myWritingList;
	}

	//내 작성글 - 후기
	@Override
	public ArrayList<MyWriting> selectMyWritingReviewList(int memberNo, PageInfo pi) throws MypageListException{
		ArrayList<MyWriting> myWritingList = md.selectMyWritingReviewList(sqlSession, memberNo, pi);
		return myWritingList;
	}

	//내 작성글 - 공유
	@Override
	public ArrayList<MyWriting> selectMyWritingShareList(int memberNo, PageInfo pi) throws MypageListException{
		ArrayList<MyWriting> myWritingList = md.selectMyWritingShareList(sqlSession, memberNo, pi);
		return myWritingList;
	}
	
	//글 목록수 조회
	@Override
	public int selectListCount(int memberNo, int boardType) throws MypageCountException {
		int listCount = md.selectListCount(sqlSession, memberNo, boardType);
		return listCount;
	}

	//지점 전체의 위도/경도 얻기
	@Override
	public ArrayList<Location> selectComLocation() {
		ArrayList<Location> list = md.selectComLocation(sqlSession);
		return list;
	}

	//배송지 추가
	@Override
	public int insertUserDelAddr(int memberNo, int finalDeliveryLoc, String addr, String deliName) {
		int result = md.insertUserDelAddr(sqlSession, memberNo, finalDeliveryLoc, addr, deliName);
		return result;
	}

	//내피자
	@Override
	public ArrayList<MyPizza> selectMypizzaList(int memberNo, PageInfo pi) throws MypageListException {
		ArrayList<MyPizza> result = md.selectMypizzaList(sqlSession, memberNo, pi);
		return result;
	}

	//내피자 카운트
	@Override
	public int selectMypizzaCount(int memberNo) throws MypageCountException {
		return md.selectMypizzaCount(sqlSession, memberNo);
	}

	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
