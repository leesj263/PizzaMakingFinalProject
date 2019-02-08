package com.kh.pmfp.customer.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MaterialImage implements Serializable {
	private int materialNo;
	private int materialCateg;
	private String materialName;
	private String materialSize;
	private int materialWeight;
	private int materialBuyprice;
	private int materialSellprice;
	private String materialStatus;
	private int imgNo;
	private int imgCateg;
	private String imgOriginname;
	private String imgChangename;
	private String imgFilepath;
	private Date imgUploaddate;
	private String imgStatus;
	private int boardNo;
	private int mypizzaNo;
	private int eventNo;
	private int basicNo;
	
	public MaterialImage() {}

	public MaterialImage(int materialNo, int materialCateg, String materialName, String materialSize,
			int materialWeight, int materialBuyprice, int materialSellprice, String materialStatus, int imgNo,
			int imgCateg, String imgOriginname, String imgChangename, String imgFilepath, Date imgUploaddate,
			String imgStatus, int boardNo, int mypizzaNo, int eventNo, int basicNo) {
		super();
		this.materialNo = materialNo;
		this.materialCateg = materialCateg;
		this.materialName = materialName;
		this.materialSize = materialSize;
		this.materialWeight = materialWeight;
		this.materialBuyprice = materialBuyprice;
		this.materialSellprice = materialSellprice;
		this.materialStatus = materialStatus;
		this.imgNo = imgNo;
		this.imgCateg = imgCateg;
		this.imgOriginname = imgOriginname;
		this.imgChangename = imgChangename;
		this.imgFilepath = imgFilepath;
		this.imgUploaddate = imgUploaddate;
		this.imgStatus = imgStatus;
		this.boardNo = boardNo;
		this.mypizzaNo = mypizzaNo;
		this.eventNo = eventNo;
		this.basicNo = basicNo;
	}

	public int getMaterialNo() {
		return materialNo;
	}

	public void setMaterialNo(int materialNo) {
		this.materialNo = materialNo;
	}

	public int getMaterialCateg() {
		return materialCateg;
	}

	public void setMaterialCateg(int materialCateg) {
		this.materialCateg = materialCateg;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	public String getMaterialSize() {
		return materialSize;
	}

	public void setMaterialSize(String materialSize) {
		this.materialSize = materialSize;
	}

	public int getMaterialWeight() {
		return materialWeight;
	}

	public void setMaterialWeight(int materialWeight) {
		this.materialWeight = materialWeight;
	}

	public int getMaterialBuyprice() {
		return materialBuyprice;
	}

	public void setMaterialBuyprice(int materialBuyprice) {
		this.materialBuyprice = materialBuyprice;
	}

	public int getMaterialSellprice() {
		return materialSellprice;
	}

	public void setMaterialSellprice(int materialSellprice) {
		this.materialSellprice = materialSellprice;
	}

	public String getMaterialStatus() {
		return materialStatus;
	}

	public void setMaterialStatus(String materialStatus) {
		this.materialStatus = materialStatus;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public int getImgCateg() {
		return imgCateg;
	}

	public void setImgCateg(int imgCateg) {
		this.imgCateg = imgCateg;
	}

	public String getImgOriginname() {
		return imgOriginname;
	}

	public void setImgOriginname(String imgOriginname) {
		this.imgOriginname = imgOriginname;
	}

	public String getImgChangename() {
		return imgChangename;
	}

	public void setImgChangename(String imgChangename) {
		this.imgChangename = imgChangename;
	}

	public String getImgFilepath() {
		return imgFilepath;
	}

	public void setImgFilepath(String imgFilepath) {
		this.imgFilepath = imgFilepath;
	}

	public Date getImgUploaddate() {
		return imgUploaddate;
	}

	public void setImgUploaddate(Date imgUploaddate) {
		this.imgUploaddate = imgUploaddate;
	}

	public String getImgStatus() {
		return imgStatus;
	}

	public void setImgStatus(String imgStatus) {
		this.imgStatus = imgStatus;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getMypizzaNo() {
		return mypizzaNo;
	}

	public void setMypizzaNo(int mypizzaNo) {
		this.mypizzaNo = mypizzaNo;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public int getBasicNo() {
		return basicNo;
	}

	public void setBasicNo(int basicNo) {
		this.basicNo = basicNo;
	}

	@Override
	public String toString() {
		return "MaterialImage [materialNo=" + materialNo + ", materialCateg=" + materialCateg + ", materialName="
				+ materialName + ", materialSize=" + materialSize + ", materialWeight=" + materialWeight
				+ ", materialBuyprice=" + materialBuyprice + ", materialSellprice=" + materialSellprice
				+ ", materialStatus=" + materialStatus + ", imgNo=" + imgNo + ", imgCateg=" + imgCateg
				+ ", imgOriginname=" + imgOriginname + ", imgChangename=" + imgChangename + ", imgFilepath="
				+ imgFilepath + ", imgUploaddate=" + imgUploaddate + ", imgStatus=" + imgStatus + ", boardNo=" + boardNo
				+ ", mypizzaNo=" + mypizzaNo + ", eventNo=" + eventNo + ", basicNo=" + basicNo + "]";
	}
	
	
}
