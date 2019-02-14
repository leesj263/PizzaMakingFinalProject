package com.kh.pmfp.customer.model.vo;

import java.io.Serializable;

public class OrderTopping implements Serializable {
	/*ORDER_INO,MATERIAL_NO,ORDER_TCOUNT*/
	private int orderIno;
	private int materialNo;
	private int orderTcount;
	
	public OrderTopping() {}

	public OrderTopping(int materialNo, int orderTcount) {
		super();
		this.materialNo = materialNo;
		this.orderTcount = orderTcount;
	}
	
	public OrderTopping(int orderIno, int materialNo, int orderTcount) {
		super();
		this.orderIno = orderIno;
		this.materialNo = materialNo;
		this.orderTcount = orderTcount;
	}

	public int getOrderIno() {
		return orderIno;
	}

	public void setOrderIno(int orderIno) {
		this.orderIno = orderIno;
	}

	public int getMaterialNo() {
		return materialNo;
	}

	public void setMaterialNo(int materialNo) {
		this.materialNo = materialNo;
	}

	public int getOrderTcount() {
		return orderTcount;
	}

	public void setOrderTcount(int orderTcount) {
		this.orderTcount = orderTcount;
	}

	@Override
	public String toString() {
		return "OrderTopping [orderIno=" + orderIno + ", materialNo=" + materialNo + ", orderTcount=" + orderTcount
				+ "]";
	}
	
	
}
