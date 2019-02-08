package com.kh.pmfp.company.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.company.model.exception.FailInsertEmployeeInfo;
import com.kh.pmfp.company.model.exception.FailSelectAdminMessage;
import com.kh.pmfp.company.model.exception.FailSelectCompanyReview;
import com.kh.pmfp.company.model.exception.FailSelectDeliveryMan;
import com.kh.pmfp.company.model.exception.FailSelectEmployeeList;
import com.kh.pmfp.company.model.exception.FailSelectOrder;
import com.kh.pmfp.company.model.exception.FailUpdateDelivery;
import com.kh.pmfp.company.model.exception.FailUpdateEmployeeInfo;
import com.kh.pmfp.company.model.exception.FailUpdateOrderStatus;
import com.kh.pmfp.company.model.exception.FaileDetailMessage;
import com.kh.pmfp.company.model.vo.CompanyBoard;
import com.kh.pmfp.company.model.vo.CompanyEmployee;
import com.kh.pmfp.company.model.vo.CompanyOrder;


public interface CompanyDao {

	ArrayList<CompanyBoard> selectAdminMessage(SqlSessionTemplate sqlSession) throws FailSelectAdminMessage;

	CompanyBoard detailAdminMessage(SqlSessionTemplate sqlSession, int boardNo) throws FaileDetailMessage;

	ArrayList<CompanyOrder> orderWaiting(SqlSessionTemplate sqlSession) throws FailSelectOrder;

	ArrayList<CompanyOrder> orderMaking(SqlSessionTemplate sqlSession) throws FailSelectOrder;

	ArrayList<CompanyOrder> orderDelivering(SqlSessionTemplate sqlSession) throws FailSelectOrder;

	ArrayList<CompanyOrder> orderComplete(SqlSessionTemplate sqlSession) throws FailSelectOrder;

	int acceptOrder(SqlSessionTemplate sqlSession, int orderNoInt) throws FailUpdateOrderStatus;

	int refuseOrder(SqlSessionTemplate sqlSession, int orderNoInt) throws FailUpdateOrderStatus;

	ArrayList<CompanyOrder> orderRefuseList(SqlSessionTemplate sqlSession) throws FailSelectOrder;

	ArrayList<CompanyEmployee> remainDeliveryMan(SqlSessionTemplate sqlSession, int comNo) throws FailSelectDeliveryMan;

	int deliveryManUpdateM(SqlSessionTemplate sqlSession, int orderNoInt, int empNoInt) throws FailUpdateDelivery;

	int orderUpdateM(SqlSessionTemplate sqlSession, int orderNoInt) throws FailUpdateOrderStatus;

	int orderUpdateToComplete(SqlSessionTemplate sqlSession, int orderNoInt) throws FailUpdateOrderStatus;

	int orderUpdateToDelete(SqlSessionTemplate sqlSession, int orderNoInt) throws FailUpdateOrderStatus;

	int refuseListDelete(SqlSessionTemplate sqlSession, int orderNoInt) throws FailUpdateOrderStatus;

	ArrayList<CompanyEmployee> selectEmployeeList(SqlSessionTemplate sqlSession, int comNo) throws FailSelectEmployeeList;

	int inputEmployeeInfo(SqlSessionTemplate sqlSession, CompanyEmployee ce) throws FailInsertEmployeeInfo;

	int deleteEmployeeInfo(SqlSessionTemplate sqlSession, ArrayList<Integer> list) throws FailUpdateEmployeeInfo;

	ArrayList<CompanyBoard> selectCompanyReview(SqlSessionTemplate sqlSession, int comNo) throws FailSelectCompanyReview;

}
