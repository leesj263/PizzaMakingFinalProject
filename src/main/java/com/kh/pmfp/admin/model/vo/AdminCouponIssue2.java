package com.kh.pmfp.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AdminCouponIssue2 implements Serializable{

	private int couponNo;		//생성쿠폰코드
	private String couponName;	//쿠폰이름
	private int couponCateg;	//카테고리
	private int couponCondition;//사용조건
	private Date couponCdate;	//생성일
	private Date couponEdate;	//유효기간
	private double couponRdiscount;	//할인율
	private int couponPdiscount;	//할인금액
	private int issueNo;		//발급쿠폰 번호
	private int memberNo;		//회원번호
	private Date issueCdate;	//발급일
	private String issueEdate;	//만료일
	private String issueStatus;	//사용여부
	private int orderNo;		//주문번호
	private String memberId;
	private String memberName;
	
	public AdminCouponIssue2() {}

	public AdminCouponIssue2(int couponNo, String couponName, int couponCateg, int couponCondition, Date couponCdate,
			Date couponEdate, double couponRdiscount, int couponPdiscount, int issueNo, int memberNo, Date issueCdate,
			String issueEdate, String issueStatus, int orderNo, String memberId, String memberName) {
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
		this.memberId = memberId;
		this.memberName = memberName;
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

	public String getIssueEdate() {
		return issueEdate;
	}

	public void setIssueEdate(String issueEdate) {
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "AdminCouponIssue2 [couponNo=" + couponNo + ", couponName=" + couponName + ", couponCateg=" + couponCateg
				+ ", couponCondition=" + couponCondition + ", couponCdate=" + couponCdate + ", couponEdate="
				+ couponEdate + ", couponRdiscount=" + couponRdiscount + ", couponPdiscount=" + couponPdiscount
				+ ", issueNo=" + issueNo + ", memberNo=" + memberNo + ", issueCdate=" + issueCdate + ", issueEdate="
				+ issueEdate + ", issueStatus=" + issueStatus + ", orderNo=" + orderNo + ", memberId=" + memberId
				+ ", memberName=" + memberName + "]";
	}

	
}
