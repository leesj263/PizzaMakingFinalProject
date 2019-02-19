package com.kh.pmfp.customer.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class OrderMain implements java.io.Serializable {
	/*ORDER_NO	NUMBER(10,0)
	MEMBER_NO	NUMBER(10,0)
	ORDER_METHOD	NUMBER(1,0)
	ORDER_RECEIVER	NVARCHAR2(20 CHAR)
	ORDER_RTEL	VARCHAR2(13 BYTE)
	ORDER_DATE	DATE
	ORDER_RESERVETIME	DATE
	ORDER_PAYNO	VARCHAR2(50 BYTE)
	ORDER_PAYPRICE	NUMBER(10,0)
	ORDER_STATUS	NUMBER(1,0)
	DELIVERY_NO	NUMBER(10,0)
	EMP_NO	NUMBER(10,0)
	COM_NO	NUMBER(10,0)*/
	
	private int orderNo;
	private int memberNo;
	private int orderMethod;
	private String orderReceiver;
	private String orderRtel;
	private Date orderDate;
	private Date orderReservetime;
	private String orderPayno;
	private int orderPayprice;
	private int orderStatus;
	private int deliveryNo;
	private int empNo;
	private int comNo;
	
	public OrderMain() {}

	public OrderMain(int orderNo, int memberNo, int orderMethod, String orderReceiver, String orderRtel, Date orderDate,
			Date orderReservetime, String orderPayno, int orderPayprice, int orderStatus, int deliveryNo, int empNo,
			int comNo) {
		super();
		this.orderNo = orderNo;
		this.memberNo = memberNo;
		this.orderMethod = orderMethod;
		this.orderReceiver = orderReceiver;
		this.orderRtel = orderRtel;
		this.orderDate = orderDate;
		this.orderReservetime = orderReservetime;
		this.orderPayno = orderPayno;
		this.orderPayprice = orderPayprice;
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

	public String getOrderReceiver() {
		return orderReceiver;
	}

	public void setOrderReceiver(String orderReceiver) {
		this.orderReceiver = orderReceiver;
	}

	public String getOrderRtel() {
		return orderRtel;
	}

	public void setOrderRtel(String orderRtel) {
		this.orderRtel = orderRtel;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getOrderReservetime() {
		return orderReservetime;
	}

	public void setOrderReservetime(Date orderReservetime) {
		this.orderReservetime = orderReservetime;
	}

	public String getOrderPayno() {
		return orderPayno;
	}

	public void setOrderPayno(String orderPayno) {
		this.orderPayno = orderPayno;
	}

	public int getOrderPayprice() {
		return orderPayprice;
	}

	public void setOrderPayprice(int orderPayprice) {
		this.orderPayprice = orderPayprice;
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

	@Override
	public String toString() {
		return "OrderMain [orderNo=" + orderNo + ", memberNo=" + memberNo + ", orderMethod=" + orderMethod
				+ ", orderReceiver=" + orderReceiver + ", orderRtel=" + orderRtel + ", orderDate=" + orderDate
				+ ", orderReservetime=" + orderReservetime + ", orderPayno=" + orderPayno + ", orderPayprice="
				+ orderPayprice + ", orderStatus=" + orderStatus + ", deliveryNo=" + deliveryNo + ", empNo=" + empNo
				+ ", comNo=" + comNo + "]";
	}
	
	
}
