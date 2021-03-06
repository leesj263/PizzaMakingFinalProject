package com.kh.pmfp.mypage.model.vo;

public class Coupon implements java.io.Serializable{
	private int issueNo;
	private String couponName;
	private String issueStatus;
	private String possiblePeriod;
	private String couponCondition;
	
	public Coupon() {}

	public Coupon(int issueNo, String couponName, String issueStatus, String possiblePeriod, String couponCondition) {
		super();
		this.issueNo = issueNo;
		this.couponName = couponName;
		this.issueStatus = issueStatus;
		this.possiblePeriod = possiblePeriod;
		this.couponCondition = couponCondition;
	}

	public int getIssueNo() {
		return issueNo;
	}

	public void setIssueNo(int issueNo) {
		this.issueNo = issueNo;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public String getIssueStatus() {
		return issueStatus;
	}

	public void setIssueStatus(String issueStatus) {
		this.issueStatus = issueStatus;
	}

	public String getPossiblePeriod() {
		return possiblePeriod;
	}

	public void setPossiblePeriod(String possiblePeriod) {
		this.possiblePeriod = possiblePeriod;
	}

	public String getCouponCondition() {
		return couponCondition;
	}

	public void setCouponCondition(String couponCondition) {
		this.couponCondition = couponCondition;
	}

	@Override
	public String toString() {
		return "Coupon [issueNo=" + issueNo + ", couponName=" + couponName + ", issueStatus=" + issueStatus
				+ ", possiblePeriod=" + possiblePeriod + ", couponCondition=" + couponCondition + "]";
	}

	
	
	
	
	
}
