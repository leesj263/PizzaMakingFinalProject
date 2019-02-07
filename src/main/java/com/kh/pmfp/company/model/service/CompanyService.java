package com.kh.pmfp.company.model.service;

import java.util.ArrayList;

import com.kh.pmfp.company.model.exception.FailSelectAdminMessage;
import com.kh.pmfp.company.model.exception.FailSelectDeliveryMan;
import com.kh.pmfp.company.model.exception.FailSelectOrder;
import com.kh.pmfp.company.model.exception.FailUpdateOrderStatus;
import com.kh.pmfp.company.model.exception.FaileDetailMessage;
import com.kh.pmfp.company.model.vo.CompanyBoard;
import com.kh.pmfp.company.model.vo.CompanyEmployee;
import com.kh.pmfp.company.model.vo.CompanyOrder;

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

}
