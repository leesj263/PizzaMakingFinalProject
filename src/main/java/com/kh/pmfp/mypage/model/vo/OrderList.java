package com.kh.pmfp.mypage.model.vo;

public class OrderList implements java.io.Serializable{
	private int orderNo;
	private String orderMaterial;
	private String orderMethod;
	private String comName;
	private int payPrice;
	
	public OrderList() {}

	public OrderList(int orderNo, String orderMaterial, String orderMethod, String comName, int payPrice) {
		super();
		this.orderNo = orderNo;
		this.orderMaterial = orderMaterial;
		this.orderMethod = orderMethod;
		this.comName = comName;
		this.payPrice = payPrice;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getOrderMaterial() {
		return orderMaterial;
	}

	public void setOrderMaterial(String orderMaterial) {
		this.orderMaterial = orderMaterial;
	}

	public String getOrderMethod() {
		return orderMethod;
	}

	public void setOrderMethod(String orderMethod) {
		this.orderMethod = orderMethod;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public int getPayPrice() {
		return payPrice;
	}

	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}

	@Override
	public String toString() {
		return "OrderList [orderNo=" + orderNo + ", orderMaterial=" + orderMaterial + ", orderMethod=" + orderMethod
				+ ", comName=" + comName + ", payPrice=" + payPrice + "]";
	}
	
	
}
