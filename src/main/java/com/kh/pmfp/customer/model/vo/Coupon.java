package com.kh.pmfp.customer.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Coupon implements Serializable {
	private int couponNo;
	private String couponName;
	private int couponCateg;
	private int couponCondition;
	private Date couponCdate;
	private Date couponEdate;
	private double couponRdiscount;
	private int couponPdiscount;
	private int issueNo;
	private int memberNo;
	private Date issueCdate;
	private Date issueEdate;
	private String issueStatus;
	private int orderNo;
	
	public Coupon() {}

	public Coupon(int couponNo, String couponName, int couponCateg, int couponCondition, Date couponCdate,
			Date couponEdate, double couponRdiscount, int couponPdiscount, int issueNo, int memberNo, Date issueCdate,
			Date issueEdate, String issueStatus, int orderNo) {
		super();
		this.couponNo = couponNo;
		this.couponName = couponName;
		this.couponCateg = couponCateg;
		this.couponCondition = couponCondition;
		this.couponCdate = couponCdate;
		this.couponEdate = couponEdate;
		this.couponRdiscount = couponRdiscount;
		this.couponPdiscount = couponPdiscount;
		this.issueNo = issueNo;
		this.memberNo = memberNo;
		this.issueCdate = issueCdate;
		this.issueEdate = issueEdate;
		this.issueStatus = issueStatus;
		this.orderNo = orderNo;
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

	public int getIssueNo() {
		return issueNo;
	}

	public void setIssueNo(int issueNo) {
		this.issueNo = issueNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Date getIssueCdate() {
		return issueCdate;
	}

	public void setIssueCdate(Date issueCdate) {
		this.issueCdate = issueCdate;
	}

	public Date getIssueEdate() {
		return issueEdate;
	}

	public void setIssueEdate(Date issueEdate) {
		this.issueEdate = issueEdate;
	}

	public String getIssueStatus() {
		return issueStatus;
	}

	public void setIssueStatus(String issueStatus) {
		this.issueStatus = issueStatus;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	@Override
	public String toString() {
		return "Coupon [couponNo=" + couponNo + ", couponName=" + couponName + ", couponCateg=" + couponCateg
				+ ", couponCondition=" + couponCondition + ", couponCdate=" + couponCdate + ", couponEdate="
				+ couponEdate + ", couponRdiscount=" + couponRdiscount + ", couponPdiscount=" + couponPdiscount
				+ ", issueNo=" + issueNo + ", memberNo=" + memberNo + ", issueCdate=" + issueCdate + ", issueEdate="
				+ issueEdate + ", issueStatus=" + issueStatus + ", orderNo=" + orderNo + "]";
	}
	
	
}
