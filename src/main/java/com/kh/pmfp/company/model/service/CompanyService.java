package com.kh.pmfp.company.model.service;

import java.util.ArrayList;

import com.kh.pmfp.company.model.exception.FailSelectAdminMessage;
import com.kh.pmfp.company.model.exception.FailSelectOrder;
import com.kh.pmfp.company.model.exception.FaileDetailMessage;
import com.kh.pmfp.company.model.vo.CompanyBoard;
import com.kh.pmfp.company.model.vo.CompanyOrder;

public interface CompanyService {

	ArrayList<CompanyBoard> selectAdminMessage() throws FailSelectAdminMessage;

	CompanyBoard detailAdminMessage(int boardNo) throws FaileDetailMessage;

	ArrayList<CompanyOrder> orderWaiting() throws FailSelectOrder;

	ArrayList<CompanyOrder> orderMaking() throws FailSelectOrder;

	ArrayList<CompanyOrder> orderDelivering() throws FailSelectOrder;

	ArrayList<CompanyOrder> orderComplete() throws FailSelectOrder;

}
