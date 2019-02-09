package com.kh.pmfp.company.model.vo;

public class CompanyMaterial implements java.io.Serializable{
	private int materialNo;
	private String materialName;
	private String materialSize;
	private int materialWeight;
	private int materialBuyPrice;
	private int materialSellPrice;
	private String materialStatus;
	
	public CompanyMaterial() {
		
	}

	public CompanyMaterial(int materialNo, String materialName, String materialSize, int materialWeight,
			int materialBuyPrice, int materialSellPrice, String materialStatus) {
		super();
		this.materialNo = materialNo;
		this.materialName = materialName;
		this.materialSize = materialSize;
		this.materialWeight = materialWeight;
		this.materialBuyPrice = materialBuyPrice;
		this.materialSellPrice = materialSellPrice;
		this.materialStatus = materialStatus;
	}

	public int getMaterialNo() {
		return materialNo;
	}

	public void setMaterialNo(int materialNo) {
		this.materialNo = materialNo;
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

	public int getMaterialBuyPrice() {
		return materialBuyPrice;
	}

	public void setMaterialBuyPrice(int materialBuyPrice) {
		this.materialBuyPrice = materialBuyPrice;
	}

	public int getMaterialSellPrice() {
		return materialSellPrice;
	}

	public void setMaterialSellPrice(int materialSellPrice) {
		this.materialSellPrice = materialSellPrice;
	}

	public String getMaterialStatus() {
		return materialStatus;
	}

	public void setMaterialStatus(String materialStatus) {
		this.materialStatus = materialStatus;
	}

	@Override
	public String toString() {
		return "CompanyMaterial [materialNo=" + materialNo + ", materialName=" + materialName + ", materialSize="
				+ materialSize + ", materialWeight=" + materialWeight + ", materialBuyPrice=" + materialBuyPrice
				+ ", materialSellPrice=" + materialSellPrice + ", materialStatus=" + materialStatus + "]";
	}
	
	
	
}
