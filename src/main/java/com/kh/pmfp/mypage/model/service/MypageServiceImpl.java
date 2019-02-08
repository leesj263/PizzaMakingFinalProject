package com.kh.pmfp.mypage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pmfp.common.model.vo.Member;
import com.kh.pmfp.mypage.model.dao.MypageDao;
import com.kh.pmfp.mypage.model.vo.OrderList;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MypageDao md;
	
	
	@Override
	public ArrayList<OrderList> selectOrderList(Member m) {
ArrayList<OrderList> orderList = md.selectOrderList(sqlSession,m);
		
		return orderList;
	}

}
