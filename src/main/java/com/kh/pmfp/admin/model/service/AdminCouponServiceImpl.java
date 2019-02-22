package com.kh.pmfp.admin.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pmfp.admin.model.dao.AdminCouponDao;
import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.vo.AdminCoupon;
import com.kh.pmfp.admin.model.vo.AdminCoupon2;
import com.kh.pmfp.admin.model.vo.AdminCouponIssue;
import com.kh.pmfp.admin.model.vo.AdminCouponIssue2;
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

	//쿠폰 번호 검색
	@Override
	public ArrayList<AdminCoupon> selectListCouponCode(AdminCoupon coupon) {
		
		ArrayList<AdminCoupon> searchCouponCodeList = cd.selectListCouponCode(sqlSession,coupon);
		
		return searchCouponCodeList;
	}

	//쿠폰 이름검색 Count
	@Override
	public int selectcouponNameCount(AdminCoupon coupon) {
		
		int result = cd.selectcouponNameCount(sqlSession,coupon);
		
		return result;
	}

	//쿠폰 번호검색 Count
	@Override
	public int selectCouponCodeCount(AdminCoupon coupon) {
		
		return cd.selectCouponCodeCount(sqlSession,coupon);
	}

	//발급된 쿠폰 전체 목록 Count
	@Override
	public int selectIssuingCouponCount() {
		
		return cd.selectIssuingCouponCount(sqlSession);
	}

	//발급된 쿠폰 전체 목록 조회
	@Override
	public ArrayList<AdminCouponIssue> selectIssuingCouponAllList() {
		
		ArrayList<AdminCouponIssue> issuingCouponAllList = cd.selectIssuingCouponAllList(sqlSession);
		
		return issuingCouponAllList;
	}

	//발급쿠폰 검색-번호
	@Override
	public ArrayList<AdminCouponIssue2> selectIssuingCouponCode(AdminCouponIssue2 coupon) {
		
		ArrayList<AdminCouponIssue2> list = cd.selectIssuingCouponCode(sqlSession,coupon);
		
		return list;
	}

	//발급쿠폰 검색 -번호 Count
	@Override
	public int selectlssuingCouponCodeCount(AdminCouponIssue2 coupon) {
		
		return cd.selectlssuingCouponCodeCount(sqlSession,coupon);
	}
	
	//발급쿠폰 검색 -이름
	@Override
	public ArrayList<AdminCouponIssue2> selectIssuingCouponName(AdminCouponIssue2 coupon) {
		
		ArrayList<AdminCouponIssue2> list = cd.selectIssuingCouponName(sqlSession,coupon);
		return list;
	}

	//발급쿠폰 검색 -이름 Count
	@Override
	public int selectlssuingCouponCodeName(AdminCouponIssue2 coupon) {
		
		return cd.selectlssuingCouponCodeName(sqlSession,coupon);
	}

	//모든 쿠폰 불러오기
	@Override
	public ArrayList<AdminCoupon> selectAllCouponList() {
		
		ArrayList<AdminCoupon> list = cd.selectAllCouponList(sqlSession);
		
		return list;
	}
	
	
}
