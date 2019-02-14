package com.kh.pmfp.admin.model.vo;

import java.sql.Date;

public class AdminCalculateList {

	private int orderExpNo;
	private Date orderExpMonth;
	private int comNo;
	private String comName;
	private String orderCStatus;
	private int price;
	private int times;
	private String orderList;
	private String dateList;
	private int rn;
	
	public AdminCalculateList() {}

	public AdminCalculateList(int orderExpNo, Date orderExpMonth, int comNo, String comName, String orderCStatus,
			int price, int times, String orderList, String dateList, int rn) {
		super();
		this.orderExpNo = orderExpNo;
		this.orderExpMonth = orderExpMonth;
		this.comNo = comNo;
		this.comName = comName;
		this.orderCStatus = orderCStatus;
		this.price = price;
		this.times = times;
		this.orderList = orderList;
		this.dateList = dateList;
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

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public String getOrderList() {
		return orderList;
	}

	public void setOrderList(String orderList) {
		this.orderList = orderList;
	}

	public String getDateList() {
		return dateList;
	}

	public void setDateList(String dateList) {
		this.dateList = dateList;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	@Override
	public String toString() {
		return "AdminCalculateList [orderExpNo=" + orderExpNo + ", orderExpMonth=" + orderExpMonth + ", comNo=" + comNo
				+ ", comName=" + comName + ", orderCStatus=" + orderCStatus + ", price=" + price + ", times=" + times
				+ ", orderList=" + orderList + ", dateList=" + dateList + ", rn=" + rn + "]";
	}
	
	
}
