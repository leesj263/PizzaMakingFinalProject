package com.kh.pmfp.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;



@org.springframework.stereotype.Component
public class AdminCoupon2 implements Serializable{

	private int couponNo;		//생성쿠폰코드
	private String couponName;	//쿠폰이름
	private String couponCategStr;	//카테고리
	private String couponConditionStr;//사용조건
	private String couponCdateStr;	//생성일
	private String couponEdateStr;	//유효기간
	private String couponRdiscountStr;	//할인율
	private String couponPdiscountStr;	//할인금액

	
	public AdminCoupon2() {}

	public AdminCoupon2(int couponNo, String couponName, String couponCategStr, String couponConditionStr,
			String couponCdateStr, String couponEdateStr, String couponRdiscountStr, String couponPdiscountStr) {
		super();
		this.couponNo = couponNo;
		this.couponName = couponName;
		this.couponCategStr = couponCategStr;
		this.couponConditionStr = couponConditionStr;
		this.couponCdateStr = couponCdateStr;
		this.couponEdateStr = couponEdateStr;
		this.couponRdiscountStr = couponRdiscountStr;
		this.couponPdiscountStr = couponPdiscountStr;
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

	public String getCouponCategStr() {
		return couponCategStr;
	}

	public void setCouponCategStr(String couponCategStr) {
		this.couponCategStr = couponCategStr;
	}

	public String getCouponConditionStr() {
		return couponConditionStr;
	}

	public void setCouponConditionStr(String couponConditionStr) {
		this.couponConditionStr = couponConditionStr;
	}

	public String getCouponCdateStr() {
		return couponCdateStr;
	}

	public void setCouponCdateStr(String couponCdateStr) {
		this.couponCdateStr = couponCdateStr;
	}

	public String getCouponEdateStr() {
		return couponEdateStr;
	}

	public void setCouponEdateStr(String couponEdateStr) {
		this.couponEdateStr = couponEdateStr;
	}

	public String getCouponRdiscountStr() {
		return couponRdiscountStr;
	}

	public void setCouponRdiscountStr(String couponRdiscountStr) {
		this.couponRdiscountStr = couponRdiscountStr;
	}

	public String getCouponPdiscountStr() {
		return couponPdiscountStr;
	}

	public void setCouponPdiscountStr(String couponPdiscountStr) {
		this.couponPdiscountStr = couponPdiscountStr;
	}

	@Override
	public String toString() {
		return "AdminCoupon2 [couponNo=" + couponNo + ", couponName=" + couponName + ", couponCategStr="
				+ couponCategStr + ", couponConditionStr=" + couponConditionStr + ", couponCdateStr=" + couponCdateStr
				+ ", couponEdateStr=" + couponEdateStr + ", couponRdiscountStr=" + couponRdiscountStr
				+ ", couponPdiscountStr=" + couponPdiscountStr + "]";
	}

	
	
	
	
	
}
