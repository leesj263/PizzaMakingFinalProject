package com.kh.pmfp.mypage.model.vo;

public class MypizzaPopup implements java.io.Serializable{
	private int materialSellprice;
	private String materialNameAndCount;
	private int materialCount;
	private int materialNo;
	
	public MypizzaPopup() {}

	public MypizzaPopup(int materialSellprice, String materialNameAndCount, int materialCount, int materialNo) {
		super();
		this.materialSellprice = materialSellprice;
		this.materialNameAndCount = materialNameAndCount;
		this.materialCount = materialCount;
		this.materialNo=materialNo;
	}
	
	

	public int getMaterialNo() {
		return materialNo;
	}

	public void setMaterialNo(int materialNo) {
		this.materialNo = materialNo;
	}

	public int getMaterialCount() {
		return materialCount;
	}

	public void setMaterialCount(int materialCount) {
		this.materialCount = materialCount;
	}

	public int getMaterialSellprice() {
		return materialSellprice;
	}

	public void setMaterialSellprice(int materialSellprice) {
		this.materialSellprice = materialSellprice;
	}

	public String getMaterialNameAndCount() {
		return materialNameAndCount;
	}

	public void setMaterialNameAndCount(String materialNameAndCount) {
		this.materialNameAndCount = materialNameAndCount;
	}

	@Override
	public String toString() {
		return "MypizzaPopup [materialSellprice=" + materialSellprice + ", materialNameAndCount=" + materialNameAndCount
				+ ", materialCount=" + materialCount + ", materialNo=" + materialNo + "]";
	}


	
	
	
}
