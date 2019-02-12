package com.kh.pmfp.mypage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.mypage.model.vo.Coupon;
import com.kh.pmfp.mypage.model.vo.DelList;
import com.kh.pmfp.mypage.model.vo.MyWriting;
import com.kh.pmfp.mypage.model.vo.OrderList;

public interface MypageDao {

	//마이페이지 메인 - 주문내역
	ArrayList<OrderList> selectOrderList(SqlSessionTemplate sqlSession, int memberNo);

	//배송지 내역
	ArrayList<DelList> selectDelList(SqlSessionTemplate sqlSession, int memberNo);

	//쿠폰함 - 사용가능쿠폰
	ArrayList<Coupon> selectPCouponList(SqlSessionTemplate sqlSession, int memberNo);

	//쿠폰함 - 사용만료쿠폰
	ArrayList<Coupon> selectICouponList(SqlSessionTemplate sqlSession, int memberNo);

	//내 작성글 - 문의
	ArrayList<MyWriting> selectMyWritingList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi);

	//내 작성글 - 후기
	ArrayList<MyWriting> selectMyWritingReviewList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi);

	//내 작성글 - 공유
	ArrayList<MyWriting> selectMyWritingShareList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi);

	//글 목록수 조회
	int selectListCount(SqlSessionTemplate sqlSession, int memberNo, int boardType);



}
