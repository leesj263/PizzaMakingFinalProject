package com.kh.pmfp.customer.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Image implements Serializable {
	private int imgNo;
	private int imgCateg;
	private String imgOriginname;
	private String imgChangename;
	private String imgFilepath;
	private Date imgUploaddate;
	private String imgStatus;
	private int boardNo;
	private int materialNo;
	private int mypizzaNo;
	private int eventNo;
	private int basicNo;
	
	public Image() {}

	public Image(int imgNo, int imgCateg, String imgOriginname, String imgChangename, String imgFilepath,
			Date imgUploaddate, String imgStatus, int boardNo, int materialNo, int mypizzaNo, int eventNo,
			int basicNo) {
		super();
		this.imgNo = imgNo;
		this.imgCateg = imgCateg;
		this.imgOriginname = imgOriginname;
		this.imgChangename = imgChangename;
		this.imgFilepath = imgFilepath;
		this.imgUploaddate = imgUploaddate;
		this.imgStatus = imgStatus;
		this.boardNo = boardNo;
		this.materialNo = materialNo;
		this.mypizzaNo = mypizzaNo;
		this.eventNo = eventNo;
		this.basicNo = basicNo;
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

	public int getMaterialNo() {
		return materialNo;
	}

	public void setMaterialNo(int materialNo) {
		this.materialNo = materialNo;
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
		return "Image [imgNo=" + imgNo + ", imgCateg=" + imgCateg + ", imgOriginname=" + imgOriginname
				+ ", imgChangename=" + imgChangename + ", imgFilepath=" + imgFilepath + ", imgUploaddate="
				+ imgUploaddate + ", imgStatus=" + imgStatus + ", boardNo=" + boardNo + ", materialNo=" + materialNo
				+ ", mypizzaNo=" + mypizzaNo + ", eventNo=" + eventNo + ", basicNo=" + basicNo + "]";
	}
	
	
}
