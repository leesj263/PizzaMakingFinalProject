package com.kh.pmfp.admin.model.vo;

import java.sql.Date;

public class AdminMSales {

	private int salesNo;
	private int comNo;
	private String comName;
	private Date salesInputDate;
	private String salesDate;
	private int salesCate;
	private int expenseNo;
	private int orderNo;
	private int salesPrice;
	private int mNo;
	private int mCate;
	private String mName;
	private String mSize;
	private int tCount;
	private int mPrice;
	
	public AdminMSales() {}

	public AdminMSales(int salesNo, int comNo, String comName, Date salesInputDate, String salesDate, int salesCate,
			int expenseNo, int orderNo, int salesPrice, int mNo, int mCate, String mName, String mSize, int tCount,
			int mPrice) {
		super();
		this.salesNo = salesNo;
		this.comNo = comNo;
		this.comName = comName;
		this.salesInputDate = salesInputDate;
		this.salesDate = salesDate;
		this.salesCate = salesCate;
		this.expenseNo = expenseNo;
		this.orderNo = orderNo;
		this.salesPrice = salesPrice;
		this.mNo = mNo;
		this.mCate = mCate;
		this.mName = mName;
		this.mSize = mSize;
		this.tCount = tCount;
		this.mPrice = mPrice;
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

	public String getSalesDate() {
		return salesDate;
	}

	public void setSalesDate(String salesDate) {
		this.salesDate = salesDate;
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

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getmCate() {
		return mCate;
	}

	public void setmCate(int mCate) {
		this.mCate = mCate;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmSize() {
		return mSize;
	}

	public void setmSize(String mSize) {
		this.mSize = mSize;
	}

	public int gettCount() {
		return tCount;
	}

	public void settCount(int tCount) {
		this.tCount = tCount;
	}

	public int getmPrice() {
		return mPrice;
	}

	public void setmPrice(int mPrice) {
		this.mPrice = mPrice;
	}

	@Override
	public String toString() {
		return "AdminMSales [salesNo=" + salesNo + ", comNo=" + comNo + ", comName=" + comName + ", salesInputDate="
				+ salesInputDate + ", salesDate=" + salesDate + ", salesCate=" + salesCate + ", expenseNo=" + expenseNo
				+ ", orderNo=" + orderNo + ", salesPrice=" + salesPrice + ", mNo=" + mNo + ", mCate=" + mCate
				+ ", mName=" + mName + ", mSize=" + mSize + ", tCount=" + tCount + ", mPrice=" + mPrice + "]";
	}
	
	
}
