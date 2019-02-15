package com.kh.pmfp.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pmfp.admin.model.dao.AdminCouponDao;

@Service
public class AdminCouponServiceImpl implements AdminCouponService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminCouponDao cd;
	
	
}
