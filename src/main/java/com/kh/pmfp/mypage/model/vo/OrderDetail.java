package com.kh.pmfp.mypage.model.vo;

import java.sql.Date;

public class OrderDetail implements java.io.Serializable{
	private int orderNo;
	private int orderMethod;
	private String orderReceiver;
	private String orderRtel;
	private Date orderDate;
	private int payPrice;
	private int deliveryNo;
	private int comNo;
	private int memberNo;
	
	private String orderIsize;
	private int orderTcount;
	private int orderTcount2;
	
	private int materialNo;
	private String materialName;
	private String materialName2;
	private int materialSellprice;
	private int materialCateg;
	
	private String deliveryName;
	private String deliveryAddr;
	private String comName;
	
	private int discount;
	private int couponCateg;
	private String couponName;
	
	private double rDiscount;
	private int pDiscount;
	
	public OrderDetail() {}

	public OrderDetail(int orderNo, int memberNo) {
		super();
		this.orderNo = orderNo;
		this.memberNo = memberNo;
	}
	
	
	public OrderDetail(int orderNo, int orderMethod, String orderReceiver, String orderRtel, Date orderDate,
			int payPrice, int deliveryNo, int comNo, int memberNo, String orderIsize, int orderTcount, int orderTcount2,
			String materialName, String materialName2, int materialSellprice, String deliveryName, String deliveryAddr,
			String comName, int discount, int couponCateg, String couponName, int rDiscount, int pDiscount,int materialNo,int materialCateg) {
		super();
		this.materialCateg=materialCateg;
		this.materialNo=materialNo;
		this.orderNo = orderNo;
		this.orderMethod = orderMethod;
		this.orderReceiver = orderReceiver;
		this.orderRtel = orderRtel;
		this.orderDate = orderDate;
		this.payPrice = payPrice;
		this.deliveryNo = deliveryNo;
		this.comNo = comNo;
		this.memberNo = memberNo;
		this.orderIsize = orderIsize;
		this.orderTcount = orderTcount;
		this.orderTcount2 = orderTcount2;
		this.materialName = materialName;
		this.materialName2 = materialName2;
		this.materialSellprice = materialSellprice;
		this.deliveryName = deliveryName;
		this.deliveryAddr = deliveryAddr;
		this.comName = comName;
		this.discount = discount;
		this.couponCateg = couponCateg;
		this.couponName = couponName;
		this.rDiscount = rDiscount;
		this.pDiscount = pDiscount;
	}

	
	
	public int getMaterialCateg() {
		return materialCateg;
	}

	public void setMaterialCateg(int materialCateg) {
		this.materialCateg = materialCateg;
	}

	public int getMaterialNo() {
		return materialNo;
	}

	public void setMaterialNo(int materialNo) {
		this.materialNo = materialNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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

	public int getPayPrice() {
		return payPrice;
	}

	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}

	public int getDeliveryNo() {
		return deliveryNo;
	}

	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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

	public int getOrderTcount2() {
		return orderTcount2;
	}

	public void setOrderTcount2(int orderTcount2) {
		this.orderTcount2 = orderTcount2;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	public String getMaterialName2() {
		return materialName2;
	}

	public void setMaterialName2(String materialName2) {
		this.materialName2 = materialName2;
	}

	public int getMaterialSellprice() {
		return materialSellprice;
	}

	public void setMaterialSellprice(int materialSellprice) {
		this.materialSellprice = materialSellprice;
	}

	public String getDeliveryName() {
		return deliveryName;
	}

	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}

	public String getDeliveryAddr() {
		return deliveryAddr;
	}

	public void setDeliveryAddr(String deliveryAddr) {
		this.deliveryAddr = deliveryAddr;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getCouponCateg() {
		return couponCateg;
	}

	public void setCouponCateg(int couponCateg) {
		this.couponCateg = couponCateg;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public double getrDiscount() {
		return rDiscount;
	}

	public void setrDiscount(double rDiscount) {
		this.rDiscount = rDiscount;
	}

	public int getpDiscount() {
		return pDiscount;
	}

	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}

	@Override
	public String toString() {
		return "OrderDetail [orderNo=" + orderNo + ", orderMethod=" + orderMethod + ", orderReceiver=" + orderReceiver
				+ ", orderRtel=" + orderRtel + ", orderDate=" + orderDate + ", payPrice=" + payPrice + ", deliveryNo="
				+ deliveryNo + ", comNo=" + comNo + ", memberNo=" + memberNo + ", orderIsize=" + orderIsize
				+ ", orderTcount=" + orderTcount + ", orderTcount2=" + orderTcount2 + ", materialNo=" + materialNo
				+ ", materialName=" + materialName + ", materialName2=" + materialName2 + ", materialSellprice="
				+ materialSellprice + ", materialCateg=" + materialCateg + ", deliveryName=" + deliveryName
				+ ", deliveryAddr=" + deliveryAddr + ", comName=" + comName + ", discount=" + discount
				+ ", couponCateg=" + couponCateg + ", couponName=" + couponName + ", rDiscount=" + rDiscount
				+ ", pDiscount=" + pDiscount + "]";
	}
	
	

	



	
	

	





	
	
}
