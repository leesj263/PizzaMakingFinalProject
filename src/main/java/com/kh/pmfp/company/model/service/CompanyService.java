package com.kh.pmfp.company.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

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

public interface CompanyService {

	HashMap<String, ArrayList> selectAdminMessage(int memberNo) throws FailSelectAdminMessage;

	CompanyBoard detailAdminMessage(int boardNo) throws FaileDetailMessage;

	ArrayList<CompanyOrder> orderWaiting(int comNo) throws FailSelectOrder;

	ArrayList<CompanyOrder> orderMaking(int comNo) throws FailSelectOrder;

	ArrayList<CompanyOrder> orderDelivering(int comNo) throws FailSelectOrder;

	ArrayList<CompanyOrder> orderComplete(int comNo) throws FailSelectOrder;

	int acceptOrder(CompanySales comsales) throws FailUpdateOrderStatus;

	int refuseOrder(int orderNoInt) throws FailUpdateOrderStatus;

	ArrayList<CompanyOrder> orderRefuseList(int comNo) throws FailSelectOrder;

	ArrayList<CompanyEmployee> remainDeliveryMan(int comNo) throws FailSelectDeliveryMan;

	int deliveryManUpdateM(int orderNoInt, int empNoInt) throws FailUpdateDelivery;

	int orderUpdateM(int orderNoInt) throws FailUpdateOrderStatus;

	int orderUpdateToComplete(int orderNoInt) throws FailUpdateOrderStatus;

	int orderUpdateToDelete(int orderNoInt) throws FailUpdateOrderStatus;

	int refuseListDelete(int orderNoInt) throws FailUpdateOrderStatus;

	ArrayList<CompanyEmployee> selectEmployeeList(int comNo) throws FailSelectEmployeeList;

	int inputEmployeeInfo(CompanyEmployee ce) throws FailInsertEmployeeInfo;

	int deleteEmployeeInfo(ArrayList<Integer> list) throws FailUpdateEmployeeInfo;

	ArrayList<CompanyBoard> selectCompanyReview(int comNo) throws FailSelectCompanyReview;

	ArrayList<CompanyMaterial> orderStrok() throws FailSelectOrderStock;

	int applyStock(ArrayList<CompanyOrderStock> list) throws FailInsertOrderStock;

	ArrayList<CompanyOrderStock> selectOrderStockList(int comNo) throws FailSelectOrderStock;

	int receiptConfirm(ArrayList<Integer> orderMno) throws FailInsertOrderStock;

	ArrayList<CompanyOrderStock> selectReceiptList(int comNo) throws FailSelectOrderStock;

	ArrayList<CompanyRemainMaterial> selectAllMaterialList(int comNo) throws FailSelectOrderStock;

	ArrayList<CompanySales> selectAllCompanySales(int comNo) throws FailSelectCompanySales;

	HashMap<String, ArrayList<CompanySalesList>> selectCompanySalesList(int comNo) throws FailSelectCompanySales;

	ArrayList<CompanyCalendar> calendarDetail(CompanyCalendar cc) throws FailSelectCalendar;

	int insertCalendarData(CompanyCalendar cc) throws FailChangeCalendarDate;

	int deleteCalendarData(CompanyCalendar cc) throws FailChangeCalendarDate;

	int reflectModify(CompanyCalendar cc) throws FailChangeCalendarDate;

	ArrayList<CompanyOrder> orderDeliveringSocket(int comNo) throws Exception;

	//ArrayList<CompanyCalendar> selectMemberCalendar(int memberNo) throws FailSelectCalendar;



}
