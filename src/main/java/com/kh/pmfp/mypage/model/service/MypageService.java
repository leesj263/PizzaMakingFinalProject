package com.kh.pmfp.mypage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.customer.model.vo.MyPizza;
import com.kh.pmfp.mypage.model.vo.Coupon;
import com.kh.pmfp.mypage.model.vo.DelList;
import com.kh.pmfp.mypage.model.vo.Location;
import com.kh.pmfp.mypage.model.vo.MyWriting;
import com.kh.pmfp.mypage.model.vo.OrderDetail;
import com.kh.pmfp.mypage.model.vo.OrderList;

public interface MypageService {

	//마이페이지 메인 - 주문내역
	ArrayList<OrderList> selectOrderList(int memberNo);
	
	//사용쿠폰내역 카운트 조회
	int selectUseCouponList(int memberNo, int orderNo);
	
	//쿠폰 사용내역 X - 상세보기
	ArrayList<OrderDetail> selectOrderDetailList(int orderNo);
	
	//쿠폰 사용내역 O - 상세보기
	ArrayList<OrderDetail> selectOrderDetailList2(int orderNo);

	//배송지 내역
	ArrayList<DelList> selectDelList(int memberNo);

	//쿠폰함 - 사용가능쿠폰
	ArrayList<Coupon> selectPCouponList(int memberNo);

	//쿠폰함 - 사용만료쿠폰
	ArrayList<Coupon> selectICouponList(int memberNo);

	//내 작성글 - 문의
	ArrayList<MyWriting> selectMyWritingList(int memberNo, PageInfo pi);

	//내 작성글 - 후기
	ArrayList<MyWriting> selectMyWritingReviewList(int memberNo, PageInfo pi);

	//내 작성글 - 공유
	ArrayList<MyWriting> selectMyWritingShareList(int memberNo, PageInfo pi);
	
	//글 목록수 조회
	int selectListCount(int memberNo, int boardType);

	//지점 전체의 위도/경도 얻기
	ArrayList<Location> selectComLocation();

	//배송지 추가
	int insertUserDelAddr(int memberNo, int finalDeliveryLoc, String addr, String deliName);

	//내피자
	ArrayList<MyPizza> selectMypizzaList(int memberNo);

	
	
	

}
