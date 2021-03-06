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
	
	
	
	
	
	

	
	//주문내역 상세페이지
	@RequestMapping(value="/myPageOrderDetail.t")
	public String mypage1Detail() {
		return "mypage/orderDetail";
	}
	
	@RequestMapping(value="/myPageMyMenu.t")
	public String mypage2() {
		return "mypage/myMenu";
	}
	
	@RequestMapping(value="/myPageMyMenuPop.t")
	public String mypage3() {
		return "mypage/myMenuPopup";
	}
	
	@RequestMapping(value="/myPageCoupon.t")
	public String mypage5() {
		return "mypage/coupon";
	}
	
	@RequestMapping(value="/myPageCouponTimeOut.t")
	public String mypage6() {
		return "mypage/coupon2";
	}
	
	@RequestMapping(value="/myPageQna.t")
	public String mypage7() {
		return "mypage/qnaList";
	}

	@RequestMapping(value="/myPageMemModify.t")
	public String mypage8() {
		return "mypage/memModify";
	}

	@RequestMapping(value="/myPageMemLeave.t")
	public String mypage9() {
		return "mypage/memLeave";
	}
	
	
	
	//QNA
	@RequestMapping(value="/qnaDetail.t")
	public String qna1() {
		return "customer/qna/qnaDetail";
	}
	@RequestMapping(value="/qnaList.t")
	public String qna2() {
		return "customer/qna/qnaList";
	}
	@RequestMapping(value="/qnaUpdate.t")
	public String qna3() {
		return "customer/qna/qnaUpdate";
	}
	@RequestMapping(value="/qnaWrite.t")
	public String qna4() {
		return "customer/qna/qnaWrite";
	}
	
	
	
	
	//SHARE
	@RequestMapping(value="/shareDetail.t")
	public String share1() {
		return "customer/share/shareDetail";
	}
	@RequestMapping(value="/shareList.t")
	public String share2() {
		return "customer/share/shareList";
	}
	@RequestMapping(value="/shareUpdate.t")
	public String share3() {
		return "customer/share/shareUpdate";
	}
	@RequestMapping(value="/shareWrite.t")
	public String share4() {
		return "customer/share/shareWrite";
	}
	
	
	//REVIEW
	@RequestMapping(value="/reviewDetail.t")
	public String review1() {
		return "customer/review/reviewDetail";
	}
	@RequestMapping(value="/reviewList.t")
	public String review2() {
		return "customer/review/reviewList";
	}
	@RequestMapping(value="/reviewUpdate.t")
	public String review3() {
		return "customer/review/reviewUpdate";
	}
	@RequestMapping(value="/reviewWrite.t")
	public String review4() {
		return "customer/review/reviewWrite";
	}
	
	
	
	
	//FAQ
	@RequestMapping(value="/faqOrder.t")
	public String faq1() {
		return "customer/faq/faqOrder";
	}
	@RequestMapping(value="/faqMember.t")
	public String faq2() {
		return "customer/faq/faqMember";
	}
	@RequestMapping(value="/faqPayCoupon.t")
	public String faq3() {
		return "customer/faq/faqPayCoupon";
	}
	@RequestMapping(value="/faqEtc.t")
	public String faq4() {
		return "customer/faq/faqEtc";
	}
}
