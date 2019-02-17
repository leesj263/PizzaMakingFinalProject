package com.kh.pmfp.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AdminCoupon implements Serializable{

	private int couponNo;
	private String couponName;
	private int couponCateg;
	private int couponCondition;
	private Date couponCdate;
	private Date couponEdate;
	private double couponRdiscount;
	private int couponPdiscount;
	
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
