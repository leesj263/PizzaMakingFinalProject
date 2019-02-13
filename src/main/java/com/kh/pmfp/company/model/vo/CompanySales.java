package com.kh.pmfp.company.model.vo;

import java.sql.Date;

public class CompanySales implements java.io.Serializable{
	private int salesNo;
	private int comNo;
	private Date salesInputdate;
	private int salesCateg;
	private int expenseNo;
	private int orderNo;
	private int salesPrice;
	
	public CompanySales() {
		
	}

	public CompanySales(int salesNo, int comNo, Date salesInputdate, int salesCateg, int expenseNo, int orderNo,
			int salesPrice) {
		super();
		this.salesNo = salesNo;
		this.comNo = comNo;
		this.salesInputdate = salesInputdate;
		this.salesCateg = salesCateg;
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

	public Date getSalesInputdate() {
		return salesInputdate;
	}

	public void setSalesInputdate(Date salesInputdate) {
		this.salesInputdate = salesInputdate;
	}

	public int getSalesCateg() {
		return salesCateg;
	}

	public void setSalesCateg(int salesCateg) {
		this.salesCateg = salesCateg;
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
		return "CompanySales [salesNo=" + salesNo + ", comNo=" + comNo + ", salesInputdate=" + salesInputdate
				+ ", salesCateg=" + salesCateg + ", expenseNo=" + expenseNo + ", orderNo=" + orderNo + ", salesPrice="
				+ salesPrice + "]";
	}
	
	
	
	
}
