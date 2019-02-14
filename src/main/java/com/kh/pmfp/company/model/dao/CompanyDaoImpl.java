package com.kh.pmfp.company.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
import com.kh.pmfp.company.model.vo.CompanySalesList;

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

	@Override
	public int deliveryManUpdateM(SqlSessionTemplate sqlSession, int orderNoInt, int empNoInt) throws FailUpdateDelivery {
		// TODO Auto-generated method stub
		CompanyEmployee ce = new CompanyEmployee();
		ce.setEmployeeNo(empNoInt);
		ce.setEmpDeliveryONo(orderNoInt);
		
		int deliveryManUpdate = sqlSession.update("Company.deliveryManUpdate", ce);
		
		if(deliveryManUpdate <= 0) {
			throw new FailUpdateDelivery("배달상태 변경 실패!");
		}
		
		return deliveryManUpdate;
	}

	@Override
	public int orderUpdateM(SqlSessionTemplate sqlSession, int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int orderUpdate = sqlSession.update("Company.orderUpdate", orderNoInt);
		
		if(orderUpdate <= 0) {
			throw new FailUpdateOrderStatus("주문상태 변경 실패!");
		}
		
		return orderUpdate;
	}

	@Override
	public int orderUpdateToComplete(SqlSessionTemplate sqlSession, int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int resultA = sqlSession.update("Company.orderUpdateToComplete", orderNoInt);
		int resultB = sqlSession.update("Company.returnDeliveryMan", orderNoInt);
		
		int result = resultA + resultB;
		
		if(result <=0) {
			throw new FailUpdateOrderStatus("주문상태 변경 실패!");
		}
		
		return result;
	}

	@Override
	public int orderUpdateToDelete(SqlSessionTemplate sqlSession, int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = sqlSession.update("Company.orderUpdateToDelete", orderNoInt);
		
		if(result <=0) {
			throw new FailUpdateOrderStatus("주문상태 변경 실패!");
		}
		
		return result;
	}

	@Override
	public int refuseListDelete(SqlSessionTemplate sqlSession, int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = sqlSession.update("Company.refuseListDelete", orderNoInt);
		
		if(result <=0) {
			throw new FailUpdateOrderStatus("주문상태 변경 실패!");
		}
		
		return result;
	}

	@Override
	public ArrayList<CompanyEmployee> selectEmployeeList(SqlSessionTemplate sqlSession, int comNo) throws FailSelectEmployeeList {
		// TODO Auto-generated method stub
		ArrayList<CompanyEmployee> list = new ArrayList<CompanyEmployee>();
		list = (ArrayList)sqlSession.selectList("Company.selectEmployeeList", comNo);
		
		if(list == null) {
			throw new FailSelectEmployeeList("업체 회원조회 실패!");
		}
		
		return list;
	}

	@Override
	public int inputEmployeeInfo(SqlSessionTemplate sqlSession, CompanyEmployee ce) throws FailInsertEmployeeInfo {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("Company.inputEmployeeInfo", ce);
		
		if(result <= 0) {
			throw new FailInsertEmployeeInfo("업체 회원 정보 삽입 실패!");
		}
		
		return result;
	}

	@Override
	public int deleteEmployeeInfo(SqlSessionTemplate sqlSession, ArrayList<Integer> list) throws FailUpdateEmployeeInfo {
		// TODO Auto-generated method stub
		int result = sqlSession.update("Company.deleteEmployeeInfo", list);
		
		//System.out.println("list : " + list);
		
		if(result <= 0) {
			throw new FailUpdateEmployeeInfo("업체직원 정보 수정 실패!");
		}
		
		return result;
	}

	@Override
	public ArrayList<CompanyBoard> selectCompanyReview(SqlSessionTemplate sqlSession, int comNo) throws FailSelectCompanyReview {
		// TODO Auto-generated method stub
		ArrayList<CompanyBoard> list = new ArrayList<CompanyBoard>();
		list = (ArrayList)sqlSession.selectList("Company.selectCompanyReview", comNo);
		
		if(list == null) {
			throw new FailSelectCompanyReview("업체 후기 조회 실패!");
		}
		
		return list;
	}

	@Override
	public ArrayList<CompanyMaterial> orderStrok(SqlSessionTemplate sqlSession) throws FailSelectOrderStock {
		// TODO Auto-generated method stub
		ArrayList<CompanyMaterial> list = new ArrayList<CompanyMaterial>();
		list = (ArrayList)sqlSession.selectList("Company.orderStrok");
		
		if(list == null) {
			throw new FailSelectOrderStock("재고 조회 실패!");
		}
		
		return list;
	}

	@Override
	public int applyStock(SqlSessionTemplate sqlSession, ArrayList<CompanyOrderStock> list) throws FailInsertOrderStock {
		// TODO Auto-generated method stub
		int result = 0;
		int resultupdate = 0;
		
		for(int i = 0; i < list.size(); i++) {
			result += sqlSession.insert("Company.applyStock", list.get(i));
			result += sqlSession.insert("Company.applyStockAndAddExpense", list.get(i));
			resultupdate += sqlSession.update("Company.applyStockAndUpdateStockList", list.get(i));
			result += sqlSession.insert("Company.applyStockAndInsertSales", list.get(i));

		}
		System.out.println("resultupdate : " + resultupdate );
		
		if(result <= 0 ) {
			throw new FailInsertOrderStock("재고 정보 삽입 실패!");
		}
		
		return result;
	}

	@Override
	public ArrayList<CompanyOrderStock> selectOrderStockList(SqlSessionTemplate sqlSession, int comNo) throws FailSelectOrderStock {
		// TODO Auto-generated method stub
		ArrayList<CompanyOrderStock> list = (ArrayList)sqlSession.selectList("Company.selectOrderStockList", comNo);
		
		if(list == null) {
			throw new FailSelectOrderStock("재고 조회 실패!");
		}
		
		return list;
	}

	@Override
	public int receiptConfirm(SqlSessionTemplate sqlSession, ArrayList<Integer> orderMno) throws FailInsertOrderStock {
		// TODO Auto-generated method stub
		int result = sqlSession.update("Company.receiptConfirm", orderMno);
		
		if(result <= 0) {
			throw new FailInsertOrderStock("재고 정보 삽입 실패!");
		}
		
		return result;
	}

	@Override
	public ArrayList<CompanyOrderStock> selectReceiptList(SqlSessionTemplate sqlSession, int comNo) throws FailSelectOrderStock {
		// TODO Auto-generated method stub
		ArrayList<CompanyOrderStock> list = (ArrayList)sqlSession.selectList("Company.selectReceiptList", comNo);
		
		if(list == null) {
			throw new FailSelectOrderStock("재고 조회 실패!");
		}
		
		return list;
	}

	@Override
	public ArrayList<CompanyRemainMaterial> selectAllMaterialList(SqlSessionTemplate sqlSession, int comNo) throws FailSelectOrderStock {
		// TODO Auto-generated method stub
		ArrayList<CompanyRemainMaterial> list = new ArrayList<CompanyRemainMaterial>();
		list = (ArrayList)sqlSession.selectList("Company.selectAllMaterialList", comNo);
		
		if(list == null) {
			throw new FailSelectOrderStock("재고 조회 실패!");
		}
		
		return list;
	}

	@Override
	public ArrayList<CompanySales> selectAllCompanySales(SqlSessionTemplate sqlSession, int comNo) throws FailSelectCompanySales {
		// TODO Auto-generated method stub
		ArrayList<CompanySales> list = new ArrayList<CompanySales>();
		list = (ArrayList)sqlSession.selectList("Company.selectAllCompanySales", comNo);
		
		if(list == null) {
			throw new FailSelectCompanySales("업체 매출 조회 실패!");
		}
		
		return list;
	}
	
	@Override
	public HashMap<String, ArrayList<CompanySalesList>> selectCompanySalesList(SqlSessionTemplate sqlSession, int comNo) throws FailSelectCompanySales {
		// TODO Auto-generated method stub
		ArrayList<CompanySalesList> inComeList = new ArrayList<CompanySalesList>();
		inComeList = (ArrayList)sqlSession.selectList("Company.selectCompanySalesIncomeList", comNo);
		ArrayList<CompanySalesList> outComeList = new ArrayList<CompanySalesList>();
		outComeList = (ArrayList)sqlSession.selectList("Company.selectCompanySalesOutcomeList", comNo);
		
		if(inComeList == null || outComeList == null) {
			throw new FailSelectCompanySales("업체 매출 조회 실패!");
		}
		
		HashMap<String, ArrayList<CompanySalesList>> hmap = new HashMap<String, ArrayList<CompanySalesList>>();
		hmap.put("inComeList", inComeList);
		hmap.put("outComeList", outComeList);
		
		return hmap;
	}
	
	

}
