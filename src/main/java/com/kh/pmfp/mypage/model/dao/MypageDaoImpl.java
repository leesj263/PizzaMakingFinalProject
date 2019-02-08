package com.kh.pmfp.mypage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pmfp.common.model.vo.Member;
import com.kh.pmfp.mypage.model.vo.OrderList;

@Repository
public class MypageDaoImpl implements MypageDao{

	@Override
	public ArrayList<OrderList> selectOrderList(SqlSessionTemplate sqlSession, Member m) {
		ArrayList<OrderList> orderList = new ArrayList<OrderList>();
		
		orderList = (ArrayList)sqlSession.selectList("Mypage.selectOrderList", m);
		
		if(orderList==null) {
			System.out.println("예외처리 하기: 주문내역 조회 실패");
		}
		
		return orderList;
	}

	
	

}
