package com.kh.pmfp.company.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

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


public interface CompanyDao {

	HashMap<String, ArrayList> selectAdminMessage(SqlSessionTemplate sqlSession, int memberNo) throws FailSelectAdminMessage;

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

	ArrayList<CompanyMaterial> orderStrok(SqlSessionTemplate sqlSession) throws FailSelectOrderStock;

	int applyStock(SqlSessionTemplate sqlSession, ArrayList<CompanyOrderStock> list) throws FailInsertOrderStock;

	ArrayList<CompanyOrderStock> selectOrderStockList(SqlSessionTemplate sqlSession, int comNo) throws FailSelectOrderStock;

	int receiptConfirm(SqlSessionTemplate sqlSession, ArrayList<Integer> orderMno) throws FailInsertOrderStock;

	ArrayList<CompanyOrderStock> selectReceiptList(SqlSessionTemplate sqlSession, int comNo) throws FailSelectOrderStock;

	ArrayList<CompanyRemainMaterial> selectAllMaterialList(SqlSessionTemplate sqlSession, int comNo) throws FailSelectOrderStock;

	ArrayList<CompanySales> selectAllCompanySales(SqlSessionTemplate sqlSession, int comNo) throws FailSelectCompanySales;

	HashMap<String, ArrayList<CompanySalesList>> selectCompanySalesList(SqlSessionTemplate sqlSession, int comNo) throws FailSelectCompanySales;

	ArrayList<CompanyCalendar> calendarDetail(SqlSessionTemplate sqlSession, Date date) throws FailSelectCalendar;

	int insertCalendarData(SqlSessionTemplate sqlSession, CompanyCalendar cc) throws FailChangeCalendarDate;

	int deleteCalendarData(SqlSessionTemplate sqlSession, CompanyCalendar cc) throws FailChangeCalendarDate;

	int reflectModify(SqlSessionTemplate sqlSession, CompanyCalendar cc) throws FailChangeCalendarDate;

	//ArrayList<CompanyCalendar> selectMemberCalendar(SqlSessionTemplate sqlSession, int memberNo) throws FailSelectCalendar;

}
