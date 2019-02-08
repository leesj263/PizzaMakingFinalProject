package com.kh.pmfp.customer.model.vo;

import java.io.Serializable;

public class MyPizza implements Serializable {
	private int mypizzaNo;
	private int orderIno;
	private int memberNo;
	private String mypizzaName;
	
	public MyPizza() {}

	public MyPizza(int mypizzaNo, int orderIno, int memberNo, String mypizzaName) {
		super();
		this.mypizzaNo = mypizzaNo;
		this.orderIno = orderIno;
		this.memberNo = memberNo;
		this.mypizzaName = mypizzaName;
	}

	public int getMypizzaNo() {
		return mypizzaNo;
	}

	public void setMypizzaNo(int mypizzaNo) {
		this.mypizzaNo = mypizzaNo;
	}

	public int getOrderIno() {
		return orderIno;
	}

	public void setOrderIno(int orderIno) {
		this.orderIno = orderIno;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMypizzaName() {
		return mypizzaName;
	}

	public void setMypizzaName(String mypizzaName) {
		this.mypizzaName = mypizzaName;
	}

	@Override
	public String toString() {
		return "MyPizza [mypizzaNo=" + mypizzaNo + ", orderIno=" + orderIno + ", memberNo=" + memberNo
				+ ", mypizzaName=" + mypizzaName + "]";
	}
	
	
}
