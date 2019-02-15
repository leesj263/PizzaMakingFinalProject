package com.kh.pmfp.mypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.mypage.model.vo.Coupon;
import com.kh.pmfp.mypage.model.vo.DelList;
import com.kh.pmfp.mypage.model.vo.Location;
import com.kh.pmfp.mypage.model.vo.MyWriting;
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

	//내 작성글 - 문의
	@Override
	public ArrayList<MyWriting> selectMyWritingList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi) {
		ArrayList<MyWriting> myWritingList = null;
		
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		myWritingList = (ArrayList)sqlSession.selectList("Mypage.selectMyWritingList", memberNo, rowBounds);
		
		if(myWritingList==null) {
			System.out.println("예외처리 하기: 내 작성글 - 문의내역 조회 실패");
		}

		return myWritingList;
		
	}

	//내 작성글 - 후기
	@Override
	public ArrayList<MyWriting> selectMyWritingReviewList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi) {
		ArrayList<MyWriting> myWritingList = null;
		
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		myWritingList = (ArrayList)sqlSession.selectList("Mypage.selectMyWritingReviewList", memberNo, rowBounds);
		
		if(myWritingList==null) {
			System.out.println("예외처리 하기: 내 작성글 - 후기 조회 실패");
		}

		return myWritingList;
	}

	//내 작성글 - 공유
	@Override
	public ArrayList<MyWriting> selectMyWritingShareList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi) {
		ArrayList<MyWriting> myWritingList = null;
				
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		myWritingList = (ArrayList)sqlSession.selectList("Mypage.selectMyWritingShareList", memberNo, rowBounds);
		
		if(myWritingList==null) {
			System.out.println("예외처리 하기: 내 작성글 - 후기 조회 실패");
		}
		
		return myWritingList;
	}

	//글 목록수 조회
	@Override
	public int selectListCount(SqlSessionTemplate sqlSession, int memberNo, int boardType) {
		MyWriting mw = new MyWriting(memberNo, boardType);
		
		int listCount = sqlSession.selectOne("Mypage.selectListCount", mw);

		if(listCount <= 0) {
			System.out.println("글 목록수 조회 실패");
		}
		
		return listCount;
	}

	//지점 전체의 위도/경도 얻기
	@Override
	public ArrayList<Location> selectComLocation(SqlSessionTemplate sqlSession) {
		
		ArrayList<Location> list = (ArrayList) sqlSession.selectList("Mypage.selectComLoc");
		
		if(list == null) {
			System.out.println("매장 위도경도 조회 실패");
		}
		
		System.out.println("list : " + list);
		
		return list;
	}

	//배송지 추가
	@Override
	public int insertUserDelAddr(SqlSessionTemplate sqlSession, int memberNo, int finalDeliveryLoc, String addr,
			String deliName) {
		DelList del = new DelList(memberNo, finalDeliveryLoc, addr, deliName);

		return sqlSession.insert("Mypage.insertUserDelAddr", del);
	}

	

	
	
	
	
	
	
	
	
	
	
	
	
	

}
