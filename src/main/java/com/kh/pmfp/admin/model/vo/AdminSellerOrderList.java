package com.kh.pmfp.admin.model.vo;

import java.sql.Date;

public class AdminSellerOrderList {

	private int comNo;
	private String comName;
	private int orderExpenseNo;
	private Date orderMDate;
	private int orderMStatus;
	private String orderList;
	private String orderCal;
	private int rn;
	
	public AdminSellerOrderList() {}

	public AdminSellerOrderList(int comNo, String comName, int orderExpenseNo, Date orderMDate, int orderMStatus,
			String orderList, String orderCal, int rn) {
		super();
		this.comNo = comNo;
		this.comName = comName;
		this.orderExpenseNo = orderExpenseNo;
		this.orderMDate = orderMDate;
		this.orderMStatus = orderMStatus;
		this.orderList = orderList;
		this.orderCal = orderCal;
		this.rn=rn;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public int getOrderExpenseNo() {
		return orderExpenseNo;
	}

	public void setOrderExpenseNo(int orderExpenseNo) {
		this.orderExpenseNo = orderExpenseNo;
	}

	public Date getOrderMDate() {
		return orderMDate;
	}

	public void setOrderMDate(Date orderMDate) {
		this.orderMDate = orderMDate;
	}

	public int getOrderMStatus() {
		return orderMStatus;
	}

	public void setOrderMStatus(int orderMStatus) {
		this.orderMStatus = orderMStatus;
	}

	public String getOrderList() {
		return orderList;
	}

	public void setOrderList(String orderList) {
		this.orderList = orderList;
	}

	public String getOrderCal() {
		return orderCal;
	}

	public void setOrderCal(String orderCal) {
		this.orderCal = orderCal;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	@Override
	public String toString() {
		return "AdminSellerOrderList [comNo=" + comNo + ", comName=" + comName + ", orderExpenseNo=" + orderExpenseNo
				+ ", orderMDate=" + orderMDate + ", orderMStatus=" + orderMStatus + ", orderList=" + orderList
				+ ", orderCal=" + orderCal + ", rn=" + rn + "]";
	}

	
	
}
