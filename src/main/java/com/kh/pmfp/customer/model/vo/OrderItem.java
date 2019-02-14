package com.kh.pmfp.customer.model.vo;

import java.io.Serializable;

public class OrderItem implements Serializable {
	/*ORDER_INO,ORDER_NO,ORDER_ICATEG,ORDER_ISIZE*/
	private int orderIno;
	private int orderNo;
	private int orderIcateg;
	private String orderIsize;
	
	public OrderItem() {}

	public OrderItem(int orderIno, int orderNo, int orderIcateg, String orderIsize) {
		super();
		this.orderIno = orderIno;
		this.orderNo = orderNo;
		this.orderIcateg = orderIcateg;
		this.orderIsize = orderIsize;
	}

	public int getOrderIno() {
		return orderIno;
	}

	public void setOrderIno(int orderIno) {
		this.orderIno = orderIno;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getOrderIcateg() {
		return orderIcateg;
	}

	public void setOrderIcateg(int orderIcateg) {
		this.orderIcateg = orderIcateg;
	}

	public String getOrderIsize() {
		return orderIsize;
	}

	public void setOrderIsize(String orderIsize) {
		this.orderIsize = orderIsize;
	}

	@Override
	public String toString() {
		return "OrderItem [orderIno=" + orderIno + ", orderNo=" + orderNo + ", orderIcateg=" + orderIcateg
				+ ", orderIsize=" + orderIsize + "]";
	}
	
	
}
