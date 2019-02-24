package com.kh.pmfp.company.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.kh.pmfp.company.model.exception.FailChangeCalendarDate;
import com.kh.pmfp.company.model.exception.FailInsertEmployeeInfo;
import com.kh.pmfp.company.model.exception.FailInsertOrderStock;
import com.kh.pmfp.company.model.exception.FailSelectAdminMessage;
import com.kh.pmfp.company.model.exception.FailSelectCalendar;
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
import com.kh.pmfp.company.model.vo.CompanyCalendar;
import com.kh.pmfp.company.model.vo.CompanyEmployee;
import com.kh.pmfp.company.model.vo.CompanyMaterial;
import com.kh.pmfp.company.model.vo.CompanyOrder;
import com.kh.pmfp.company.model.vo.CompanyOrderStock;
import com.kh.pmfp.company.model.vo.CompanyRemainMaterial;
import com.kh.pmfp.company.model.vo.CompanySales;
import com.kh.pmfp.company.model.vo.CompanySalesList;



@Repository
public class CompanyDaoImpl implements CompanyDao {

	/*private Properties prop = new Properties();

	public CompanyDaoImpl() {
		String fileName = CompanyDaoImpl.class.getResource("/query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}*/

	@Override
	public HashMap<String, ArrayList> selectAdminMessage(SqlSessionTemplate sqlSession, int memberNo)
			throws FailSelectAdminMessage {
		// TODO Auto-generated method stub
		HashMap<String, ArrayList> hmap = new HashMap<String, ArrayList>();

		ArrayList<CompanyBoard> adminMessage = new ArrayList<CompanyBoard>();
		adminMessage = (ArrayList) sqlSession.selectList("Company.selectAdminMessage");
		ArrayList<CompanyCalendar> memberCalendar = new ArrayList<CompanyCalendar>();
		memberCalendar = (ArrayList) sqlSession.selectList("Company.selectMemberCalendar", memberNo);

		hmap.put("adminMessage", adminMessage);
		hmap.put("memberCalendar", memberCalendar);

		if (adminMessage == null || memberCalendar == null) {
			throw new FailSelectAdminMessage("관리자 메세지 조회 실패!");
		}

		return hmap;
	}

	@Override
	public CompanyBoard detailAdminMessage(SqlSessionTemplate sqlSession, int boardNo) throws FaileDetailMessage {
		// TODO Auto-generated method stub
		CompanyBoard detailMessage = sqlSession.selectOne("Company.detailAdminMessage", boardNo);

		if (detailMessage == null) {
			throw new FaileDetailMessage("관리자 메세지 상세조회 실패!");
		}

		return detailMessage;
	}

	@Override
	public ArrayList<CompanyOrder> orderWaiting(SqlSessionTemplate sqlSession, int comNo) throws FailSelectOrder {
		// TODO Auto-generated method stub
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = (ArrayList) sqlSession.selectList("Company.orderWaiting", comNo);

		if (list == null) {
			throw new FailSelectOrder("업체 주문조회에 실패했습니다!");
		}

		return list;
	}

	@Override
	public ArrayList<CompanyOrder> orderMaking(SqlSessionTemplate sqlSession, int comNo) throws FailSelectOrder {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = (ArrayList) sqlSession.selectList("Company.orderMaking", comNo);

		if (list == null) {
			throw new FailSelectOrder("업체 주문조회에 실패했습니다!");
		}

		return list;
	}

	@Override
	public ArrayList<CompanyOrder> orderDelivering(SqlSessionTemplate sqlSession, int comNo) throws FailSelectOrder {
		System.out.println("Dao에서 comNo : " + comNo);
		System.out.println("Dao에서 sqlSession : " + sqlSession);
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		
		list = (ArrayList) sqlSession.selectList("Company.orderDelivering", comNo);

		if (list == null) {
			throw new FailSelectOrder("업체 주문조회에 실패했습니다!");
		}

		return list;
	}

	@Override
	public ArrayList<CompanyOrder> orderComplete(SqlSessionTemplate sqlSession, int comNo) throws FailSelectOrder {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = (ArrayList) sqlSession.selectList("Company.orderComplete", comNo);

		if (list == null) {
			throw new FailSelectOrder("업체 주문조회에 실패했습니다!");
		}

		return list;
	}

	@Override
	public ArrayList<CompanyOrder> orderRefuseList(SqlSessionTemplate sqlSession, int comNo) throws FailSelectOrder {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = (ArrayList) sqlSession.selectList("Company.orderRefuseList", comNo);

		if (list == null) {
			throw new FailSelectOrder("업체 주문조회에 실패했습니다!");
		}

		return list;
	}

	@Override
	public int acceptOrder(SqlSessionTemplate sqlSession, CompanySales comsales) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = sqlSession.update("Company.acceptOrder", comsales);
		int salesPrice = sqlSession.selectOne("Company.selectSalesPrice", comsales);
		comsales.setSalesPrice(salesPrice);
		int resultB = sqlSession.insert("Company.reflectAcceptOrderToSales", comsales);

		if (result <= 0) {
			throw new FailUpdateOrderStatus("주문 상태변경에 실패했습니다!");
		}

		return result;
	}

	@Override
	public int refuseOrder(SqlSessionTemplate sqlSession, int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = sqlSession.update("Company.refuseOrder", orderNoInt);

		if (result <= 0) {
			throw new FailUpdateOrderStatus("주문 상태변경에 실패했습니다!");
		}

		return result;
	}

	@Override
	public ArrayList<CompanyEmployee> remainDeliveryMan(SqlSessionTemplate sqlSession, int comNo)
			throws FailSelectDeliveryMan {
		// TODO Auto-generated method stub
		ArrayList<CompanyEmployee> list = new ArrayList<CompanyEmployee>();
		list = (ArrayList) sqlSession.selectList("Company.remainDeliveryMan", comNo);

		if (list == null) {
			throw new FailSelectDeliveryMan("배달원 조회 실패!");
		}

		return list;
	}

	@Override
	public int deliveryManUpdateM(SqlSessionTemplate sqlSession, int orderNoInt, int empNoInt)
			throws FailUpdateDelivery {
		// TODO Auto-generated method stub
		CompanyEmployee ce = new CompanyEmployee();
		ce.setEmployeeNo(empNoInt);
		ce.setEmpDeliveryONo(orderNoInt);

		int deliveryManUpdate = sqlSession.update("Company.deliveryManUpdate", ce);

		if (deliveryManUpdate <= 0) {
			throw new FailUpdateDelivery("배달상태 변경 실패!");
		}

		return deliveryManUpdate;
	}

	@Override
	public int orderUpdateM(SqlSessionTemplate sqlSession, int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int orderUpdate = sqlSession.update("Company.orderUpdate", orderNoInt);

		if (orderUpdate <= 0) {
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

		if (result <= 0) {
			throw new FailUpdateOrderStatus("주문상태 변경 실패!");
		}

		return result;
	}

	@Override
	public int orderUpdateToDelete(SqlSessionTemplate sqlSession, int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = sqlSession.update("Company.orderUpdateToDelete", orderNoInt);

		if (result <= 0) {
			throw new FailUpdateOrderStatus("주문상태 변경 실패!");
		}

		return result;
	}

	@Override
	public int refuseListDelete(SqlSessionTemplate sqlSession, int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = sqlSession.update("Company.refuseListDelete", orderNoInt);

		if (result <= 0) {
			throw new FailUpdateOrderStatus("주문상태 변경 실패!");
		}

		return result;
	}

	@Override
	public ArrayList<CompanyEmployee> selectEmployeeList(SqlSessionTemplate sqlSession, int comNo)
			throws FailSelectEmployeeList {
		// TODO Auto-generated method stub
		ArrayList<CompanyEmployee> list = new ArrayList<CompanyEmployee>();
		list = (ArrayList) sqlSession.selectList("Company.selectEmployeeList", comNo);

		if (list == null) {
			throw new FailSelectEmployeeList("업체 회원조회 실패!");
		}

		return list;
	}

	@Override
	public int inputEmployeeInfo(SqlSessionTemplate sqlSession, CompanyEmployee ce) throws FailInsertEmployeeInfo {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("Company.inputEmployeeInfo", ce);

		if (result <= 0) {
			throw new FailInsertEmployeeInfo("업체 회원 정보 삽입 실패!");
		}

		return result;
	}

	@Override
	public int deleteEmployeeInfo(SqlSessionTemplate sqlSession, ArrayList<Integer> list)
			throws FailUpdateEmployeeInfo {
		// TODO Auto-generated method stub
		int result = sqlSession.update("Company.deleteEmployeeInfo", list);

		// System.out.println("list : " + list);

		if (result <= 0) {
			throw new FailUpdateEmployeeInfo("업체직원 정보 수정 실패!");
		}

		return result;
	}

	@Override
	public ArrayList<CompanyBoard> selectCompanyReview(SqlSessionTemplate sqlSession, int comNo)
			throws FailSelectCompanyReview {
		// TODO Auto-generated method stub
		ArrayList<CompanyBoard> list = new ArrayList<CompanyBoard>();
		list = (ArrayList) sqlSession.selectList("Company.selectCompanyReview", comNo);

		if (list == null) {
			throw new FailSelectCompanyReview("업체 후기 조회 실패!");
		}

		return list;
	}

	@Override
	public ArrayList<CompanyMaterial> orderStrok(SqlSessionTemplate sqlSession) throws FailSelectOrderStock {
		// TODO Auto-generated method stub
		ArrayList<CompanyMaterial> list = new ArrayList<CompanyMaterial>();
		list = (ArrayList) sqlSession.selectList("Company.orderStrok");

		if (list == null) {
			throw new FailSelectOrderStock("재고 조회 실패!");
		}

		return list;
	}

	@Override
	public int applyStock(SqlSessionTemplate sqlSession, ArrayList<CompanyOrderStock> list)
			throws FailInsertOrderStock {
		// TODO Auto-generated method stub
		int result = 0;
		int resultupdate = 0;

		for (int i = 0; i < list.size(); i++) {
			result += sqlSession.insert("Company.applyStock", list.get(i));
			System.out.println(i + "번째 applyStock : " + result);
			result += sqlSession.insert("Company.applyStockAndAddExpense", list.get(i));
			System.out.println(i + "번째 applyStockAndAddExpense : " + result);
			resultupdate = sqlSession.update("Company.applyStockAndUpdateStockList", list.get(i));
			result += resultupdate;
			System.out.println(i + "번째 applyStockAndUpdateStockList : " + result);
			result += sqlSession.insert("Company.applyStockAndInsertSales", list.get(i));
			System.out.println(i + "번째 applyStockAndInsertSales : " + result);

			if (resultupdate == 0) {
				resultupdate = sqlSession.insert("Company.applyStockIfDontHaveStock", list.get(i));
				System.out.println("중간resultupdate : " + resultupdate);
			}
			resultupdate = 0;
		}
		System.out.println("result : " + result);
		System.out.println("resultupdate : " + resultupdate);

		if (result <= 0) {
			throw new FailInsertOrderStock("재고 정보 삽입 실패!");
		}

		return result;
	}

	@Override
	public ArrayList<CompanyOrderStock> selectOrderStockList(SqlSessionTemplate sqlSession, int comNo)
			throws FailSelectOrderStock {
		// TODO Auto-generated method stub
		ArrayList<CompanyOrderStock> list = (ArrayList) sqlSession.selectList("Company.selectOrderStockList", comNo);

		if (list == null) {
			throw new FailSelectOrderStock("재고 조회 실패!");
		}

		return list;
	}

	@Override
	public int receiptConfirm(SqlSessionTemplate sqlSession, ArrayList<Integer> orderMno) throws FailInsertOrderStock {
		// TODO Auto-generated method stub
		int result = sqlSession.update("Company.receiptConfirm", orderMno);

		if (result <= 0) {
			throw new FailInsertOrderStock("재고 정보 삽입 실패!");
		}

		return result;
	}

	@Override
	public ArrayList<CompanyOrderStock> selectReceiptList(SqlSessionTemplate sqlSession, int comNo)
			throws FailSelectOrderStock {
		// TODO Auto-generated method stub
		ArrayList<CompanyOrderStock> list = (ArrayList) sqlSession.selectList("Company.selectReceiptList", comNo);

		if (list == null) {
			throw new FailSelectOrderStock("재고 조회 실패!");
		}

		return list;
	}

	@Override
	public ArrayList<CompanyRemainMaterial> selectAllMaterialList(SqlSessionTemplate sqlSession, int comNo)
			throws FailSelectOrderStock {
		// TODO Auto-generated method stub
		ArrayList<CompanyRemainMaterial> list = new ArrayList<CompanyRemainMaterial>();
		list = (ArrayList) sqlSession.selectList("Company.selectAllMaterialList", comNo);

		if (list == null) {
			throw new FailSelectOrderStock("재고 조회 실패!");
		}

		return list;
	}

	@Override
	public ArrayList<CompanySales> selectAllCompanySales(SqlSessionTemplate sqlSession, int comNo)
			throws FailSelectCompanySales {
		// TODO Auto-generated method stub
		ArrayList<CompanySales> list = new ArrayList<CompanySales>();
		list = (ArrayList) sqlSession.selectList("Company.selectAllCompanySales", comNo);

		if (list == null) {
			throw new FailSelectCompanySales("업체 매출 조회 실패!");
		}

		return list;
	}

	@Override
	public HashMap<String, ArrayList<CompanySalesList>> selectCompanySalesList(SqlSessionTemplate sqlSession, int comNo)
			throws FailSelectCompanySales {
		// TODO Auto-generated method stub
		ArrayList<CompanySalesList> inComeList = new ArrayList<CompanySalesList>();
		inComeList = (ArrayList) sqlSession.selectList("Company.selectCompanySalesIncomeList", comNo);
		ArrayList<CompanySalesList> outComeList = new ArrayList<CompanySalesList>();
		outComeList = (ArrayList) sqlSession.selectList("Company.selectCompanySalesOutcomeList", comNo);

		if (inComeList == null || outComeList == null) {
			throw new FailSelectCompanySales("업체 매출 조회 실패!");
		}

		HashMap<String, ArrayList<CompanySalesList>> hmap = new HashMap<String, ArrayList<CompanySalesList>>();
		hmap.put("inComeList", inComeList);
		hmap.put("outComeList", outComeList);

		return hmap;
	}

	@Override
	public ArrayList<CompanyCalendar> calendarDetail(SqlSessionTemplate sqlSession, CompanyCalendar cc)
			throws FailSelectCalendar {
		// TODO Auto-generated method stub
		ArrayList<CompanyCalendar> list = new ArrayList<CompanyCalendar>();
		list = (ArrayList) sqlSession.selectList("Company.calendarDetail", cc);

		if (list == null) {
			throw new FailSelectCalendar("달력 조회 실패!");
		}

		return list;
	}

	@Override
	public int insertCalendarData(SqlSessionTemplate sqlSession, CompanyCalendar cc) throws FailChangeCalendarDate {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("Company.insertCalendarData", cc);

		if (result <= 0) {
			throw new FailChangeCalendarDate("달력 값 변경 실패!");
		}

		return result;
	}

	@Override
	public int deleteCalendarData(SqlSessionTemplate sqlSession, CompanyCalendar cc) throws FailChangeCalendarDate {
		// TODO Auto-generated method stub
		// 먼저 지울것의 정보 조회
		// 지울 행의 Categ를 알아옴
		int result = 0;
		CompanyCalendar deleteRow = sqlSession.selectOne("Company.selectdeleteRow", cc);
		System.out.println("deleteRow : " + deleteRow);
		// 행 지우기
		int resultA = sqlSession.delete("Company.deleteCalendarData", cc);
		System.out.println("resultA : " + resultA);

		int resultB = sqlSession.update("Company.deleteAfterUpdateCalendar", deleteRow);
		System.out.println("resultB : " + resultB);
		result = resultA + resultB;
		// 지운 행과 같은 날짜면서 Categ가 지울행보다 큰애들 Categ를 -1씩수행
		if (result <= 0) {
			throw new FailChangeCalendarDate("달력 값 변경 실패!");
		}
		System.out.println("result : " + result);
		return result;
	}

	@Override
	public int reflectModify(SqlSessionTemplate sqlSession, CompanyCalendar cc) throws FailChangeCalendarDate {
		// TODO Auto-generated method stub
		int result = sqlSession.update("Company.reflectModify", cc);

		if (result <= 0) {
			throw new FailChangeCalendarDate("달력 값 변경 실패!");
		}

		return result;
	}

	@Override
	public ArrayList<CompanyOrder> orderDelivering(SqlSession sqlSession, int comNo) throws FailSelectOrder {
		System.out.println("Dao에서 comNo : " + comNo);
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = (ArrayList) sqlSession.selectList("Company.orderDelivering", comNo);

		if (list == null) {
			throw new FailSelectOrder("업체 주문조회에 실패했습니다!");
		}

		return list;
	}

	/*@Override
	public ArrayList<CompanyOrder> orderDeliveringSocket(Connection con, int comNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		CompanyOrder co;
		String query = prop.getProperty("orderDeliveringSocket");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, comNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				co = new CompanyOrder();
				co.setOrderNo(rset.getInt(1));
				co.setMemberNo(rset.getInt(2));
				co.setOrderMethod(rset.getInt(3));
				co.setReceiver(rset.getString(4));
				co.setOrderTel(rset.getString(5));
				co.setOrderDate(rset.getDate(6));
				co.setOrderReserveTime(rset.getDate(7));
				co.setOrderPayno(rset.getString(8));
				co.setOrderPayPrice(rset.getInt(9));
				co.setOrderStatus(rset.getInt(10));
				co.setDeliveryNo(rset.getInt(11));
				co.setEmpNo(rset.getInt(12));
				co.setComNo(rset.getInt(13));
				co.setDeliveryAddress(rset.getString(14));
				co.setDeliveryName(rset.getString(15));
				co.setAddTopping(rset.getString(16));
				
				list.add(co);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
			
		}

		return list;
	}*/

	/*
	 * @Override public ArrayList<CompanyCalendar>
	 * selectMemberCalendar(SqlSessionTemplate sqlSession, int memberNo) throws
	 * FailSelectCalendar { // TODO Auto-generated method stub
	 * ArrayList<CompanyCalendar> list = new ArrayList<CompanyCalendar>(); list =
	 * (ArrayList)sqlSession.selectList("Company.selectMemberCalendar", memberNo);
	 * 
	 * if(list == null) { throw new FailSelectCalendar("달력 조회 실패!"); }
	 * 
	 * return list; }
	 * 
	 */

}
