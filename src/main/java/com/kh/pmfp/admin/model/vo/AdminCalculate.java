package com.kh.pmfp.admin.model.vo;

import java.sql.Date;

public class AdminCalculate {

	private int orderExpNo;
	private Date orderExpMonth;
	private Date orderMDate;
	private int comNo;
	private String comName;
	private String orderMStatus;
	private String orderCStatus;
	private int price;
	private String orderList;
	private int rn;
	
	public AdminCalculate() {}

	public AdminCalculate(int orderExpNo, Date orderExpMonth, Date orderMDate, int comNo, String comName,
			String orderMStatus, String orderCStatus, int price, String orderList, int rn) {
		super();
		this.orderExpNo = orderExpNo;
		this.orderExpMonth = orderExpMonth;
		this.orderMDate = orderMDate;
		this.comNo = comNo;
		this.comName = comName;
		this.orderMStatus = orderMStatus;
		this.orderCStatus = orderCStatus;
		this.price = price;
		this.orderList = orderList;
		this.rn = rn;
	}

	public int getOrderExpNo() {
		return orderExpNo;
	}

	public void setOrderExpNo(int orderExpNo) {
		this.orderExpNo = orderExpNo;
	}

	public Date getOrderExpMonth() {
		return orderExpMonth;
	}

	public void setOrderExpMonth(Date orderExpMonth) {
		this.orderExpMonth = orderExpMonth;
	}

	public Date getOrderMDate() {
		return orderMDate;
	}

	public void setOrderMDate(Date orderMDate) {
		this.orderMDate = orderMDate;
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

	public String getOrderMStatus() {
		return orderMStatus;
	}

	public void setOrderMStatus(String orderMStatus) {
		this.orderMStatus = orderMStatus;
	}

	public String getOrderCStatus() {
		return orderCStatus;
	}

	public void setOrderCStatus(String orderCStatus) {
		this.orderCStatus = orderCStatus;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getOrderList() {
		return orderList;
	}

	public void setOrderList(String orderList) {
		this.orderList = orderList;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	@Override
	public String toString() {
		return "AdminCalculate [orderExpNo=" + orderExpNo + ", orderExpMonth=" + orderExpMonth + ", orderMDate="
				+ orderMDate + ", comNo=" + comNo + ", comName=" + comName + ", orderMStatus=" + orderMStatus
				+ ", orderCStatus=" + orderCStatus + ", price=" + price + ", orderList=" + orderList + ", rn=" + rn
				+ "]";
	}

	
}
