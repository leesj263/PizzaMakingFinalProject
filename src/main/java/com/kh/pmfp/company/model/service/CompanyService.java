package com.kh.pmfp.company.model.service;

import java.util.ArrayList;

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

public interface CompanyService {

	ArrayList<CompanyBoard> selectAdminMessage() throws FailSelectAdminMessage;

	CompanyBoard detailAdminMessage(int boardNo) throws FaileDetailMessage;

	ArrayList<CompanyOrder> orderWaiting() throws FailSelectOrder;

	ArrayList<CompanyOrder> orderMaking() throws FailSelectOrder;

	ArrayList<CompanyOrder> orderDelivering() throws FailSelectOrder;

	ArrayList<CompanyOrder> orderComplete() throws FailSelectOrder;

	int acceptOrder(int orderNoInt) throws FailUpdateOrderStatus;

	int refuseOrder(int orderNoInt) throws FailUpdateOrderStatus;

	ArrayList<CompanyOrder> orderRefuseList() throws FailSelectOrder;

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

}
