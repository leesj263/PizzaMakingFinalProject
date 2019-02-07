package com.kh.pmfp.admin.model.vo;

import java.sql.Date;

public class AdminOrder implements java.io.Serializable{
	
	private int orderNo;
	private int memberNo;
	private int orderMethod;
	private String receiver;
	private String orderTel;
	private Date orderDate;
	private Date orderReserveTime;
	private String orderPayno;
	private int orderPayPrice;
	private String orderStatus;
	private int deliveryNo;
	private int empNo;
	private int comNo;
	
	public AdminOrder() {}

	public AdminOrder(int orderNo, int memberNo, int orderMethod, String receiver, String orderTel, Date orderDate,
			Date orderReserveTime, String orderPayno, int orderPayPrice, String orderStatus, int deliveryNo, int empNo,
			int comNo) {
		super();
		this.orderNo = orderNo;
		this.memberNo = memberNo;
		this.orderMethod = orderMethod;
		this.receiver = receiver;
		this.orderTel = orderTel;
		this.orderDate = orderDate;
		this.orderReserveTime = orderReserveTime;
		this.orderPayno = orderPayno;
		this.orderPayPrice = orderPayPrice;
		this.orderStatus = orderStatus;
		this.deliveryNo = deliveryNo;
		this.empNo = empNo;
		this.comNo = comNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getOrderMethod() {
		return orderMethod;
	}

	public void setOrderMethod(int orderMethod) {
		this.orderMethod = orderMethod;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getOrderTel() {
		return orderTel;
	}

	public void setOrderTel(String orderTel) {
		this.orderTel = orderTel;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getOrderReserveTime() {
		return orderReserveTime;
	}

	public void setOrderReserveTime(Date orderReserveTime) {
		this.orderReserveTime = orderReserveTime;
	}

	public String getOrderPayno() {
		return orderPayno;
	}

	public void setOrderPayno(String orderPayno) {
		this.orderPayno = orderPayno;
	}

	public int getOrderPayPrice() {
		return orderPayPrice;
	}

	public void setOrderPayPrice(int orderPayPrice) {
		this.orderPayPrice = orderPayPrice;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getDeliveryNo() {
		return deliveryNo;
	}

	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	@Override
	public String toString() {
		return "AdminOrder [orderNo=" + orderNo + ", memberNo=" + memberNo + ", orderMethod=" + orderMethod
				+ ", receiver=" + receiver + ", orderTel=" + orderTel + ", orderDate=" + orderDate
				+ ", orderReserveTime=" + orderReserveTime + ", orderPayno=" + orderPayno + ", orderPayPrice="
				+ orderPayPrice + ", orderStatus=" + orderStatus + ", deliveryNo=" + deliveryNo + ", empNo=" + empNo
				+ ", comNo=" + comNo + "]";
	}

	
	
	
}
