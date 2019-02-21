package com.kh.pmfp.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AdminCouponIssue implements Serializable{

	
	private int issueNo;		//발급쿠폰 번호
	private int couponNo;		//생성쿠폰코드
	private int memberNo;		//회원번호
	private Date issueCdate;	//발급일
	private Date issueEdate;	//만료일
	private String issueStatus;	//사용여부
	private int orderNo;		//주문번호
	
	public AdminCouponIssue() {}

	public AdminCouponIssue(int issueNo, int couponNo, int memberNo, Date issueCdate, Date issueEdate,
			String issueStatus, int orderNo) {
		super();
		this.issueNo = issueNo;
		this.couponNo = couponNo;
		this.memberNo = memberNo;
		this.issueCdate = issueCdate;
		this.issueEdate = issueEdate;
		this.issueStatus = issueStatus;
		this.orderNo = orderNo;
	}

	public int getIssueNo() {
		return issueNo;
	}

	public void setIssueNo(int issueNo) {
		this.issueNo = issueNo;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
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
		return "AdminCouponIssue [issueNo=" + issueNo + ", couponNo=" + couponNo + ", memberNo=" + memberNo
				+ ", issueCdate=" + issueCdate + ", issueEdate=" + issueEdate + ", issueStatus=" + issueStatus
				+ ", orderNo=" + orderNo + "]";
	}
	
	
	
}
