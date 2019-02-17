package com.kh.pmfp.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.vo.AdminCoupon;
import com.kh.pmfp.common.model.vo.PageInfo;

public interface AdminCouponDao {
	
	//생성된 쿠폰 리스트 조회수
	int selectListCount(SqlSessionTemplate sqlSession, AdminCoupon coupon) throws AdminCountException;

	//생성된 쿠폰 목록 리스트
	ArrayList<AdminCoupon> selectSearchCouponList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminSelectException;

}
