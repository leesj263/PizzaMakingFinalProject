package com.kh.pmfp.mypage.model.vo;

public class DelList implements java.io.Serializable{
	private int delNo;
	private int memberNo;
	private String comName;
	private String delAddr;
	private String delName;
	private int comNo;
	
	public DelList() {}

	public DelList(int delNo, String delName, String delAddr, String comName, int memberNo, int comNo) {
		super();
		this.delNo = delNo;
		this.delName = delName;
		this.delAddr = delAddr;
		this.comName = comName;
		this.memberNo = memberNo;
		this.comNo = comNo;
	}
	
	public DelList(int memberNo, int comNo, String delAddr , String delName) {
		super();
		this.delName = delName;
		this.delAddr = delAddr;
		this.comNo = comNo;
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

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	@Override
	public String toString() {
		return "DelList [delNo=" + delNo + ", memberNo=" + memberNo + ", comName=" + comName + ", delAddr=" + delAddr
				+ ", delName=" + delName + ", comNo=" + comNo + "]";
	}
	
	


	
	
}
