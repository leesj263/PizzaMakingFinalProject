package com.kh.pmfp.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.vo.AdminCoupon;
import com.kh.pmfp.admin.model.vo.AdminCoupon2;
import com.kh.pmfp.admin.model.vo.AdminCouponIssue;
import com.kh.pmfp.admin.model.vo.AdminCouponIssue2;
import com.kh.pmfp.common.model.vo.PageInfo;

public interface AdminCouponDao {
	
	//생성된 쿠폰 리스트 조회수
	int selectListCount(SqlSessionTemplate sqlSession, AdminCoupon coupon) throws AdminCountException;

	//생성된 쿠폰 목록 리스트
	ArrayList<AdminCoupon> selectSearchCouponList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminSelectException;

	//쿠폰 생성하기
	int insertCreateCoupon(SqlSessionTemplate sqlSession, AdminCoupon couponCreate);

	//쿠폰 이름 검색하기
	ArrayList<AdminCoupon> selectListCouponName(SqlSessionTemplate sqlSession, AdminCoupon coupon);

	//쿠폰 번호 검색하기
	ArrayList<AdminCoupon> selectListCouponCode(SqlSessionTemplate sqlSession, AdminCoupon coupon);

	//쿠폰 이름 검색 Count
	int selectcouponNameCount(SqlSessionTemplate sqlSession, AdminCoupon coupon);

	//쿠폰 번호 검색 Count
	int selectCouponCodeCount(SqlSessionTemplate sqlSession, AdminCoupon coupon);

	//발급된 쿠폰 전체 목록 Count
	int selectIssuingCouponCount(SqlSessionTemplate sqlSession);

	//발급된 쿠폰 전체 목록 조회
	ArrayList<AdminCouponIssue> selectIssuingCouponAllList(SqlSessionTemplate sqlSession);

	//발급 쿠폰 검색-번호
	ArrayList<AdminCouponIssue2> selectIssuingCouponCode(SqlSessionTemplate sqlSession, AdminCouponIssue2 coupon);

	//발급쿠폰 검색-Count
	int selectlssuingCouponCodeCount(SqlSessionTemplate sqlSession, AdminCouponIssue2 coupon);

	//발급쿠폰 검색 -이름 
	ArrayList<AdminCouponIssue2> selectIssuingCouponName(SqlSessionTemplate sqlSession, AdminCouponIssue2 coupon);

	//발급쿠폰 검색 -이름 Count
	int selectlssuingCouponCodeName(SqlSessionTemplate sqlSession, AdminCouponIssue2 coupon);

	//모든 쿠폰 불러오기
	ArrayList<AdminCoupon> selectAllCouponList(SqlSessionTemplate sqlSession);

}
