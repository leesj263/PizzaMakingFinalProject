package com.kh.pmfp.admin.model.vo;

public class AdminMenu {
	
	private int rn;
	private int basicNo;
	private String basicSize;
	private String basicMenu;
	private String menuDetail;
	
	public AdminMenu() {}

	public AdminMenu(int rn, int basicNo, String basicSize, String basicMenu, String menuDetail) {
		super();
		this.rn = rn;
		this.basicNo = basicNo;
		this.basicSize = basicSize;
		this.basicMenu = basicMenu;
		this.menuDetail = menuDetail;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public int getBasicNo() {
		return basicNo;
	}

	public void setBasicNo(int basicNo) {
		this.basicNo = basicNo;
	}

	public String getBasicSize() {
		return basicSize;
	}

	public void setBasicSize(String basicSize) {
		this.basicSize = basicSize;
	}

	public String getBasicMenu() {
		return basicMenu;
	}

	public void setBasicMenu(String basicMenu) {
		this.basicMenu = basicMenu;
	}

	public String getMenuDetail() {
		return menuDetail;
	}

	public void setMenuDetail(String menuDetail) {
		this.menuDetail = menuDetail;
	}

	@Override
	public String toString() {
		return "AdminMenu [rn=" + rn + ", basicNo=" + basicNo + ", basicSize=" + basicSize + ", basicMenu=" + basicMenu
				+ ", menuDetail=" + menuDetail + "]";
	}
	
	
}
