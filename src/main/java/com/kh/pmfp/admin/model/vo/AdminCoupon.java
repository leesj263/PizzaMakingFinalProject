package com.kh.pmfp.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;



@org.springframework.stereotype.Component
public class AdminCoupon implements Serializable{

	private int couponNo;		//생성쿠폰코드
	private String couponName;	//쿠폰이름
	private int couponCateg;	//카테고리
	private int couponCondition;//사용조건
	private Date couponCdate;	//생성일
	private Date couponEdate;	//유효기간
	private double couponRdiscount;	//할인율
	private int couponPdiscount;	//할인금액


	
	public AdminCoupon() {}



	public AdminCoupon(int couponNo, String couponName, int couponCateg, int couponCondition, Date couponCdate,
			Date couponEdate, double couponRdiscount, int couponPdiscount) {
		super();
		this.couponNo = couponNo;
		this.couponName = couponName;
		this.couponCateg = couponCateg;
		this.couponCondition = couponCondition;
		this.couponCdate = couponCdate;
		this.couponEdate = couponEdate;
		this.couponRdiscount = couponRdiscount;
		this.couponPdiscount = couponPdiscount;
	}



	public int getCouponNo() {
		return couponNo;
	}



	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}



	public String getCouponName() {
		return couponName;
	}



	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}



	public int getCouponCateg() {
		return couponCateg;
	}



	public void setCouponCateg(int couponCateg) {
		this.couponCateg = couponCateg;
	}



	public int getCouponCondition() {
		return couponCondition;
	}



	public void setCouponCondition(int couponCondition) {
		this.couponCondition = couponCondition;
	}



	public Date getCouponCdate() {
		return couponCdate;
	}



	public void setCouponCdate(Date couponCdate) {
		this.couponCdate = couponCdate;
	}



	public Date getCouponEdate() {
		return couponEdate;
	}



	public void setCouponEdate(Date couponEdate) {
		this.couponEdate = couponEdate;
	}



	public double getCouponRdiscount() {
		return couponRdiscount;
	}



	public void setCouponRdiscount(double couponRdiscount) {
		this.couponRdiscount = couponRdiscount;
	}



	public int getCouponPdiscount() {
		return couponPdiscount;
	}



	public void setCouponPdiscount(int couponPdiscount) {
		this.couponPdiscount = couponPdiscount;
	}



	@Override
	public String toString() {
		return "AdminCoupon [couponNo=" + couponNo + ", couponName=" + couponName + ", couponCateg=" + couponCateg
				+ ", couponCondition=" + couponCondition + ", couponCdate=" + couponCdate + ", couponEdate="
				+ couponEdate + ", couponRdiscount=" + couponRdiscount + ", couponPdiscount=" + couponPdiscount + "]";
	}

	
	
	
}
