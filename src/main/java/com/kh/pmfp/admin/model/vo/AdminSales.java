package com.kh.pmfp.admin.model.vo;

import java.sql.Date;

public class AdminSales {
	
	private int salesNo;
	private int comNo;
	private String comName;
	private Date salesInputDate;
	private int salesCate;
	private int expenseNo;
	private int orderNo;
	private int salesPrice;
	
	public AdminSales() {}

	public AdminSales(int salesCate) {
		super();
		this.salesCate=salesCate;
	}
	
	public AdminSales(int salesNo, int comNo, String comName, Date salesInputDate, int salesCate, int expenseNo,
			int orderNo, int salesPrice) {
		super();
		this.salesNo = salesNo;
		this.comNo = comNo;
		this.comName = comName;
		this.salesInputDate = salesInputDate;
		this.salesCate = salesCate;
		this.expenseNo = expenseNo;
		this.orderNo = orderNo;
		this.salesPrice = salesPrice;
	}

	public int getSalesNo() {
		return salesNo;
	}

	public void setSalesNo(int salesNo) {
		this.salesNo = salesNo;
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

	public Date getSalesInputDate() {
		return salesInputDate;
	}

	public void setSalesInputDate(Date salesInputDate) {
		this.salesInputDate = salesInputDate;
	}

	public int getSalesCate() {
		return salesCate;
	}

	public void setSalesCate(int salesCate) {
		this.salesCate = salesCate;
	}

	public int getExpenseNo() {
		return expenseNo;
	}

	public void setExpenseNo(int expenseNo) {
		this.expenseNo = expenseNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getSalesPrice() {
		return salesPrice;
	}

	public void setSalesPrice(int salesPrice) {
		this.salesPrice = salesPrice;
	}

	@Override
	public String toString() {
		return "AdminSales [salesNo=" + salesNo + ", comNo=" + comNo + ", comName=" + comName + ", salesInputDate="
				+ salesInputDate + ", salesCate=" + salesCate + ", expenseNo=" + expenseNo + ", orderNo=" + orderNo
				+ ", salesPrice=" + salesPrice + "]";
	}
	
	

}
