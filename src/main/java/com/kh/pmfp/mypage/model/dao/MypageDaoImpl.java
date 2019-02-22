package com.kh.pmfp.mypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.TreeMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.customer.model.vo.MyPizza;
import com.kh.pmfp.mypage.model.exception.MypageCountException;
import com.kh.pmfp.mypage.model.exception.MypageInsertException;
import com.kh.pmfp.mypage.model.exception.MypageListException;
import com.kh.pmfp.mypage.model.vo.Coupon;
import com.kh.pmfp.mypage.model.vo.DelList;
import com.kh.pmfp.mypage.model.vo.Location;
import com.kh.pmfp.mypage.model.vo.MyWriting;
import com.kh.pmfp.mypage.model.vo.MypizzaPopup;
import com.kh.pmfp.mypage.model.vo.OrderDetail;
import com.kh.pmfp.mypage.model.vo.OrderList;

@Repository
public class MypageDaoImpl implements MypageDao{

	//마이페이지 메인 - 주문내역
	@Override
	public ArrayList<OrderList> selectOrderList(SqlSessionTemplate sqlSession, int memberNo) throws MypageListException{
		ArrayList<OrderList> orderList = new ArrayList<OrderList>();
		
		orderList = (ArrayList)sqlSession.selectList("Mypage.selectOrderList", memberNo);

		return orderList;
	}
	
	//사용쿠폰내역 카운트 조회
	@Override
	public int selectUseCouponList(SqlSessionTemplate sqlSession, int memberNo, int orderNo) throws MypageCountException{
		OrderDetail od = new OrderDetail(orderNo, memberNo);
		int result = sqlSession.selectOne("Mypage.selectUseCouponList", od);
		return result;
	}
	
	//쿠폰 사용내역 X - 상세보기
	@Override
	public ArrayList<OrderDetail> selectOrderDetailList(SqlSessionTemplate sqlSession, int orderNo) throws MypageListException{
		ArrayList<OrderDetail> orderDetailList = (ArrayList)sqlSession.selectList("Mypage.selectOrderDetailList", orderNo);
		System.out.println("주문 상세정보 dao1 : " + orderDetailList);
		return orderDetailList;
	}
	
	//쿠폰 사용내역 O - 상세보기
	@Override
	public ArrayList<OrderDetail> selectOrderDetailList2(SqlSessionTemplate sqlSession, int orderNo) throws MypageListException{
		ArrayList<OrderDetail> orderDetailList = (ArrayList)sqlSession.selectList("Mypage.selectOrderDetailList2", orderNo);
		System.out.println("주문 상세정보 dao2 : " + orderDetailList);
		return orderDetailList;
	}

	//배송지 내역
	@Override
	public ArrayList<DelList> selectDelList(SqlSessionTemplate sqlSession, int memberNo) throws MypageListException{
		ArrayList<DelList> delList = (ArrayList)sqlSession.selectList("Mypage.selectDelList", memberNo);
		
		System.out.println("dao : " + delList);
		
		return delList;
	}

	//쿠폰함 - 사용가능쿠폰
	@Override
	public ArrayList<Coupon> selectPCouponList(SqlSessionTemplate sqlSession, int memberNo) throws MypageListException{
		ArrayList<Coupon> pCouponList = (ArrayList)sqlSession.selectList("Mypage.selectPCouponList", memberNo);
		
		System.out.println("dao : " + pCouponList);
		
		return pCouponList;
	}

	//쿠폰함 - 사용만료쿠폰
	@Override
	public ArrayList<Coupon> selectICouponList(SqlSessionTemplate sqlSession, int memberNo) throws MypageListException{
		ArrayList<Coupon> iCouponList = (ArrayList)sqlSession.selectList("Mypage.selectICouponList", memberNo);
		
		System.out.println("dao : " + iCouponList);
		
		return iCouponList;
	}

	//내 작성글 - 문의
	@Override
	public ArrayList<MyWriting> selectMyWritingList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi) throws MypageListException{
		ArrayList<MyWriting> myWritingList = null;
		
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		myWritingList = (ArrayList)sqlSession.selectList("Mypage.selectMyWritingList", memberNo, rowBounds);
		
		return myWritingList;
		
	}

	//내 작성글 - 후기
	@Override
	public ArrayList<MyWriting> selectMyWritingReviewList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi) throws MypageListException{
		ArrayList<MyWriting> myWritingList = null;
		
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		myWritingList = (ArrayList)sqlSession.selectList("Mypage.selectMyWritingReviewList", memberNo, rowBounds);
		System.out.println("selectMyWritingReviewList : " + myWritingList);

		return myWritingList;
	}

	//내 작성글 - 공유
	@Override
	public ArrayList<MyWriting> selectMyWritingShareList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi) throws MypageListException{
		ArrayList<MyWriting> myWritingList = null;
				
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		myWritingList = (ArrayList)sqlSession.selectList("Mypage.selectMyWritingShareList", memberNo, rowBounds);
		System.out.println("selectMyWritingShareList : " + myWritingList);
		
		return myWritingList;
	}

	//글 목록수 조회
	@Override
	public int selectListCount(SqlSessionTemplate sqlSession, int memberNo, int boardType) throws MypageCountException{
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
	public int insertUserDelAddr(SqlSessionTemplate sqlSession, int memberNo, int finalDeliveryLoc, String addr, String deliName) throws MypageInsertException{
		DelList del = new DelList(memberNo, finalDeliveryLoc, addr, deliName);

		return sqlSession.insert("Mypage.insertUserDelAddr", del);
	}

	//내피자
	@Override
	public ArrayList<MyPizza> selectMypizzaList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi) throws MypageListException{
		System.out.println("memberNo : " + memberNo);
		
		int offset = (pi.getCurrentPage() -1)*pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<MyPizza> list = (ArrayList)sqlSession.selectList("Mypage.selectMypizza", memberNo, rowBounds);
		
		System.out.println("내 피자 dao : " + list);
		
		return list;
	}

	//내피자 카운트
	@Override
	public int selectMypizzaCount(SqlSessionTemplate sqlSession, int memberNo) throws MypageCountException {
		return sqlSession.selectOne("Mypage.selectMypizzaCount", memberNo);
	}

	//내피자 상세보기 - 팝업
	@Override
	public HashMap<Integer, MypizzaPopup> selectMypizzaPopup(SqlSessionTemplate sqlSession, int mypizzaNo) throws MypageListException{
		HashMap<Integer, MypizzaPopup> hmap = (HashMap)sqlSession.selectMap("Mypage.selectMypizzaPopup", mypizzaNo, "materialNo");

		System.out.println("hamp : " + hmap);
		
		return hmap;
	}
	

	

	

	
	
	
	
	
	
	
	
	
	
	
	
	

}
