package com.kh.pmfp.common.model.vo;

import java.io.Serializable;

public class Company implements Serializable{

	private int comNo;				//업체번호
	private String comName;			//지점명
	private String comAddress;		//주소
	private String comTel;			//전화번호
	private String comLisenseno; 	//사업자번호
	private String comStatus;		//영업상태
	private String comSalestime;	//영업시간
	private String comLocation;		//위치정보
	private String comParking;		//주차정보
	
	public Company() {}
	
	public Company(int comNo, String comName, String comAddress, String comTel, String comLisenseno, String comStatus,
			String comSalestime, String comLocation, String comParking) {
		super();
		this.comNo = comNo;
		this.comName = comName;
		this.comAddress = comAddress;
		this.comTel = comTel;
		this.comLisenseno = comLisenseno;
		this.comStatus = comStatus;
		this.comSalestime = comSalestime;
		this.comLocation = comLocation;
		this.comParking = comParking;
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

	@Override
	public String toString() {
		return "Company [comNo=" + comNo + ", comName=" + comName + ", comAddress=" + comAddress + ", comTel=" + comTel
				+ ", comLisenseno=" + comLisenseno + ", comStatus=" + comStatus + ", comSalestime=" + comSalestime
				+ ", comLocation=" + comLocation + ", comParking=" + comParking + "]";
	}
	
	
	
	
}
