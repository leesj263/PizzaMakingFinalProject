package com.kh.pmfp.admin.model.vo;

public class AdminMenu {
	
	private int rn;
	private int bNo;
	private String bSize;
	private String bMenu;
	private String bDetail;
	private int bSellPrice;
	private int bBuyPrice;
	private int bTcount;
	private String bStatus;
	private int mNo;
	private String mName;
	private int mSellPrice;
	private int mBuyPrice;
	private int iNo;
	private int iCate;
	private String iFilePath;
	private String iChangeName;
	private String iOriginName;
	
	public AdminMenu() {}

	public AdminMenu(int rn, int bNo, String bSize, String bMenu, String bDetail, int bSellPrice, int bBuyPrice,
			int bTcount, String bStatus, int mNo, String mName, int mSellPrice, int mBuyPrice, int iNo, int iCate,
			String iFilePath, String iChangeName, String iOriginName) {
		super();
		this.rn = rn;
		this.bNo = bNo;
		this.bSize = bSize;
		this.bMenu = bMenu;
		this.bDetail = bDetail;
		this.bSellPrice = bSellPrice;
		this.bBuyPrice = bBuyPrice;
		this.bTcount = bTcount;
		this.bStatus = bStatus;
		this.mNo = mNo;
		this.mName = mName;
		this.mSellPrice = mSellPrice;
		this.mBuyPrice = mBuyPrice;
		this.iNo = iNo;
		this.iCate = iCate;
		this.iFilePath = iFilePath;
		this.iChangeName = iChangeName;
		this.iOriginName = iOriginName;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbSize() {
		return bSize;
	}

	public void setbSize(String bSize) {
		this.bSize = bSize;
	}

	public String getbMenu() {
		return bMenu;
	}

	public void setbMenu(String bMenu) {
		this.bMenu = bMenu;
	}

	public String getbDetail() {
		return bDetail;
	}

	public void setbDetail(String bDetail) {
		this.bDetail = bDetail;
	}

	public int getbSellPrice() {
		return bSellPrice;
	}

	public void setbSellPrice(int bSellPrice) {
		this.bSellPrice = bSellPrice;
	}

	public int getbBuyPrice() {
		return bBuyPrice;
	}

	public void setbBuyPrice(int bBuyPrice) {
		this.bBuyPrice = bBuyPrice;
	}

	public int getbTcount() {
		return bTcount;
	}

	public void setbTcount(int bTcount) {
		this.bTcount = bTcount;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public int getmSellPrice() {
		return mSellPrice;
	}

	public void setmSellPrice(int mSellPrice) {
		this.mSellPrice = mSellPrice;
	}

	public int getmBuyPrice() {
		return mBuyPrice;
	}

	public void setmBuyPrice(int mBuyPrice) {
		this.mBuyPrice = mBuyPrice;
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

	public String getiFilePath() {
		return iFilePath;
	}

	public void setiFilePath(String iFilePath) {
		this.iFilePath = iFilePath;
	}

	public String getiChangeName() {
		return iChangeName;
	}

	public void setiChangeName(String iChangeName) {
		this.iChangeName = iChangeName;
	}

	public String getiOriginName() {
		return iOriginName;
	}

	public void setiOriginName(String iOriginName) {
		this.iOriginName = iOriginName;
	}

	@Override
	public String toString() {
		return "AdminMenu [rn=" + rn + ", bNo=" + bNo + ", bSize=" + bSize + ", bMenu=" + bMenu + ", bDetail=" + bDetail
				+ ", bSellPrice=" + bSellPrice + ", bBuyPrice=" + bBuyPrice + ", bTcount=" + bTcount + ", bStatus="
				+ bStatus + ", mNo=" + mNo + ", mName=" + mName + ", mSellPrice=" + mSellPrice + ", mBuyPrice="
				+ mBuyPrice + ", iNo=" + iNo + ", iCate=" + iCate + ", iFilePath=" + iFilePath + ", iChangeName="
				+ iChangeName + ", iOriginName=" + iOriginName + "]";
	}

	
	
}
