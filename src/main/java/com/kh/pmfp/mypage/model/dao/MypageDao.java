package com.kh.pmfp.mypage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.customer.model.vo.MyPizza;
import com.kh.pmfp.mypage.model.exception.MypageCountException;
import com.kh.pmfp.mypage.model.exception.MypageListException;
import com.kh.pmfp.mypage.model.vo.Coupon;
import com.kh.pmfp.mypage.model.vo.DelList;
import com.kh.pmfp.mypage.model.vo.Location;
import com.kh.pmfp.mypage.model.vo.MyWriting;
import com.kh.pmfp.mypage.model.vo.OrderDetail;
import com.kh.pmfp.mypage.model.vo.OrderList;

public interface MypageDao {

	//마이페이지 메인 - 주문내역
	ArrayList<OrderList> selectOrderList(SqlSessionTemplate sqlSession, int memberNo) throws MypageListException;
	
	//사용쿠폰내역 카운트 조회
	int selectUseCouponList(SqlSessionTemplate sqlSession, int memberNo, int orderNo) throws MypageCountException;
	
	//쿠폰 사용내역 X - 상세보기
	ArrayList<OrderDetail> selectOrderDetailList(SqlSessionTemplate sqlSession, int orderNo) throws MypageListException;
	
	//쿠폰 사용내역 O - 상세보기
	ArrayList<OrderDetail> selectOrderDetailList2(SqlSessionTemplate sqlSession, int orderNo) throws MypageListException;

	//배송지 내역
	ArrayList<DelList> selectDelList(SqlSessionTemplate sqlSession, int memberNo) throws MypageListException;

	//쿠폰함 - 사용가능쿠폰
	ArrayList<Coupon> selectPCouponList(SqlSessionTemplate sqlSession, int memberNo) throws MypageListException;

	//쿠폰함 - 사용만료쿠폰
	ArrayList<Coupon> selectICouponList(SqlSessionTemplate sqlSession, int memberNo) throws MypageListException;

	//내 작성글 - 문의
	ArrayList<MyWriting> selectMyWritingList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi) throws MypageListException;

	//내 작성글 - 후기
	ArrayList<MyWriting> selectMyWritingReviewList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi) throws MypageListException;

	//내 작성글 - 공유
	ArrayList<MyWriting> selectMyWritingShareList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi) throws MypageListException;

	//글 목록수 조회
	int selectListCount(SqlSessionTemplate sqlSession, int memberNo, int boardType) throws MypageCountException;

	//지점 전체의 위도/경도 얻기
	ArrayList<Location> selectComLocation(SqlSessionTemplate sqlSession);

	//배송지 추가
	int insertUserDelAddr(SqlSessionTemplate sqlSession, int memberNo, int finalDeliveryLoc, String addr,
			String deliName);

	//내피자
	ArrayList<MyPizza> selectMypizzaList(SqlSessionTemplate sqlSession, int memberNo,PageInfo pi) throws MypageListException;

	//내피자 카운트
	int selectMypizzaCount(SqlSessionTemplate sqlSession, int memberNo) throws MypageCountException;

	
	


}
