package com.kh.pmfp.customer.model.vo;

import java.io.Serializable;

public class BasicTopping implements Serializable {
	private int basicNo;
	private int materialNo;
	private int basicTcount;
	
	public BasicTopping() {}

	public BasicTopping(int basicNo, int materialNo, int basicTcount) {
		super();
		this.basicNo = basicNo;
		this.materialNo = materialNo;
		this.basicTcount = basicTcount;
	}

	public int getBasicNo() {
		return basicNo;
	}

	public void setBasicNo(int basicNo) {
		this.basicNo = basicNo;
	}

	public int getMaterialNo() {
		return materialNo;
	}

	public void setMaterialNo(int materialNo) {
		this.materialNo = materialNo;
	}

	public int getBasicTcount() {
		return basicTcount;
	}

	public void setBasicTcount(int basicTcount) {
		this.basicTcount = basicTcount;
	}

	@Override
	public String toString() {
		return "BasicTopping [basicNo=" + basicNo + ", materialNo=" + materialNo + ", basicTcount=" + basicTcount + "]";
	}
	
	
}
