package com.kh.pmfp.admin.model.vo;

import java.sql.Date;

public class AdminMaterial {

	private int mNo;
	private int mCate;
	private String mName;
	private String mSize;
	private int mWeight;
	private int mBuyPrice;
	private int mSellPrice;
	private String mStatus;
	private int iNo;
	private int iCate;
	private String iOrigineName;
	private String iChangeName;
	private String iFilePath;
	private Date iUDate;
	private String iStatus;
	private int rn;
	
	public AdminMaterial() {}

	public AdminMaterial(int mNo, int mCate, String mName, String mSize, int mWeight, int mBuyPrice, int mSellPrice,
			String mStatus, int iNo, int iCate, String iOrigineName, String iChangeName, String iFilePath, Date iUDate,
			String iStatus, int rn) {
		super();
		this.mNo = mNo;
		this.mCate = mCate;
		this.mName = mName;
		this.mSize = mSize;
		this.mWeight = mWeight;
		this.mBuyPrice = mBuyPrice;
		this.mSellPrice = mSellPrice;
		this.mStatus = mStatus;
		this.iNo = iNo;
		this.iCate = iCate;
		this.iOrigineName = iOrigineName;
		this.iChangeName = iChangeName;
		this.iFilePath = iFilePath;
		this.iUDate = iUDate;
		this.iStatus = iStatus;
		this.rn = rn;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getmCate() {
		return mCate;
	}

	public void setmCate(int mCate) {
		this.mCate = mCate;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmSize() {
		return mSize;
	}

	public void setmSize(String mSize) {
		this.mSize = mSize;
	}

	public int getmWeight() {
		return mWeight;
	}

	public void setmWeight(int mWeight) {
		this.mWeight = mWeight;
	}

	public int getmBuyPrice() {
		return mBuyPrice;
	}

	public void setmBuyPrice(int mBuyPrice) {
		this.mBuyPrice = mBuyPrice;
	}

	public int getmSellPrice() {
		return mSellPrice;
	}

	public void setmSellPrice(int mSellPrice) {
		this.mSellPrice = mSellPrice;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public int getiNo() {
		return iNo;
	}

	public void setiNo(int iNo) {
		this.iNo = iNo;
	}

	public int getiCate() {
		return iCate;
	}

	public void setiCate(int iCate) {
		this.iCate = iCate;
	}

	public String getiOrigineName() {
		return iOrigineName;
	}

	public void setiOrigineName(String iOrigineName) {
		this.iOrigineName = iOrigineName;
	}

	public String getiChangeName() {
		return iChangeName;
	}

	public void setiChangeName(String iChangeName) {
		this.iChangeName = iChangeName;
	}

	public String getiFilePath() {
		return iFilePath;
	}

	public void setiFilePath(String iFilePath) {
		this.iFilePath = iFilePath;
	}

	public Date getiUDate() {
		return iUDate;
	}

	public void setiUDate(Date iUDate) {
		this.iUDate = iUDate;
	}

	public String getiStatus() {
		return iStatus;
	}

	public void setiStatus(String iStatus) {
		this.iStatus = iStatus;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	@Override
	public String toString() {
		return "AdminMaterial [mNo=" + mNo + ", mCate=" + mCate + ", mName=" + mName + ", mSize=" + mSize + ", mWeight="
				+ mWeight + ", mBuyPrice=" + mBuyPrice + ", mSellPrice=" + mSellPrice + ", mStatus=" + mStatus
				+ ", iNo=" + iNo + ", iCate=" + iCate + ", iOrigineName=" + iOrigineName + ", iChangeName="
				+ iChangeName + ", iFilePath=" + iFilePath + ", iUDate=" + iUDate + ", iStatus=" + iStatus +
				 ", rn=" + rn + "]";
	}
	
	
}
