package com.kh.pmfp.customer.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class DeliveryCompany implements Serializable {
	/*DELIVERY_NO
	MEMBER_NO
	COM_NO
	DELIVERY_ADDRESS
	DELIVERY_NAME
	DELIVERY_STATUS
	COM_NO
	COM_NAME
	COM_ADDRESS
	COM_TEL
	COM_LISENSENO
	COM_STATUS
	COM_DATE
	COM_SALESTIME
	COM_LOCATION
	COM_PARKING
	COM_CONFIRM
	LAT
	LON*/
	
	private int deliveryNo;
	private int memberNo;
	private int comNo;
	private String deliveryAddress;
	private String deliveryName;
	private String deliveryStatus;
	private String comName;
	private String comAddress;
	private String comTel;
	private String comLisenseno;
	private String comStatus;
	private Date comDate;
	private String comSalestime;
	private String comLocation;
	private String comParking;
	private String comConfirm;
	private double lat;
	private double lon;
	
	public DeliveryCompany() {}

	public DeliveryCompany(int deliveryNo, int memberNo, int comNo, String deliveryAddress, String deliveryName,
			String deliveryStatus, String comName, String comAddress, String comTel, String comLisenseno,
			String comStatus, Date comDate, String comSalestime, String comLocation, String comParking,
			String comConfirm, double lat, double lon) {
		super();
		this.deliveryNo = deliveryNo;
		this.memberNo = memberNo;
		this.comNo = comNo;
		this.deliveryAddress = deliveryAddress;
		this.deliveryName = deliveryName;
		this.deliveryStatus = deliveryStatus;
		this.comName = comName;
		this.comAddress = comAddress;
		this.comTel = comTel;
		this.comLisenseno = comLisenseno;
		this.comStatus = comStatus;
		this.comDate = comDate;
		this.comSalestime = comSalestime;
		this.comLocation = comLocation;
		this.comParking = comParking;
		this.comConfirm = comConfirm;
		this.lat = lat;
		this.lon = lon;
	}

	public int getDeliveryNo() {
		return deliveryNo;
	}

	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public String getComAddress() {
		return comAddress;
	}

	public void setComAddress(String comAddress) {
		this.comAddress = comAddress;
	}

	public String getComTel() {
		return comTel;
	}

	public void setComTel(String comTel) {
		this.comTel = comTel;
	}

	public String getComLisenseno() {
		return comLisenseno;
	}

	public void setComLisenseno(String comLisenseno) {
		this.comLisenseno = comLisenseno;
	}

	public String getComStatus() {
		return comStatus;
	}

	public void setComStatus(String comStatus) {
		this.comStatus = comStatus;
	}

	public Date getComDate() {
		return comDate;
	}

	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}

	public String getComSalestime() {
		return comSalestime;
	}

	public void setComSalestime(String comSalestime) {
		this.comSalestime = comSalestime;
	}

	public String getComLocation() {
		return comLocation;
	}

	public void setComLocation(String comLocation) {
		this.comLocation = comLocation;
	}

	public String getComParking() {
		return comParking;
	}

	public void setComParking(String comParking) {
		this.comParking = comParking;
	}

	public String getComConfirm() {
		return comConfirm;
	}

	public void setComConfirm(String comConfirm) {
		this.comConfirm = comConfirm;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLon() {
		return lon;
	}

	public void setLon(double lon) {
		this.lon = lon;
	}

	@Override
	public String toString() {
		return "DeliveryCompany [deliveryNo=" + deliveryNo + ", memberNo=" + memberNo + ", comNo=" + comNo
				+ ", deliveryAddress=" + deliveryAddress + ", deliveryName=" + deliveryName + ", deliveryStatus="
				+ deliveryStatus + ", comName=" + comName + ", comAddress=" + comAddress + ", comTel=" + comTel
				+ ", comLisenseno=" + comLisenseno + ", comStatus=" + comStatus + ", comDate=" + comDate
				+ ", comSalestime=" + comSalestime + ", comLocation=" + comLocation + ", comParking=" + comParking
				+ ", comConfirm=" + comConfirm + ", lat=" + lat + ", lon=" + lon + "]";
	}
	
	
	
}
