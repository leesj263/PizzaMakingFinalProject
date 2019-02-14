package com.kh.pmfp.mypage.model.vo;

public class DelList implements java.io.Serializable{
	private int delNo;
	private int memberNo;
	private String comName;
	private String delAddr;
	private String delName;
	
	public DelList() {}

	public DelList(int delNo, String delName, String delAddr, String comName, int memberNo) {
		super();
		this.delNo = delNo;
		this.delName = delName;
		this.delAddr = delAddr;
		this.comName = comName;
		this.memberNo = memberNo;
	}
	
	public DelList(String delName, String delAddr, String comName, int memberNo) {
		super();
		this.delName = delName;
		this.delAddr = delAddr;
		this.comName = comName;
		this.memberNo = memberNo;
	}

	public int getDelNo() {
		return delNo;
	}

	public void setDelNo(int delNo) {
		this.delNo = delNo;
	}

	public String getDelName() {
		return delName;
	}

	public void setDelName(String delName) {
		this.delName = delName;
	}

	public String getDelAddr() {
		return delAddr;
	}

	public void setDelAddr(String delAddr) {
		this.delAddr = delAddr;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "DelList [delNo=" + delNo + ", delName=" + delName + ", delAddr=" + delAddr + ", comName=" + comName
				+ ", memberNo=" + memberNo + "]";
	}

	
	
}
