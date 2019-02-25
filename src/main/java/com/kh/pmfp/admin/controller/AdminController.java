package com.kh.pmfp.admin.controller;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminDeleteException;
import com.kh.pmfp.admin.model.exception.AdminInsertException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.exception.AdminUpdateException;
import com.kh.pmfp.admin.model.service.AdminService;
import com.kh.pmfp.admin.model.vo.AdminBoard;
import com.kh.pmfp.admin.model.vo.AdminCalculate;
import com.kh.pmfp.admin.model.vo.AdminCalculateList;
import com.kh.pmfp.admin.model.vo.AdminMSales;
import com.kh.pmfp.admin.model.vo.AdminMaterial;
import com.kh.pmfp.admin.model.vo.AdminMember;
import com.kh.pmfp.admin.model.vo.AdminMenu;
import com.kh.pmfp.admin.model.vo.AdminOrder;
import com.kh.pmfp.admin.model.vo.AdminOrderMenu;
import com.kh.pmfp.admin.model.vo.AdminSales;
import com.kh.pmfp.admin.model.vo.AdminSeller;
import com.kh.pmfp.admin.model.vo.AdminSellerOrder;
import com.kh.pmfp.admin.model.vo.AdminSellerOrderList;
import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.common.model.vo.Pagination;
import com.kh.pmfp.common.model.vo.Pagination5;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService as;

	@RequestMapping(value="admin", method=RequestMethod.GET)
	public String adminPage(@RequestParam("admin")String admin) {
		System.out.println(admin);
		return "admin/"+admin;
	}
	
	//메인 이동용
	@RequestMapping("adminMain.ad")
	public String adminMain(HttpServletRequest request) {
		ArrayList<AdminSales> salesList=new ArrayList<AdminSales>();
		ArrayList<AdminSales> expenseList=new ArrayList<AdminSales>();
		AdminSales sales=new AdminSales(1);
		
		try {
			salesList=as.selectTodayStat(sales);
			request.setAttribute("salesList", salesList);
			System.out.println("주문 목록 : "+salesList);
			return "admin/adminMain";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//로그아웃용
	@RequestMapping("logout.ad")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:logout.co";
	}
	
	//회원 목록 출력용
	@RequestMapping("userList.ad")
	public String userList(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminMember> userList=new ArrayList<AdminMember>();
		AdminMember member=new AdminMember();
		member.setMemberCateg(0);
		try {
			int listCount=as.selectUserCount(member);
			PageInfo pi=Pagination.getPageInfo(currentPage, listCount);
			
			userList=as.selectUserList(pi);
			System.out.println("회원 목록 : "+userList);
			request.setAttribute("memberList", userList);
			request.setAttribute("pi", pi);
			
			return "admin/user/userList";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//회원 상세조회용
	@RequestMapping(value="userDetail.ad", method=RequestMethod.GET)
	public String userDetail(int num, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("회원번호 : "+num);
		AdminMember am=new AdminMember();
		ArrayList<AdminOrder> orderList=new ArrayList<AdminOrder>();
		
		try {
			am=as.selectUser(num);
			orderList=as.selectUserOrder(num);
			System.out.println("조회 회원 : "+am);
			System.out.println("주문 목록 : "+orderList);
			
			request.setAttribute("member", am);
			request.setAttribute("orderList", orderList);
			
			return "admin/user/userDetail";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//업체 목록 출력용
	@RequestMapping("sellerList.ad")
	public String sellerList(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminSeller> sellerList=new ArrayList<AdminSeller>();
		AdminMember member=new AdminMember();
		member.setMemberCateg(1);
		try {
			int listCount=as.selectUserCount(member);
			PageInfo pi=Pagination.getPageInfo(currentPage, listCount);
			sellerList=as.selectSellerList(pi);
			System.out.println("지점 목록 : "+sellerList);
			request.setAttribute("sellerList", sellerList);
			request.setAttribute("pi", pi);
			return "admin/seller/sellerList";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//승인 대기 목록 조회용
	@RequestMapping("waitSeller.ad")
	public String waitSeller(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminSeller> waitSeller=new ArrayList<AdminSeller>();
		
		try {
			waitSeller=as.selectWaitSeller();
			System.out.println("지점 목록 : "+waitSeller);
			request.setAttribute("waitSeller", waitSeller);
			return "admin/seller/waitSeller";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}	
	}
	
	//업체 승인용
	@RequestMapping(value="confirmSeller.ad", method=RequestMethod.GET)
	public String confirmSeller(@ModelAttribute AdminSeller seller, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		System.out.println(seller.getComNo()+"/"+seller.getComLat()+"/"+seller.getComLon());
		try {
			int result=as.confirmSeller(seller);
			redirectAttributes.addAttribute("num", seller.getComNo());
			return "redirect:sellerDetail.ad";
		} catch (AdminUpdateException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//업체 상세 조회용
	@RequestMapping(value="sellerDetail.ad", method=RequestMethod.GET)
	public String sellerDetail(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, int num, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("업체 번호 : "+num);
		AdminSeller seller=new AdminSeller();
		ArrayList<AdminSellerOrderList> orderList=new ArrayList<AdminSellerOrderList>();
		
		try {
			int listCount=as.selectEachSellerOrderCount(num);
			PageInfo pi=Pagination5.getPageInfo(currentPage, listCount);
			seller=as.selectSeller(num);
			orderList=as.selectEachSellerOrderList(num, pi);
			System.out.println("조회 업체 : "+seller);
			System.out.println("주문 목록 : "+orderList);
			
			request.setAttribute("seller", seller);
			request.setAttribute("orderList", orderList);
			request.setAttribute("pi", pi);
			return "admin/seller/sellerDetail";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//업체 주문 목록 조회용
	@RequestMapping("sellerOrder.ad")
	public String sellerOrder(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminSellerOrderList> orderList=new ArrayList<AdminSellerOrderList>();
		
		try {
			int listCount=as.selectSellerOrderCount();
			PageInfo pi=Pagination.getPageInfo(currentPage, listCount);
			orderList=as.selectSellerOrderList(pi);
			System.out.println("업체 주문 목록 : "+orderList);
			request.setAttribute("pi", pi);
			request.setAttribute("orderList", orderList);
			return "admin/seller/sellerOrder";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
	}
	
	//업체 주문 업데이트용 - 목록  & 상세보기
	@RequestMapping(value="sellerOrderApply.ad", method=RequestMethod.GET)
	@ResponseBody
	public int sellerOrderApply(@ModelAttribute AdminSellerOrder order, HttpServletRequest request) throws AdminUpdateException, AdminCountException {
		System.out.println("배송 내역 : "+order);
		int result=as.sellerOrderApply(order);
		return result;
	}
	
	//업체 주문 업데이트 용 - 목록 ajax 여러개
	@RequestMapping(value="selectSellerOrderApply.ad", method=RequestMethod.GET)
	@ResponseBody
	public int selectSellerOrderApply(@RequestParam(value="orderMDate") String orderMDate, @RequestParam(value="orderMStatus") String orderMStatus, @RequestParam(value="comNo") String comNo, HttpServletRequest request) throws AdminUpdateException, AdminCountException {
		System.out.println(orderMDate);
		System.out.println(comNo);
		System.out.println(orderMStatus);
		String[] orderMStatusArr=orderMStatus.split(",");
		String[] orderMDateArr=orderMDate.split(",");
		String[] comNoArr=comNo.split(",");
		ArrayList<AdminSellerOrder> orderList=new ArrayList<AdminSellerOrder>();
		for(int i=0;i<comNoArr.length;i++) {
			AdminSellerOrder order=new AdminSellerOrder();
			order.setComNo(Integer.parseInt(comNoArr[i]));
			order.setOrderMStatus(orderMStatusArr[i]);
			order.setOrderMDate(Date.valueOf((orderMDateArr[i])));
			orderList.add(order);
		}
		int result=0;
		for(int i=0;i<orderList.size();i++) {
			result+=as.sellerOrderApply(orderList.get(i));
		}
		if(result==orderList.size()) {
			return 1;
		}else {
			return -1;
		}
	}
	
	//업체 주문 상세 조회용
	@RequestMapping(value="sellerOrderDetail.ad", method=RequestMethod.GET)
	public String sellerOrderDetail(@ModelAttribute AdminSellerOrderList orderList, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("재료주문번호 : "+orderList.getComNo()+"/"+orderList.getOrderMDate());
		AdminSeller seller=new AdminSeller();
		ArrayList<AdminSellerOrder> order=new ArrayList<AdminSellerOrder>();
		AdminSellerOrder orderOne=new AdminSellerOrder();
		int total=0;
		try {
			seller=as.selectSeller(orderList.getComNo());
			order=as.selectSellerOrder(orderList);
			orderOne=order.get(0);
			for(int i=0;i<order.size();i++) {
				total+=order.get(i).getPrice();
			}
			System.out.println("업체 정보 : "+seller);
			System.out.println("업체 주문 내역 : "+order);
			request.setAttribute("seller", seller);
			request.setAttribute("order", order);
			request.setAttribute("orderOne", orderOne);
			request.setAttribute("total", total);
			return "admin/seller/sellerOrderDetail";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
		
	}
	
	//공지사항 목록 조회용
	@RequestMapping("noticeList.ad")
	public String selectNoticeList(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminBoard> noticeList=new ArrayList<AdminBoard>();
		
		try {
			int listCount=as.selectNoticeCount();
			PageInfo pi=Pagination.getPageInfo(currentPage, listCount);
			noticeList=as.selectNoticeList(pi);
			System.out.println("공지사항 목록 : "+noticeList);
			request.setAttribute("noticeList", noticeList);
			request.setAttribute("pi", pi);
			return "admin/board/noticeList";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//공지사항 상세보기용
	@RequestMapping(value="noticeDetail.ad", method=RequestMethod.GET)
	public String selectNotice(int num, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("게시글 번호 : "+num);
		AdminBoard notice=new AdminBoard();
		
		try {
			notice=as.selectNotice(num);
			System.out.println("공지사항 : "+notice);
			request.setAttribute("notice", notice);
			
			return "admin/board/noticeDetail";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}

	}
	
	
	//공지사항 작성 페이지 이동용
	@RequestMapping("noticeWriteView.ad")
	public String noticeWriteView() {
		return "admin/board/noticeWrite";
	}
	
	//faq 목록 조회용
	@RequestMapping("faqList.ad")
	public String faqList(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminBoard> faqList=new ArrayList<AdminBoard>();
		
		try {
			faqList=as.selectFaqList();
			System.out.println("FAQ 목록 : "+faqList);
			request.setAttribute("faqList", faqList);
			
			return "admin/board/faqList";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
	}
	
	//qna 목록 조회용
	@RequestMapping("qnaList.ad")
	public String qnaList(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminBoard> qnaList=new ArrayList<AdminBoard>();
		
		try {
			int listCount=as.selectQnaCount();
			PageInfo pi=Pagination.getPageInfo(currentPage, listCount);
			qnaList=as.selectQnaList(pi);
			System.out.println("Q&A목록 : "+qnaList);
			request.setAttribute("qnaList", qnaList);
			request.setAttribute("pi", pi);
			return "admin/board/qnaList";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//qna 답변 대기 목록 조회용
	@RequestMapping("qnaWaitList.ad")
	public String qnaWaitList(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminBoard> qnaWaitList=new ArrayList<AdminBoard>();
		
		try {
			int listCount=as.selectQnaWaitCount();
			PageInfo pi=Pagination.getPageInfo(currentPage, listCount);
			qnaWaitList=as.selectQnaWaitList(pi);
			System.out.println("Q&A 답변 대기 목록 : "+qnaWaitList);
			request.setAttribute("qnaWaitList", qnaWaitList);
			request.setAttribute("pi", pi);
			return "admin/board/qnaWaitList";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//qna 답변 완료 목록 조회용
	@RequestMapping("qnaCompleteList.ad")
	public String qnaCompleteList(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminBoard> qnaCompleteList=new ArrayList<AdminBoard>();
		
		try {
			int listCount=as.selectQnaCompleteCount();
			PageInfo pi=Pagination.getPageInfo(currentPage, listCount);
			qnaCompleteList=as.selectQnaCompleteList(pi);
			System.out.println("Q&A 답변 완료 목록 : "+qnaCompleteList);
			request.setAttribute("qnaCompleteList", qnaCompleteList);
			request.setAttribute("pi", pi);
			return "admin/board/qnaCompleteList";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	//faq 상세보기용
	@RequestMapping(value="faqDetail.ad", method=RequestMethod.GET)
	public String selectFaq(int num, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("게시글 번호 : "+num);
		AdminBoard faq=new AdminBoard();
		
		try {
			faq=as.selectFaq(num);
			System.out.println("FAQ : "+faq);
			request.setAttribute("faq", faq);
			
			return "admin/board/faqDetail";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}
	
	//qna 상세보기용
	@RequestMapping(value="qnaDetail.ad", method=RequestMethod.GET)
	public String selectQna(int num, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("게시글 번호 : "+num);
		AdminBoard qna=new AdminBoard();
		AdminBoard answer=new AdminBoard();
		try {
			qna=as.selectQna(num);
			answer=as.selectAnswer(num);
			System.out.println("Q&A : "+qna);
			System.out.println("Answer : "+answer);
			
			request.setAttribute("qna", qna);
			request.setAttribute("answer", answer);
			return "admin/board/qnaDetail";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
	}
	
	//공지사항 작성용
	@RequestMapping("noticeWrite.ad")
	public String noticeWrite(@ModelAttribute AdminBoard notice, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(notice);
		
		//로그인 처리하면 1 -> Session.get으로 바꾸기
		notice.setMemberNo(1);
		
		//엔터 처리
		//notice.setBoardContent(notice.getBoardContent().replace("\r\n", "<br>"));
		
		try {
			int result=as.insertNotice(notice);
			System.out.println("작성한 공지사항 개수: "+result);
			
			return "redirect:noticeList.ad";
		} catch (AdminInsertException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
	}
	
	//공지사항 수정페이지 보기
	@RequestMapping(value="noticeModifyView.ad", method=RequestMethod.GET)
	public String noticeModifyView(@RequestParam int num, HttpServletRequest request) {
		System.out.println("수정할 게시글 번호 : "+num);
		AdminBoard notice=new AdminBoard();
		
		try {
			notice=as.selectModNotice(num);
			System.out.println("공지사항 : "+notice);
			request.setAttribute("notice", notice);
			
			return "admin/board/noticeModify";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		} 
	}
	
	//공지사항 수정용
	@RequestMapping("noticeModify.ad")
	public String noticeModify(@ModelAttribute AdminBoard notice, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("수정한 게시글 : "+notice);
		
		//로그인 해결 되면 관리자 계정 ID SET 해주기
		notice.setMemberNo(1);
		//notice.setBoardContent(notice.getBoardContent().replace("\r\n", "<br>"));
		
		try {
			int result=as.updateNotice(notice);
			System.out.println("수정한 게시글 수 : "+result);
			
			return "redirect:noticeList.ad";
		} catch (AdminUpdateException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
	}
	
	//공지사항 삭제용
	@RequestMapping(value="noticeDelete.ad", method=RequestMethod.GET)
	public String noticeDelete(@RequestParam int num, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("삭제할 게시글 : "+num);
		
		try {
			int result=as.deleteNotice(num);
			System.out.println("삭제한 게시글 수 : "+result);
			
			return "redirect:noticeList.ad";
		}catch(AdminDeleteException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
	}
	
	//faq 수정페이지 보기
	@RequestMapping(value="faqModifyView.ad", method=RequestMethod.GET)
	public String faqModifyView(@RequestParam int num, HttpServletRequest request) {
		System.out.println("수정할 게시글 번호 : "+num);
		AdminBoard faq=new AdminBoard();
		
		try {
			faq=as.selectModFaq(num);
			System.out.println("FAQ : "+faq);
			request.setAttribute("faq", faq);
			
			return "admin/board/faqModify";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		} 
	}
	
	//faq 수정용
	@RequestMapping("faqModify.ad")
	public String faqModify(@ModelAttribute AdminBoard faq, HttpServletRequest request) {
		
		//faq.setBoardContent(faq.getBoardContent().replace("\r\n", "<br>"));
		//로그인 처리되면 바꾸기
		faq.setMemberNo(1);
		System.out.println("수정할 게시글 : "+faq);
		
		try {
			int result=as.updateFaq(faq);
			System.out.println("수정한 게시글 수 : "+result);
			
			return "redirect:faqList.ad";
		} catch (AdminUpdateException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
	}
	
	//faq 삭제용
	@RequestMapping(value="faqDelete.ad", method=RequestMethod.GET)
	public String faqDelete(@RequestParam int num, HttpServletRequest request) {
		System.out.println("삭제할 FAQ 번호 : "+num);
		
		try {
			int result=as.deleteFaq(num);
			
			return "redirect:faqList.ad";
		} catch (AdminDeleteException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
	}
	
	//faq 작성 페이지 이동용
	@RequestMapping("faqWriteView.ad")
	public String faqWriteView() {
		return "admin/board/faqWrite";
	}
	
	//faq 작성용
	@RequestMapping(value="faqWrite.ad", method=RequestMethod.POST)
	public String faqWrite(@ModelAttribute AdminBoard faq, HttpServletRequest request) {
		System.out.println("faq : "+ faq);
		faq.setMemberNo(1);
		
		try {
			int result=as.insertFaq(faq);
			System.out.println("FAQ 작성 완료");
			return "redirect:faqList.ad";
		} catch (AdminInsertException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//qna 답변 작성용
	@RequestMapping(value="qnaAnswerWrite.ad", method=RequestMethod.POST)
	public String qnaAnswerWrite(@ModelAttribute AdminBoard answer, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		System.out.println("answer : "+answer);
		//로그인 처리하고 세션에서 아이디 가져오기
		answer.setMemberNo(1);
		
		try {
			int result=as.insertAnswer(answer);
			redirectAttributes.addAttribute("num", answer.getBoardRefNo());
			return "redirect:qnaDetail.ad";
		} catch (AdminInsertException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (AdminUpdateException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
	}
		
	//재료 목록 조회용
	@RequestMapping("toppingList.ad")
	public String toppingList(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, HttpServletRequest request) {
		try {
			int listCount=as.selectMatCount();
			PageInfo pi=Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<AdminMaterial> toppingList=new ArrayList<AdminMaterial>();
			toppingList=as.selectMaterialList(pi);
			
			request.setAttribute("toppingList", toppingList);
			request.setAttribute("pi", pi);
			
			return "admin/sales/menu/toppingList";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//재료 상세보기용
	@RequestMapping(value="toppingDetail.ad", method=RequestMethod.GET)
	public String toppingDetail(@RequestParam int materialNo, HttpServletRequest request) {
		AdminMaterial topping=new AdminMaterial();
		try {
			topping=as.selectMaterial(materialNo);
			System.out.println("조회 토핑 : "+topping);
			request.setAttribute("topping", topping);
			return "admin/sales/menu/toppingDetail";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//토핑 수정 페이지 이동용
	@RequestMapping(value="modToppingView.ad", method=RequestMethod.GET)
	public String modToppingView(@RequestParam int materialNo, HttpServletRequest request) {
		AdminMaterial topping=new AdminMaterial();
		try {
			topping=as.selectMaterial(materialNo);
			System.out.println("수정 토핑 : "+topping);
			request.setAttribute("topping", topping);
			return "admin/sales/menu/modTopping";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//토핑 수정용
	@RequestMapping("modTopping.ad")
	public String modTopping(@ModelAttribute AdminMaterial topping, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		System.out.println("수정할 토핑 : "+topping);
		
		try {
			int result=as.updateMaterial(topping);
			redirectAttributes.addAttribute("materialNo", topping.getmNo());
			return "redirect:toppingDetail.ad";
		} catch (AdminUpdateException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//토핑 판매중지용
	@RequestMapping("deleteTopping.ad")
	public String delTopping(@RequestParam int materialNo, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		System.out.println("삭제할 토핑 번호 : "+materialNo);
		try {
			int result=as.deleteMaterial(materialNo);
			
			redirectAttributes.addAttribute("materialNo", materialNo);
			return "redirect:toppingDetail.ad";
		} catch (AdminDeleteException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//토핑 재판매용
	@RequestMapping("resellTopping.ad")
	public String resellTopping(@RequestParam int materialNo, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		System.out.println("재판매할 토핑 : "+materialNo);
		try {
			int result=as.resellMaterial(materialNo);
			redirectAttributes.addAttribute("materialNo", materialNo);
			return "redirect:toppingDetail.ad";
		} catch (AdminUpdateException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//주문 목록 조회용
	@RequestMapping("orderList.ad")
	public String orderList(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, HttpServletRequest request) {
		
		try {
			int listCount = as.selectOrderCount();
			PageInfo pi=Pagination.getPageInfo(currentPage, listCount);
			ArrayList<AdminOrder> orderList=new ArrayList<AdminOrder>();
			orderList=as.selectOrderList(pi);
			System.out.println("주문 목록 : "+orderList);
			request.setAttribute("orderList", orderList);
			request.setAttribute("pi", pi);
			return "admin/sales/orderList";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//주문 상세보기 용
	@RequestMapping(value="orderDetail.ad", method=RequestMethod.GET)
	public String orderDetail(@RequestParam int orderNo, HttpServletRequest request) {
		AdminOrder order=new AdminOrder();
		ArrayList<AdminOrderMenu> menuList=new ArrayList<AdminOrderMenu>();
		int total=0;
		try {
			order=as.selectOrder(orderNo);
			menuList=as.selectOrderMenu(orderNo);
			for(int i=0;i<menuList.size();i++) {
				total+=menuList.get(i).getPrice();
			}
			System.out.println("조회 주문 : "+order);
			System.out.println("주문 메뉴 : "+menuList);
			request.setAttribute("order", order);
			request.setAttribute("menuList", menuList);
			request.setAttribute("total", total);
			return "admin/sales/orderDetail";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//정산 목록 조회용
	@RequestMapping("calculateList.ad")
	public String calculateList(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, HttpServletRequest request) {
		ArrayList<AdminCalculateList>	calList=new ArrayList<AdminCalculateList>();
		try {
			int listCount = as.selectCalculateCount();
			PageInfo pi=Pagination.getPageInfo(currentPage, listCount);
			calList=as.selectCalculateList(pi);
			System.out.println("정산 목록 : "+calList);
			
			request.setAttribute("pi", pi);
			request.setAttribute("calList", calList);
			return "admin/sales/calculateList";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//정산 상세조회용
	@RequestMapping(value="calculateDetail.ad", method=RequestMethod.GET)
	public String calculateDetail(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, @ModelAttribute AdminCalculateList cal, HttpServletRequest request) {
		System.out.println(cal);
		AdminSeller seller=new AdminSeller();
		ArrayList<AdminCalculate> calList=new ArrayList<AdminCalculate>();
		int total=0;
		try {
			seller=as.selectSeller(cal.getComNo());
			calList=as.selectCalculate(cal);
			for(int i=0;i<calList.size();i++) {
				if(calList.get(i).getOrderCStatus().equals("N")) {total+=calList.get(i).getPrice();}
			}
			request.setAttribute("seller", seller);
			request.setAttribute("calList", calList);
			request.setAttribute("calOne", calList.get(0));
			request.setAttribute("total", total);
			return "admin/sales/calculateDetail";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//정산 완료 처리용 - 상세보기에서 ajax
	@RequestMapping(value="updateCalculate.ad", method=RequestMethod.GET)
	@ResponseBody
	public int updateCalculate(@ModelAttribute AdminCalculate cal, HttpServletRequest request, RedirectAttributes redirectAttributes) throws AdminUpdateException, AdminCountException {
		System.out.println("정산할 내역 : "+cal);
		int result=as.updateCalculate(cal);
		return result;
	}
	
	//정산 완료 처리용 - 정산목록에서 버튼 > ajax
	@RequestMapping(value="updateCalculateList.ad", method=RequestMethod.GET)
	@ResponseBody
	public int updateCalculateList(@ModelAttribute AdminCalculate cal, HttpServletRequest request) throws AdminUpdateException, AdminCountException {
		System.out.println("정산할 내역 : "+cal);
		int result=as.updateCalculate(cal);
		return result;	
	}
	
	//정산 완료 처리용 - 정산목록에서 체크박스 ajax
	@RequestMapping(value="updateSelectCalList.ad", method=RequestMethod.GET)
	@ResponseBody
	public int updateSelectCalList(@RequestParam(value="orderExpNo") String orderExpNo, @RequestParam(value="comNo") String comNo, HttpServletRequest request) throws AdminUpdateException, AdminCountException {
		System.out.println(orderExpNo);
		System.out.println(comNo);
		String[] orderExpNoArr=orderExpNo.split(",");
		String[] comNoArr=comNo.split(",");
		ArrayList<AdminCalculate> calList=new ArrayList<AdminCalculate>();
		for(int i=0;i<comNoArr.length;i++) {
			AdminCalculate cal=new AdminCalculate();
			cal.setComNo(Integer.parseInt(comNoArr[i]));
			cal.setOrderExpNo(Integer.parseInt(orderExpNoArr[i]));
			calList.add(cal);
		}
		int result=0;
		for(int i=0;i<calList.size();i++) {
			result+=as.updateCalculate(calList.get(i));
		}
		if(result==calList.size()) {
			return 1;
		}else {
			return -1;
		}
	}
	
	@RequestMapping("menuList.ad")
	public String selectMenuList(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, HttpServletRequest request) {
		ArrayList<AdminMenu> menuList=new ArrayList<AdminMenu>();
		
		try {
			int listCount=as.selectMenuCount();
			PageInfo pi=Pagination.getPageInfo(currentPage, listCount);
			menuList=as.selectMenuList(pi);
			request.setAttribute("menuList", menuList);
			request.setAttribute("pi", pi);
			return "admin/sales/menu/menuList";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@RequestMapping("menuDetail.ad")
	public String selectMenu(@RequestParam(value="basicNo") int basicNo, HttpServletRequest request) {
		AdminMenu menu=new AdminMenu();
		ArrayList<AdminMenu> menuDetail=new ArrayList<AdminMenu>();
		try {
			menu=as.selectMenu(basicNo);
			menuDetail=as.selectMenuDetail(basicNo);
			request.setAttribute("menu", menu);
			request.setAttribute("menuDetail", menuDetail);
			return "admin/sales/menu/menuDetail";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (AdminCountException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//전체 매출 조회용
	@RequestMapping("statistics.ad")
	public String statistics(HttpServletRequest request) {
		ArrayList<AdminSales> salesList=new ArrayList<AdminSales>();
		ArrayList<AdminSales> expenseList=new ArrayList<AdminSales>();
		AdminSales sales=new AdminSales(1);
		AdminSales expense=new AdminSales(0);
		try {
			
			salesList=as.selectStatistics(sales);
			expenseList=as.selectStatistics(expense);
			request.setAttribute("salesList", salesList);
			request.setAttribute("expenseList", expenseList);
			System.out.println("주문 목록 : "+salesList);
			System.out.println("재료 주문 : "+expenseList);
			return "admin/sales/statistics/statistics";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//업체 매출 조회용
	@RequestMapping(value="statisitcsCom.ad", method=RequestMethod.GET)
	public String statisitcsCom(@RequestParam(value="comNo", required=false, defaultValue="1")int comNo, HttpServletRequest request) {
		ArrayList<AdminSeller> sellerList=new ArrayList<AdminSeller>();
		ArrayList<AdminSales> salesList=new ArrayList<AdminSales>();
		ArrayList<AdminSales> expenseList=new ArrayList<AdminSales>();
		AdminSeller selectSeller=new AdminSeller();
		AdminSales sales=new AdminSales(1, comNo);
		AdminSales expense=new AdminSales(0, comNo);
		try {
			sellerList=as.selectSellerList();
			salesList=as.selectComStatistics(sales);
			expenseList=as.selectComStatistics(expense);
			for(int i=0;i<sellerList.size();i++) {
				if(sellerList.get(i).getComNo()==comNo) {
					selectSeller=sellerList.get(i);
				}
			}
			request.setAttribute("selectSeller", selectSeller);
			request.setAttribute("selectComNo", comNo);
			request.setAttribute("salesList", salesList);
			request.setAttribute("expenseList", expenseList);
			request.setAttribute("sellerList", sellerList);
			return "admin/sales/statistics/statisticsCom";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//재료별 매출 조회용
	@RequestMapping(value="statisticsMat.ad", method=RequestMethod.GET)
	public String statisitcsMat(@RequestParam(value="mCate", required=false, defaultValue="1")int materialCate, HttpServletRequest request) {
		ArrayList<AdminMaterial> matList=new ArrayList<AdminMaterial>();
		ArrayList<AdminMSales> salesList=new ArrayList<AdminMSales>();
		try {
			matList=as.selectMaterialList(materialCate);
			salesList=as.selectOrderMStat(materialCate);
			request.setAttribute("materialCate", materialCate);
			request.setAttribute("salesList", salesList);
			request.setAttribute("matList", matList);
			return "admin/sales/statistics/statisticsMat";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
	}
	
}