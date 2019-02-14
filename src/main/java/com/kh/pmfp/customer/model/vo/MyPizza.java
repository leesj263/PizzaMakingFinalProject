package com.kh.pmfp.customer.model.vo;

import java.io.Serializable;

public class MyPizza implements Serializable {
	private int mypizzaNo;
	private int orderIno;
	private int memberNo;
	private String mypizzaName;
	private int materialNo;
	private int materialCateg;
	private int orderTcount;
	
	public MyPizza() {}

	public MyPizza(int mypizzaNo, int orderIno, int memberNo, String mypizzaName, int materialNo, int materialCateg,
			int orderTcount) {
		super();
		this.mypizzaNo = mypizzaNo;
		this.orderIno = orderIno;
		this.memberNo = memberNo;
		this.mypizzaName = mypizzaName;
		this.materialNo = materialNo;
		this.materialCateg = materialCateg;
		this.orderTcount = orderTcount;
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

	public int getMaterialNo() {
		return materialNo;
	}

	public void setMaterialNo(int materialNo) {
		this.materialNo = materialNo;
	}

	public int getMaterialCateg() {
		return materialCateg;
	}

	public void setMaterialCateg(int materialCateg) {
		this.materialCateg = materialCateg;
	}

	public int getOrderTcount() {
		return orderTcount;
	}

	public void setOrderTcount(int orderTcount) {
		this.orderTcount = orderTcount;
	}

	@Override
	public String toString() {
		return "MyPizza [mypizzaNo=" + mypizzaNo + ", orderIno=" + orderIno + ", memberNo=" + memberNo
				+ ", mypizzaName=" + mypizzaName + ", materialNo=" + materialNo + ", materialCateg=" + materialCateg
				+ ", orderTcount=" + orderTcount + "]";
	}

	
}
