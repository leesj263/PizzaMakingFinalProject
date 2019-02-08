package com.kh.pmfp.admin.model.vo;

import java.sql.Date;

public class AdminSeller {
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
	private String comName;
	private String comAddress;
	private String comTel;
	private String comLisenseNo;
	private String comStatus;
	private Date comDate;
	private String salesTime;
	private String comLoc;
	private String comPark;
	private String comConfirm;
	private int rn;
	
	public AdminSeller() {}

	public AdminSeller(int memberNo, int memberCateg, String memberId, String memberPwd, String memberName,
			String memberNickName, String memberEmail, Date memberEnroll, String memberStatus, int comNo,
			String comName, String comAddress, String comTel, String comLisenseNo, String comStatus, Date comDate,
			String salesTime, String comLoc, String comPark, String comConfirm, int rn) {
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
		this.comName = comName;
		this.comAddress = comAddress;
		this.comTel = comTel;
		this.comLisenseNo = comLisenseNo;
		this.comStatus = comStatus;
		this.comDate = comDate;
		this.salesTime = salesTime;
		this.comLoc = comLoc;
		this.comPark = comPark;
		this.comConfirm = comConfirm;
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

	public String getComLoc() {
		return comLoc;
	}

	public void setComLoc(String comLoc) {
		this.comLoc = comLoc;
	}

	public String getComPark() {
		return comPark;
	}

	public void setComPark(String comPark) {
		this.comPark = comPark;
	}

	public String getComConfirm() {
		return comConfirm;
	}

	public void setComConfirm(String comConfirm) {
		this.comConfirm = comConfirm;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	@Override
	public String toString() {
		return "AdminSeller [memberNo=" + memberNo + ", memberCateg=" + memberCateg + ", memberId=" + memberId
				+ ", memberPwd=" + memberPwd + ", memberName=" + memberName + ", memberNickName=" + memberNickName
				+ ", memberEmail=" + memberEmail + ", memberEnroll=" + memberEnroll + ", memberStatus=" + memberStatus
				+ ", comNo=" + comNo + ", comName=" + comName + ", comAddress=" + comAddress + ", comTel=" + comTel
				+ ", comLisenseNo=" + comLisenseNo + ", comStatus=" + comStatus + ", comDate=" + comDate
				+ ", salesTime=" + salesTime + ", comLoc=" + comLoc + ", comPark=" + comPark + ", comConfirm="
				+ comConfirm + ", rn=" + rn + "]";
	}

	
	
}
