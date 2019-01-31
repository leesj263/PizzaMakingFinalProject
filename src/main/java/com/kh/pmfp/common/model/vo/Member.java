package com.kh.pmfp.common.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{
	
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
	
	public Member() {}

	public Member(int memberNo, int memberCateg, String memberId, String memberPwd, String memberName,
			String memberNickName, String memberEmail, Date memberEnroll, String memberStatus, int comNo) {
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

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberCateg=" + memberCateg + ", memberId=" + memberId
				+ ", memberPwd=" + memberPwd + ", memberName=" + memberName + ", memberNickName=" + memberNickName
				+ ", memberEmail=" + memberEmail + ", memberEnroll=" + memberEnroll + ", memberStatus=" + memberStatus
				+ ", comNo=" + comNo + "]";
	}

	
	
	

}
