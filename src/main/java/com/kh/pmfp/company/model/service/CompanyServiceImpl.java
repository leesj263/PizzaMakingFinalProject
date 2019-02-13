package com.kh.pmfp.company.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.pmfp.company.model.dao.CompanyDao;
import com.kh.pmfp.company.model.exception.FailInsertEmployeeInfo;
import com.kh.pmfp.company.model.exception.FailInsertOrderStock;
import com.kh.pmfp.company.model.exception.FailSelectAdminMessage;
import com.kh.pmfp.company.model.exception.FailSelectCompanyReview;
import com.kh.pmfp.company.model.exception.FailSelectCompanySales;
import com.kh.pmfp.company.model.exception.FailSelectDeliveryMan;
import com.kh.pmfp.company.model.exception.FailSelectEmployeeList;
import com.kh.pmfp.company.model.exception.FailSelectOrder;
import com.kh.pmfp.company.model.exception.FailSelectOrderStock;
import com.kh.pmfp.company.model.exception.FailUpdateDelivery;
import com.kh.pmfp.company.model.exception.FailUpdateEmployeeInfo;
import com.kh.pmfp.company.model.exception.FailUpdateOrderStatus;
import com.kh.pmfp.company.model.exception.FaileDetailMessage;
import com.kh.pmfp.company.model.vo.CompanyBoard;
import com.kh.pmfp.company.model.vo.CompanyEmployee;
import com.kh.pmfp.company.model.vo.CompanyMaterial;
import com.kh.pmfp.company.model.vo.CompanyOrder;
import com.kh.pmfp.company.model.vo.CompanyOrderStock;
import com.kh.pmfp.company.model.vo.CompanyRemainMaterial;
import com.kh.pmfp.company.model.vo.CompanySales;

@Component
public class CompanyServiceImpl implements CompanyService{

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CompanyDao cd;
	
	@Override
	public ArrayList<CompanyBoard> selectAdminMessage() throws FailSelectAdminMessage {
		// TODO Auto-generated method stub
		ArrayList<CompanyBoard> adminMessage = new ArrayList<CompanyBoard>();
		adminMessage = cd.selectAdminMessage(sqlSession);
		
		
		return adminMessage;
	}

	@Override
	public CompanyBoard detailAdminMessage(int boardNo) throws FaileDetailMessage {
		// TODO Auto-generated method stub
		CompanyBoard detailMessage = cd.detailAdminMessage(sqlSession,boardNo);
		
		return detailMessage;
	}

	@Override
	public ArrayList<CompanyOrder> orderWaiting() throws FailSelectOrder {
		// TODO Auto-generated method stub
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = cd.orderWaiting(sqlSession);

		
		return list;
	}

	@Override
	public ArrayList<CompanyOrder> orderMaking() throws FailSelectOrder {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = cd.orderMaking(sqlSession);

		
		return list;
	}

	@Override
	public ArrayList<CompanyOrder> orderDelivering() throws FailSelectOrder {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = cd.orderDelivering(sqlSession);

		
		return list;
	}

	@Override
	public ArrayList<CompanyOrder> orderComplete() throws FailSelectOrder {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = cd.orderComplete(sqlSession);

		
		return list;
	}
	
	@Override
	public ArrayList<CompanyOrder> orderRefuseList() throws FailSelectOrder {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = cd.orderRefuseList(sqlSession);

		
		return list;
	}
	
	
	

	@Override
	public int acceptOrder(int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = cd.acceptOrder(sqlSession, orderNoInt);
		
		return result;
	}

	@Override
	public int refuseOrder(int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = cd.refuseOrder(sqlSession, orderNoInt);
		
		return result;
	}

	@Override
	public ArrayList<CompanyEmployee> remainDeliveryMan(int comNo) throws FailSelectDeliveryMan {
		// TODO Auto-generated method stub
		ArrayList<CompanyEmployee> list = new ArrayList<CompanyEmployee>();
		list = cd.remainDeliveryMan(sqlSession, comNo);
		
		
		return list;
	}

	@Override
	public int deliveryManUpdateM(int orderNoInt, int empNoInt) throws FailUpdateDelivery {
		// TODO Auto-generated method stub
		int deliveryManUpdate = cd.deliveryManUpdateM(sqlSession, orderNoInt, empNoInt);
		return deliveryManUpdate;
	}

	@Override
	public int orderUpdateM(int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int orderUpdate = cd.orderUpdateM(sqlSession, orderNoInt);
		return orderUpdate;
	}

	@Override
	public int orderUpdateToComplete(int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = cd.orderUpdateToComplete(sqlSession, orderNoInt);
		return result;
	}

	@Override
	public int orderUpdateToDelete(int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = cd.orderUpdateToDelete(sqlSession, orderNoInt);
		return result;
	}

	@Override
	public int refuseListDelete(int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = cd.refuseListDelete(sqlSession, orderNoInt);
		return result;
	}

	@Override
	public ArrayList<CompanyEmployee> selectEmployeeList(int comNo) throws FailSelectEmployeeList {
		// TODO Auto-generated method stub
		ArrayList<CompanyEmployee> list = new ArrayList<CompanyEmployee>();
		list = cd.selectEmployeeList(sqlSession, comNo);
		return list;
	}

	@Override
	public int inputEmployeeInfo(CompanyEmployee ce) throws FailInsertEmployeeInfo {
		// TODO Auto-generated method stub
		int result = cd.inputEmployeeInfo(sqlSession, ce);
		
		return result;
	}

	@Override
	public int deleteEmployeeInfo(ArrayList<Integer> list) throws FailUpdateEmployeeInfo {
		// TODO Auto-generated method stub
		int result = cd.deleteEmployeeInfo(sqlSession, list);
		
		return result;
	}

	@Override
	public ArrayList<CompanyBoard> selectCompanyReview(int comNo) throws FailSelectCompanyReview {
		// TODO Auto-generated method stub
		ArrayList<CompanyBoard> list = new ArrayList<CompanyBoard>();
		list = cd.selectCompanyReview(sqlSession, comNo);
		
		return list;
	}

	@Override
	public ArrayList<CompanyMaterial> orderStrok() throws FailSelectOrderStock {
		// TODO Auto-generated method stub
		ArrayList<CompanyMaterial> list = new ArrayList<CompanyMaterial>();
		list = cd.orderStrok(sqlSession);
		
		return list;
	}

	@Override
	public int applyStock(ArrayList<CompanyOrderStock> list) throws FailInsertOrderStock {
		// TODO Auto-generated method stub
		int result = cd.applyStock(sqlSession, list);
		return result;
	}

	@Override
	public ArrayList<CompanyOrderStock> selectOrderStockList(int comNo) throws FailSelectOrderStock {
		// TODO Auto-generated method stub
		ArrayList<CompanyOrderStock> list = new ArrayList<CompanyOrderStock>();
		list = cd.selectOrderStockList(sqlSession, comNo);
		
		return list;
	}

	@Override
	public int receiptConfirm(ArrayList<Integer> orderMno) throws FailInsertOrderStock {
		// TODO Auto-generated method stub
		int result = cd.receiptConfirm(sqlSession, orderMno);
		return result;
	}

	@Override
	public ArrayList<CompanyOrderStock> selectReceiptList(int comNo) throws FailSelectOrderStock {
		// TODO Auto-generated method stub
		ArrayList<CompanyOrderStock> list = new ArrayList<CompanyOrderStock>();
		list = cd.selectReceiptList(sqlSession, comNo);
		
		return list;
	}

	@Override
	public ArrayList<CompanyRemainMaterial> selectAllMaterialList(int comNo) throws FailSelectOrderStock {
		// TODO Auto-generated method stub
		ArrayList<CompanyRemainMaterial> list = new ArrayList<CompanyRemainMaterial>();
		list = cd.selectAllMaterialList(sqlSession, comNo);
		
		return list;
	}

	@Override
	public ArrayList<CompanySales> selectAllCompanySales(int comNo) throws FailSelectCompanySales {
		// TODO Auto-generated method stub
		ArrayList<CompanySales> list = new ArrayList<CompanySales>();
		list = cd.selectAllCompanySales(sqlSession, comNo);
		
		return list;
	}

	
}
