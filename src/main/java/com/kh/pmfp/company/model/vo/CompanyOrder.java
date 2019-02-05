package com.kh.pmfp.company.model.vo;

import java.sql.Date;

public class CompanyOrder implements java.io.Serializable{
	private int orderNo;
	private int memberNo;
	private int orderMethod;
	private String receiver;
	private String orderTel;
	private Date orderDate;
	private Date orderReserveTime;
	private String orderPayno;
	private int orderPayPrice;
	private int orderStatus;
	private int deliveryNo;
	private int empNo;
	private int comNo;
	private String deliveryAddress;
	private String deliveryName;
	private String addTopping;
	
	public CompanyOrder() {
		
	}

	public CompanyOrder(int orderNo, int memberNo, int orderMethod, String receiver, String orderTel, Date orderDate,
			Date orderReserveTime, String orderPayno, int orderPayPrice, int orderStatus, int deliveryNo, int empNo,
			int comNo, String deliveryAddress, String deliveryName, String addTopping) {
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
		this.deliveryAddress = deliveryAddress;
		this.deliveryName = deliveryName;
		this.addTopping = addTopping;
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

	public int getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
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

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public String getDeliveryName() {
		return deliveryName;
	}

	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}

	public String getAddTopping() {
		return addTopping;
	}

	public void setAddTopping(String addTopping) {
		this.addTopping = addTopping;
	}

	@Override
	public String toString() {
		return "CompanyOrder [orderNo=" + orderNo + ", memberNo=" + memberNo + ", orderMethod=" + orderMethod
				+ ", receiver=" + receiver + ", orderTel=" + orderTel + ", orderDate=" + orderDate
				+ ", orderReserveTime=" + orderReserveTime + ", orderPayno=" + orderPayno + ", orderPayPrice="
				+ orderPayPrice + ", orderStatus=" + orderStatus + ", deliveryNo=" + deliveryNo + ", empNo=" + empNo
				+ ", comNo=" + comNo + ", deliveryAddress=" + deliveryAddress + ", deliveryName=" + deliveryName
				+ ", addTopping=" + addTopping + "]";
	}

	
	
	
}
