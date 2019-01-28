package com.kh.pmfp.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderConroller {
	//피자 만들기 페이지
	@RequestMapping(value="/pizzaMaking.cor")
	public String pizzaMaking() {
		return "pizzaMaking";
	}
	//사이드 메뉴 페이지
	@RequestMapping(value="/sideMenu.cor")
	public String sideMenu() {
		return "sideMenu";
	}
	//주문 페이지
	@RequestMapping(value="order.cor")
	public String order() {
		return "order";
	}
}
