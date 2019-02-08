package com.kh.pmfp.mypage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.common.model.vo.Member;
import com.kh.pmfp.mypage.model.vo.OrderList;

public interface MypageDao {

	ArrayList<OrderList> selectOrderList(SqlSessionTemplate sqlSession, Member m);


}
