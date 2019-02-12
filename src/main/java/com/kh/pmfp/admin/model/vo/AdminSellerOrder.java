package com.kh.pmfp.admin.model.vo;

import java.sql.Date;

public class AdminSellerOrder {

	private int orderMno;
	private int comNo;
	private String orderCal;
	private String orderMStatus;
	private Date orderMDate;
	private int materialNo;
	private String materialName;
	private int weight;
	private int unit;
	private int materialWeight;
	private int price;
	private int rn;
	
	public AdminSellerOrder() {}

	public AdminSellerOrder(int orderMno, int comNo, String orderCal, String orderMStatus, Date orderMDate,
			int materialNo, String materialName, int weight, int unit, int materialWeight, int price, int rn) {
		super();
		this.orderMno = orderMno;
		this.comNo = comNo;
		this.orderCal = orderCal;
		this.orderMStatus = orderMStatus;
		this.orderMDate = orderMDate;
		this.materialNo = materialNo;
		this.materialName = materialName;
		this.weight = weight;
		this.unit = unit;
		this.materialWeight = materialWeight;
		this.price = price;
		this.rn = rn;
	}

	public int getOrderMno() {
		return orderMno;
	}

	public void setOrderMno(int orderMno) {
		this.orderMno = orderMno;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public String getOrderCal() {
		return orderCal;
	}

	public void setOrderCal(String orderCal) {
		this.orderCal = orderCal;
	}

	public String getOrderMStatus() {
		return orderMStatus;
	}

	public void setOrderMStatus(String orderMStatus) {
		this.orderMStatus = orderMStatus;
	}

	public Date getOrderMDate() {
		return orderMDate;
	}

	public void setOrderMDate(Date orderMDate) {
		this.orderMDate = orderMDate;
	}

	public int getMaterialNo() {
		return materialNo;
	}

	public void setMaterialNo(int materialNo) {
		this.materialNo = materialNo;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getUnit() {
		return unit;
	}

	public void setUnit(int unit) {
		this.unit = unit;
	}

	public int getMaterialWeight() {
		return materialWeight;
	}

	public void setMaterialWeight(int materialWeight) {
		this.materialWeight = materialWeight;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	@Override
	public String toString() {
		return "AdminSellerOrder [orderMno=" + orderMno + ", comNo=" + comNo + ", orderCal=" + orderCal
				+ ", orderMStatus=" + orderMStatus + ", orderMDate=" + orderMDate + ", materialNo=" + materialNo
				+ ", materialName=" + materialName + ", weight=" + weight + ", unit=" + unit + ", materialWeight="
				+ materialWeight + ", price=" + price + ", rn=" + rn + "]";
	}

	
}
