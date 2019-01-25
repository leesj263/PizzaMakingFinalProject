package com.kh.pmfp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping(value="/order.t")
	public String pizzaMaking() {
		return "customer/order/pizzaMaking";
	}
	
	@RequestMapping(value="/adminMain.t")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	@RequestMapping(value="/main.t")
	public String userMain() {
		return "main/main";
	}
	
	@RequestMapping(value="/qna.t")
	public String qna() {
		return "main/qna";
	}
	
	
	
	
}
