package com.kh.pmfp.mypage.model.vo;

public class Mypizza implements java.io.Serializable{
	private int mypizzaNo;
	private int orderIno;
	private int memberNo;
	private String mypizzaName;
	
	private int imgNo;
	private int imgCateg;
	private String imgFilepath;
	private String imgChangeName;
	private String imgStatus;
	
	public Mypizza() {}

	

	public Mypizza(int mypizzaNo, int orderIno, int memberNo, String mypizzaName, int imgNo, int imgCateg,
			String imgFilepath, String imgChangeName, String imgStatus) {
		super();
		this.mypizzaNo = mypizzaNo;
		this.orderIno = orderIno;
		this.memberNo = memberNo;
		this.mypizzaName = mypizzaName;
		this.imgNo = imgNo;
		this.imgCateg = imgCateg;
		this.imgFilepath = imgFilepath;
		this.imgChangeName = imgChangeName;
		this.imgStatus = imgStatus;
	}



	public String getImgFilepath() {
		return imgFilepath;
	}



	public void setImgFilepath(String imgFilepath) {
		this.imgFilepath = imgFilepath;
	}



	public int getMypizzaNo() {
		return mypizzaNo;
	}

	public void setMypizzaNo(int mypizzaNo) {
		this.mypizzaNo = mypizzaNo;
	}

	public int getOrderIno() {
		return orderIno;
	}

	public void setOrderIno(int orderIno) {
		this.orderIno = orderIno;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMypizzaName() {
		return mypizzaName;
	}

	public void setMypizzaName(String mypizzaName) {
		this.mypizzaName = mypizzaName;
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

	public String getImgChangeName() {
		return imgChangeName;
	}

	public void setImgChangeName(String imgChangeName) {
		this.imgChangeName = imgChangeName;
	}

	public String getImgStatus() {
		return imgStatus;
	}

	public void setImgStatus(String imgStatus) {
		this.imgStatus = imgStatus;
	}



	@Override
	public String toString() {
		return "Mypizza [mypizzaNo=" + mypizzaNo + ", orderIno=" + orderIno + ", memberNo=" + memberNo
				+ ", mypizzaName=" + mypizzaName + ", imgNo=" + imgNo + ", imgCateg=" + imgCateg + ", imgFilepath="
				+ imgFilepath + ", imgChangeName=" + imgChangeName + ", imgStatus=" + imgStatus + "]";
	}


	
	

}
