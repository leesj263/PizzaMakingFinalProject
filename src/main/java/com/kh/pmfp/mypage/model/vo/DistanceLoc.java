package com.kh.pmfp.mypage.model.vo;

public class DistanceLoc implements java.io.Serializable, Comparable<DistanceLoc>{
	private double locDistance;
	private int comNo;
	
	
	
	public double getLocDistance() {
		return locDistance;
	}

	public void setLocDistance(double locDistance) {
		this.locDistance = locDistance;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public DistanceLoc() {}
	
	public DistanceLoc(double locDistance, int comNo) {
		super();
		this.locDistance = locDistance;
		this.comNo = comNo;
	}

	@Override
	public String toString() {
		return "Distance [locDistance=" + locDistance + ", comNo=" + comNo + "]";
	}

	@Override
	public int compareTo(DistanceLoc d) {
		if(this.getLocDistance() < d.getLocDistance()) {
			return -1;
		} else if(this.getLocDistance() > d.getLocDistance()){
			return 1;
		}
		return 0;
	}

	
	
}
