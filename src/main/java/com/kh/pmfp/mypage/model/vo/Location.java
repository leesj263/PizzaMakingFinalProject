package com.kh.pmfp.mypage.model.vo;

import java.sql.Date;

public class Location implements java.io.Serializable {
	private int comNo;
	private String comName;
	private String comAddress;
	private String comTel;
	private String comLisenseNo;
	private String comStatus;
	private Date comDate;
	private String salesTime;
	private String comLocation;
	private String comParking;
	private String comConfirm;
	private Float lon;
	private Float lat;
	
	public Location() {}

	public Location(int comNo, String comName, String comAddress, String comTel, String comLisenseNo, String comStatus,
			Date comDate, String salesTime, String comLocation, String comParking, String comConfirm, Float lon,
			Float lat) {
		super();
		this.comNo = comNo;
		this.comName = comName;
		this.comAddress = comAddress;
		this.comTel = comTel;
		this.comLisenseNo = comLisenseNo;
		this.comStatus = comStatus;
		this.comDate = comDate;
		this.salesTime = salesTime;
		this.comLocation = comLocation;
		this.comParking = comParking;
		this.comConfirm = comConfirm;
		this.lon = lon;
		this.lat = lat;
	}
	
	public Location(String comName, Float lon, Float lat) {
		super();
		this.comName = comName;
		this.lon = lon;
		this.lat = lat;
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

	public String getComLisenseNo() {
		return comLisenseNo;
	}

	public void setComLisenseNo(String comLisenseNo) {
		this.comLisenseNo = comLisenseNo;
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

	public String getSalesTime() {
		return salesTime;
	}

	public void setSalesTime(String salesTime) {
		this.salesTime = salesTime;
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

	public Float getLon() {
		return lon;
	}

	public void setLon(Float lon) {
		this.lon = lon;
	}

	public Float getLat() {
		return lat;
	}

	public void setLat(Float lat) {
		this.lat = lat;
	}

	@Override
	public String toString() {
		return "Location [comNo=" + comNo + ", comName=" + comName + ", comAddress=" + comAddress + ", comTel=" + comTel
				+ ", comLisenseNo=" + comLisenseNo + ", comStatus=" + comStatus + ", comDate=" + comDate
				+ ", salesTime=" + salesTime + ", comLocation=" + comLocation + ", comParking=" + comParking
				+ ", comConfirm=" + comConfirm + ", lon=" + lon + ", lat=" + lat + "]";
	}
	
	
}
