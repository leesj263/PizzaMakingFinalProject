package com.kh.pmfp.company.model.vo;

public class CompanyRemainMaterial implements java.io.Serializable{
	private int stockNo;
	private int materialNo;
	private int comNo;
	private long stockWeight;
	private String materialName;
	
	public CompanyRemainMaterial() {
		
	}

	public CompanyRemainMaterial(int stockNo, int materialNo, int comNo, long stockWeight, String materialName) {
		super();
		this.stockNo = stockNo;
		this.materialNo = materialNo;
		this.comNo = comNo;
		this.stockWeight = stockWeight;
		this.materialName = materialName;
	}

	public int getStockNo() {
		return stockNo;
	}

	public void setStockNo(int stockNo) {
		this.stockNo = stockNo;
	}

	public int getMaterialNo() {
		return materialNo;
	}

	public void setMaterialNo(int materialNo) {
		this.materialNo = materialNo;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public long getStockWeight() {
		return stockWeight;
	}

	public void setStockWeight(long stockWeight) {
		this.stockWeight = stockWeight;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	@Override
	public String toString() {
		return "CompanyRemainMaterial [stockNo=" + stockNo + ", materialNo=" + materialNo + ", comNo=" + comNo
				+ ", stockWeight=" + stockWeight + ", materialName=" + materialName + "]";
	}

	
	
}
