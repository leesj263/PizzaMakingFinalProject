package com.kh.pmfp.company.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.company.model.exception.FailSelectAdminMessage;
import com.kh.pmfp.company.model.exception.FailSelectOrder;
import com.kh.pmfp.company.model.exception.FaileDetailMessage;
import com.kh.pmfp.company.model.vo.CompanyBoard;
import com.kh.pmfp.company.model.vo.CompanyOrder;


public interface CompanyDao {

	ArrayList<CompanyBoard> selectAdminMessage(SqlSessionTemplate sqlSession) throws FailSelectAdminMessage;

	CompanyBoard detailAdminMessage(SqlSessionTemplate sqlSession, int boardNo) throws FaileDetailMessage;

	ArrayList<CompanyOrder> orderWaiting(SqlSessionTemplate sqlSession) throws FailSelectOrder;

	ArrayList<CompanyOrder> orderMaking(SqlSessionTemplate sqlSession) throws FailSelectOrder;

	ArrayList<CompanyOrder> orderDelivering(SqlSessionTemplate sqlSession) throws FailSelectOrder;

	ArrayList<CompanyOrder> orderComplete(SqlSessionTemplate sqlSession) throws FailSelectOrder;

}
