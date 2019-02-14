package com.kh.pmfp.admin.model.vo;

import java.sql.Date;

public class AdminOrder implements java.io.Serializable{
	
	private int orderNo;
	private int memberNo;
	private String memberName;
	private String memberId;
	private int orderMethod;
	private String receiver;
	private String orderTel;
	private Date orderDate;
	private String orderSDate;
	private Date orderReserveTime;
	private String orderPayno;
	private int orderPayPrice;
	private String orderStatus;
	private int deliveryNo;
	private int empNo;
	private int comNo;
	private String comName;
	
	public AdminOrder() {}

	public AdminOrder(int orderNo, int memberNo, String memberName, String memberId, int orderMethod, String receiver,
			String orderTel, Date orderDate, String orderSDate, Date orderReserveTime, String orderPayno,
			int orderPayPrice, String orderStatus, int deliveryNo, int empNo, int comNo, String comName) {
		super();
		this.orderNo = orderNo;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberId = memberId;
		this.orderMethod = orderMethod;
		this.receiver = receiver;
		this.orderTel = orderTel;
		this.orderDate = orderDate;
		this.orderSDate = orderSDate;
		this.orderReserveTime = orderReserveTime;
		this.orderPayno = orderPayno;
		this.orderPayPrice = orderPayPrice;
		this.orderStatus = orderStatus;
		this.deliveryNo = deliveryNo;
		this.empNo = empNo;
		this.comNo = comNo;
		this.comName = comName;
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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public String getOrderSDate() {
		return orderSDate;
	}

	public void setOrderSDate(String orderSDate) {
		this.orderSDate = orderSDate;
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

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	@Override
	public String toString() {
		return "AdminOrder [orderNo=" + orderNo + ", memberNo=" + memberNo + ", memberName=" + memberName
				+ ", memberId=" + memberId + ", orderMethod=" + orderMethod + ", receiver=" + receiver + ", orderTel="
				+ orderTel + ", orderDate=" + orderDate + ", orderSDate=" + orderSDate + ", orderReserveTime="
				+ orderReserveTime + ", orderPayno=" + orderPayno + ", orderPayPrice=" + orderPayPrice
				+ ", orderStatus=" + orderStatus + ", deliveryNo=" + deliveryNo + ", empNo=" + empNo + ", comNo="
				+ comNo + ", comName=" + comName + "]";
	}

	
}
