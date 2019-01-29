package com.kh.pmfp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
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
	
	
	
	
	
	
	//주문내역 & 마이페이지 메인
	@RequestMapping(value="/mypage.t")
	public String mypage1() {
		return "mypage/orderList";
	}
	
	//주문내역 상세페이지
	@RequestMapping(value="/myPageOrderDetail.t")
	public String mypage1Detail() {
		return "mypage/orderDetail";
	}
	
	@RequestMapping(value="/myPageMyMenu.t")
	public String mypage2() {
		return "mypage/myMenu";
	}
	
	@RequestMapping(value="/myPageDelAddr.t")
	public String mypage3() {
		return "mypage/delAddr";
	}
	
	@RequestMapping(value="/myPageCoupon.t")
	public String mypage4() {
		return "mypage/coupon";
	}
	
	@RequestMapping(value="/myPageCouponTimeOut.t")
	public String mypage5() {
		return "mypage/coupon2";
	}
	
	@RequestMapping(value="/myPageQna.t")
	public String mypage6() {
		return "mypage/qnaList";
	}
	
}
