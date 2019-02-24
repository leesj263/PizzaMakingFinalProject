package com.kh.pmfp.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.vo.AdminCoupon;
import com.kh.pmfp.admin.model.vo.AdminCoupon2;
import com.kh.pmfp.admin.model.vo.AdminCouponIssue;
import com.kh.pmfp.admin.model.vo.AdminCouponIssue2;
import com.kh.pmfp.common.model.vo.Member;
import com.kh.pmfp.common.model.vo.PageInfo;

@Repository
public class AdminCouponDaoImpl implements AdminCouponDao{

	@Override
	public int selectListCount(SqlSessionTemplate sqlSession, AdminCoupon coupon) throws AdminCountException {
		int listCount=-1;
		listCount = sqlSession.selectOne("Coupon.selectListCount",coupon);
		
		if(listCount<0) {
			throw new  AdminCountException("생성된 쿠폰  조회 수 실패"); 
		}
		
		return listCount;
	}

	//생성된 쿠폰 목록 리스트 조회
	@Override
	public ArrayList<AdminCoupon> selectSearchCouponList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminSelectException {
		ArrayList<AdminCoupon> searchCouponList = null;
		int offset = (pi.getCurrentPage()-1)*pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		searchCouponList = (ArrayList)sqlSession.selectList("Coupon.selectSearchCouponList",null,rowBounds);
		//System.out.println(searchCouponList);
		if(searchCouponList==null) {
			throw new AdminSelectException("생성된 쿠폰 조회 실패");
		}
		return searchCouponList;
	}

	//쿠폰 생성하기
	@Override
	public int insertCreateCoupon(SqlSessionTemplate sqlSession, AdminCoupon couponCreate) {
		
		return sqlSession.insert("Coupon.insertCreateCoupon",couponCreate);
	}

	//쿠폰 이름 검색하기
	@Override
	public ArrayList<AdminCoupon> selectListCouponName(SqlSessionTemplate sqlSession, AdminCoupon coupon) {
	
		return (ArrayList)sqlSession.selectList("Coupon.selectListCouponName",coupon);
	}

	//쿠폰 번호 검색하기
	@Override
	public ArrayList<AdminCoupon> selectListCouponCode(SqlSessionTemplate sqlSession, AdminCoupon coupon) {
		
		return (ArrayList)sqlSession.selectList("Coupon.selectListCouponCode",coupon);
	}

	//쿠폰 이름 검색 Count
	@Override
	public int selectcouponNameCount(SqlSessionTemplate sqlSession, AdminCoupon coupon) {
		
		return sqlSession.selectOne("Coupon.selectcouponNameCount",coupon);
	}

	//쿠폰 번호 검색 COUNT
	@Override
	public int selectCouponCodeCount(SqlSessionTemplate sqlSession, AdminCoupon coupon) {
		
		return sqlSession.selectOne("Coupon.selectCouponCodeCount",coupon);
	}

	//발급된 쿠폰 전체 목록 Count
	@Override
	public int selectIssuingCouponCount(SqlSessionTemplate sqlSession) {
	
		return sqlSession.selectOne("Coupon.selectIssuingCouponCount");
	}

	//발급된 쿠폰 전체 목록 조회
	@Override
	public ArrayList<AdminCouponIssue> selectIssuingCouponAllList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("Coupon.selectIssuingCouponAllList");
	}

	//발급 쿠폰 번호 검색
	@Override
	public ArrayList<AdminCouponIssue2> selectIssuingCouponCode(SqlSessionTemplate sqlSession, AdminCouponIssue2 coupon) {

		return (ArrayList)sqlSession.selectList("Coupon.selectIssuingCouponCode",coupon);
	}

	//발급 쿠폰 번호 Count
	@Override
	public int selectlssuingCouponCodeCount(SqlSessionTemplate sqlSession, AdminCouponIssue2 coupon) {
		
		return sqlSession.selectOne("Coupon.selectlssuingCouponCodeCount",coupon);
	}

	//발급쿠폰 검색 -이름 
	@Override
	public ArrayList<AdminCouponIssue2> selectIssuingCouponName(SqlSessionTemplate sqlSession,
			AdminCouponIssue2 coupon) {
		
		return (ArrayList)sqlSession.selectList("Coupon.selectIssuingCouponName",coupon);
	}

	//발급쿠폰 검색 -이름 Count
	@Override
	public int selectlssuingCouponCodeName(SqlSessionTemplate sqlSession, AdminCouponIssue2 coupon) {
		
		return sqlSession.selectOne("Coupon.selectlssuingCouponCodeName",coupon);
	}

	//쿠폰 발급하기-모든 쿠폰 불러오기
	@Override
	public ArrayList<AdminCoupon> selectAllCouponList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("Coupon.selectAllCouponList");
	}

	//쿠폰 발급하기-회원 아이디 조회
	@Override
	public Member memberIdSearch(SqlSessionTemplate sqlSession,String memberId) {
		
		return sqlSession.selectOne("Coupon.memberIdSearch",memberId);
	}

	//모든 회원 검색
	@Override
	public ArrayList<Member> selectAllMember(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("Coupon.SelectAllMember");
	}

	//모든 회원에게 쿠폰 등록
	@Override
	public int insertCouponIssuing(SqlSessionTemplate sqlSession,AdminCouponIssue coupon) {
	
		return sqlSession.insert("Coupon.insertCouponIssuing",coupon);
	}

	//쿠폰 내역 불러오기
	@Override
	public AdminCoupon selectCouponContent(SqlSessionTemplate sqlSession, String couponNo) {
		
		return sqlSession.selectOne("Coupon.selectCouponContent",couponNo);
	}

	//쿠폰 수정하기
	@Override
	public int updateCoupon(SqlSessionTemplate sqlSession, AdminCoupon coupon) {

		return sqlSession.update("Coupon.updateCoupon",coupon);
	}


}
