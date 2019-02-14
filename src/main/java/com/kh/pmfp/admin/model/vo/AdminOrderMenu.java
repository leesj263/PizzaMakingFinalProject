package com.kh.pmfp.admin.model.vo;

public class AdminOrderMenu {
	
	private int rn;
	private int orderIno;
	private int orderNo;
	private int orderICate;
	private String orderSize;
	private int price;
	private int tCount;
	private String menu;
	
	public AdminOrderMenu() {}

	public AdminOrderMenu(int rn, int orderIno, int orderNo, int orderICate, String orderSize, int price, int tCount,
			String menu) {
		super();
		this.rn = rn;
		this.orderIno = orderIno;
		this.orderNo = orderNo;
		this.orderICate = orderICate;
		this.orderSize = orderSize;
		this.price = price;
		this.tCount = tCount;
		this.menu = menu;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public int getOrderIno() {
		return orderIno;
	}

	public void setOrderIno(int orderIno) {
		this.orderIno = orderIno;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getOrderICate() {
		return orderICate;
	}

	public void setOrderICate(int orderICate) {
		this.orderICate = orderICate;
	}

	public String getOrderSize() {
		return orderSize;
	}

	public void setOrderSize(String orderSize) {
		this.orderSize = orderSize;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int gettCount() {
		return tCount;
	}

	public void settCount(int tCount) {
		this.tCount = tCount;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	@Override
	public String toString() {
		return "AdminOrderMenu [rn=" + rn + ", orderIno=" + orderIno + ", orderNo=" + orderNo + ", orderICate="
				+ orderICate + ", orderSize=" + orderSize + ", price=" + price + ", tCount=" + tCount + ", menu=" + menu
				+ "]";
	}

	
	
}
