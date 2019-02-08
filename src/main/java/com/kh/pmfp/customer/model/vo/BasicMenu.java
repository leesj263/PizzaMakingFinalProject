package com.kh.pmfp.customer.model.vo;

import java.io.Serializable;
import java.util.ArrayList;

public class BasicMenu implements Serializable {
	private int basicNo;
	private String basicSize;
	private String basicMenu;
	private ArrayList<BasicTopping> basicTopping;
	
	public BasicMenu() {}

	public BasicMenu(int basicNo, String basicSize, String basicMenu, ArrayList<BasicTopping> basicTopping) {
		super();
		this.basicNo = basicNo;
		this.basicSize = basicSize;
		this.basicMenu = basicMenu;
		this.basicTopping = basicTopping;
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

	public ArrayList<BasicTopping> getBasicTopping() {
		return basicTopping;
	}

	public void setBasicTopping(ArrayList<BasicTopping> basicTopping) {
		this.basicTopping = basicTopping;
	}

	@Override
	public String toString() {
		return "BasicMenu [basicNo=" + basicNo + ", basicSize=" + basicSize + ", basicMenu=" + basicMenu
				+ ", basicTopping=" + basicTopping + "]";
	}

	
}
