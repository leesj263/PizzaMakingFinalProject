package com.kh.pmfp.admin.model.vo;

import java.sql.Date;

public class AdminMember implements java.io.Serializable{
	
	private int memberNo;
	private int memberCateg;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberNickName;
	private String memberEmail;
	private Date memberEnroll;
	private String memberStatus;
	private int comNo;
	private int orderCount;
	private Date orderDate;
	private int rn;
	
	public AdminMember() {}

	public AdminMember(int memberNo, int memberCateg, String memberId, String memberPwd, String memberName,
			String memberNickName, String memberEmail, Date memberEnroll, String memberStatus, int comNo,
			int orderCount, Date orderDate, int rn) {
		super();
		this.memberNo = memberNo;
		this.memberCateg = memberCateg;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberNickName = memberNickName;
		this.memberEmail = memberEmail;
		this.memberEnroll = memberEnroll;
		this.memberStatus = memberStatus;
		this.comNo = comNo;
		this.orderCount = orderCount;
		this.orderDate = orderDate;
		this.rn = rn;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getMemberCateg() {
		return memberCateg;
	}

	public void setMemberCateg(int memberCateg) {
		this.memberCateg = memberCateg;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberNickName() {
		return memberNickName;
	}

	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public Date getMemberEnroll() {
		return memberEnroll;
	}

	public void setMemberEnroll(Date memberEnroll) {
		this.memberEnroll = memberEnroll;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	@Override
	public String toString() {
		return "AdminMember [memberNo=" + memberNo + ", memberCateg=" + memberCateg + ", memberId=" + memberId
				+ ", memberPwd=" + memberPwd + ", memberName=" + memberName + ", memberNickName=" + memberNickName
				+ ", memberEmail=" + memberEmail + ", memberEnroll=" + memberEnroll + ", memberStatus=" + memberStatus
				+ ", comNo=" + comNo + ", orderCount=" + orderCount + ", orderDate=" + orderDate + ", rn=" + rn + "]";
	}

	
	
}
