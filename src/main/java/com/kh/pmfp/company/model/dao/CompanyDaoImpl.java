package com.kh.pmfp.company.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pmfp.company.model.exception.FailSelectAdminMessage;
import com.kh.pmfp.company.model.exception.FailSelectDeliveryMan;
import com.kh.pmfp.company.model.exception.FailSelectOrder;
import com.kh.pmfp.company.model.exception.FailUpdateOrderStatus;
import com.kh.pmfp.company.model.exception.FaileDetailMessage;
import com.kh.pmfp.company.model.vo.CompanyBoard;
import com.kh.pmfp.company.model.vo.CompanyEmployee;
import com.kh.pmfp.company.model.vo.CompanyOrder;

@Repository
public class CompanyDaoImpl implements CompanyDao{

	@Override
	public ArrayList<CompanyBoard> selectAdminMessage(SqlSessionTemplate sqlSession) throws FailSelectAdminMessage {
		// TODO Auto-generated method stub
		ArrayList<CompanyBoard> adminMessage = new ArrayList<CompanyBoard>();
		adminMessage = (ArrayList)sqlSession.selectList("Company.selectAdminMessage");
		
		if(adminMessage == null) {
			throw new FailSelectAdminMessage("관리자 메세지 조회 실패!");
		}
		
		return adminMessage;
	}

	@Override
	public CompanyBoard detailAdminMessage(SqlSessionTemplate sqlSession, int boardNo) throws FaileDetailMessage {
		// TODO Auto-generated method stub
		CompanyBoard detailMessage = sqlSession.selectOne("Company.detailAdminMessage", boardNo);
		
		if(detailMessage == null) {
			throw new FaileDetailMessage("관리자 메세지 상세조회 실패!");
		}
		
		return detailMessage;
	}

	@Override
	public ArrayList<CompanyOrder> orderWaiting(SqlSessionTemplate sqlSession) throws FailSelectOrder {
		// TODO Auto-generated method stub
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = (ArrayList)sqlSession.selectList("Company.orderWaiting");
		
		if(list == null) {
			throw new FailSelectOrder("업체 주문조회에 실패했습니다!");
		}
		
		return list;
	}

	@Override
	public ArrayList<CompanyOrder> orderMaking(SqlSessionTemplate sqlSession) throws FailSelectOrder {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = (ArrayList)sqlSession.selectList("Company.orderMaking");
		
		if(list == null) {
			throw new FailSelectOrder("업체 주문조회에 실패했습니다!");
		}
		
		return list;
	}

	@Override
	public ArrayList<CompanyOrder> orderDelivering(SqlSessionTemplate sqlSession) throws FailSelectOrder {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = (ArrayList)sqlSession.selectList("Company.orderDelivering");
		
		if(list == null) {
			throw new FailSelectOrder("업체 주문조회에 실패했습니다!");
		}
		
		return list;
	}

	@Override
	public ArrayList<CompanyOrder> orderComplete(SqlSessionTemplate sqlSession) throws FailSelectOrder {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = (ArrayList)sqlSession.selectList("Company.orderComplete");
		
		if(list == null) {
			throw new FailSelectOrder("업체 주문조회에 실패했습니다!");
		}
		
		return list;
	}
	
	@Override
	public ArrayList<CompanyOrder> orderRefuseList(SqlSessionTemplate sqlSession) throws FailSelectOrder {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = (ArrayList)sqlSession.selectList("Company.orderRefuseList");
		
		if(list == null) {
			throw new FailSelectOrder("업체 주문조회에 실패했습니다!");
		}
		
		return list;
	}
	
	
	

	@Override
	public int acceptOrder(SqlSessionTemplate sqlSession, int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = sqlSession.update("Company.acceptOrder", orderNoInt);
		
		if(result <= 0) {
			throw new FailUpdateOrderStatus("주문 상태변경에 실패했습니다!");
		}
		
		return result;
	}

	@Override
	public int refuseOrder(SqlSessionTemplate sqlSession, int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = sqlSession.update("Company.refuseOrder", orderNoInt);
		
		if(result <= 0) {
			throw new FailUpdateOrderStatus("주문 상태변경에 실패했습니다!");
		}
		
		return result;
	}

	@Override
	public ArrayList<CompanyEmployee> remainDeliveryMan(SqlSessionTemplate sqlSession, int comNo) throws FailSelectDeliveryMan {
		// TODO Auto-generated method stub
		ArrayList<CompanyEmployee> list = new ArrayList<CompanyEmployee>();
		list = (ArrayList)sqlSession.selectList("Company.remainDeliveryMan", comNo);
		
		if(list == null) {
			throw new  FailSelectDeliveryMan("배달원 조회 실패!");
		}
		
		return list;
	}

	

}
