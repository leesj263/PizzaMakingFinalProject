package com.kh.pmfp.company.model.vo;

import java.sql.Date;

public class CompanyOrderStock implements java.io.Serializable{
	private int orderMNo;
	private int comNo;
	private int materialNo;
	private Date orderMDate;
	private int orderMStatus;
	private String orderMCalculate;
	private int orderExpenseNo;
	private int materialWeight;
	private int materialPrice;
	private String materialName;
	
	public CompanyOrderStock() {
		
	}

	public CompanyOrderStock(int orderMNo, int comNo, int materialNo, Date orderMDate, int orderMStatus,
			String orderMCalculate, int orderExpenseNo, int materialWeight, int materialPrice, String materialName) {
		super();
		this.orderMNo = orderMNo;
		this.comNo = comNo;
		this.materialNo = materialNo;
		this.orderMDate = orderMDate;
		this.orderMStatus = orderMStatus;
		this.orderMCalculate = orderMCalculate;
		this.orderExpenseNo = orderExpenseNo;
		this.materialWeight = materialWeight;
		this.materialPrice = materialPrice;
		this.materialName = materialName;
	}

	public int getOrderMNo() {
		return orderMNo;
	}

	public void setOrderMNo(int orderMNo) {
		this.orderMNo = orderMNo;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public int getMaterialNo() {
		return materialNo;
	}

	public void setMaterialNo(int materialNo) {
		this.materialNo = materialNo;
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

	public String getOrderMCalculate() {
		return orderMCalculate;
	}

	public void setOrderMCalculate(String orderMCalculate) {
		this.orderMCalculate = orderMCalculate;
	}

	public int getOrderExpenseNo() {
		return orderExpenseNo;
	}

	public void setOrderExpenseNo(int orderExpenseNo) {
		this.orderExpenseNo = orderExpenseNo;
	}

	public int getMaterialWeight() {
		return materialWeight;
	}

	public void setMaterialWeight(int materialWeight) {
		this.materialWeight = materialWeight;
	}

	public int getMaterialPrice() {
		return materialPrice;
	}

	public void setMaterialPrice(int materialPrice) {
		this.materialPrice = materialPrice;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	@Override
	public String toString() {
		return "CompanyOrderStock [orderMNo=" + orderMNo + ", comNo=" + comNo + ", materialNo=" + materialNo
				+ ", orderMDate=" + orderMDate + ", orderMStatus=" + orderMStatus + ", orderMCalculate="
				+ orderMCalculate + ", orderExpenseNo=" + orderExpenseNo + ", materialWeight=" + materialWeight
				+ ", materialPrice=" + materialPrice + ", materialName=" + materialName + "]";
	}

	
	
	
	
}
