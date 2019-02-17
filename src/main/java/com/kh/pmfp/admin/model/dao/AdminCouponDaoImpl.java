package com.kh.pmfp.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.vo.AdminCoupon;
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
		System.out.println(searchCouponList);
		if(searchCouponList==null) {
			throw new AdminSelectException("생성된 쿠폰 조회 실패");
		}
		return searchCouponList;
	}

}
