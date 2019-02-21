package com.kh.pmfp.customer.model.vo;

import java.io.Serializable;
import java.util.ArrayList;

public class OrderItem implements Serializable {
	private int orderIno;
	private int orderNo;
	private int orderIcateg;
	private String orderIsize;
	private int orderTcount;
	private ArrayList<OrderTopping> orderTopping;
	
	public OrderItem() {}

	public OrderItem(int orderIno, int orderNo, int orderIcateg, String orderIsize, int orderTcount,
			ArrayList<OrderTopping> orderTopping) {
		super();
		this.orderIno = orderIno;
		this.orderNo = orderNo;
		this.orderIcateg = orderIcateg;
		this.orderIsize = orderIsize;
		this.orderTcount = orderTcount;
		this.orderTopping = orderTopping;
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

	public int getOrderTcount() {
		return orderTcount;
	}

	public void setOrderTcount(int orderTcount) {
		this.orderTcount = orderTcount;
	}

	public ArrayList<OrderTopping> getOrderTopping() {
		return orderTopping;
	}

	public void setOrderTopping(ArrayList<OrderTopping> orderTopping) {
		this.orderTopping = orderTopping;
	}

	@Override
	public String toString() {
		return "OrderItem [orderIno=" + orderIno + ", orderNo=" + orderNo + ", orderIcateg=" + orderIcateg
				+ ", orderIsize=" + orderIsize + ", orderTcount=" + orderTcount + ", orderTopping=" + orderTopping
				+ "]";
	}
	
	
}
