package com.kh.pmfp.company.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.pmfp.company.model.dao.CompanyDao;
import com.kh.pmfp.company.model.exception.FailSelectAdminMessage;
import com.kh.pmfp.company.model.exception.FailSelectDeliveryMan;
import com.kh.pmfp.company.model.exception.FailSelectOrder;
import com.kh.pmfp.company.model.exception.FailUpdateOrderStatus;
import com.kh.pmfp.company.model.exception.FaileDetailMessage;
import com.kh.pmfp.company.model.vo.CompanyBoard;
import com.kh.pmfp.company.model.vo.CompanyEmployee;
import com.kh.pmfp.company.model.vo.CompanyOrder;

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

	
}
