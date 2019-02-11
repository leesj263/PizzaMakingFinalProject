package com.kh.pmfp.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminDeleteException;
import com.kh.pmfp.admin.model.exception.AdminInsertException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.exception.AdminUpdateException;
import com.kh.pmfp.admin.model.service.AdminService;
import com.kh.pmfp.admin.model.vo.AdminBoard;
import com.kh.pmfp.admin.model.vo.AdminBoard2;
import com.kh.pmfp.admin.model.vo.AdminMember;
import com.kh.pmfp.admin.model.vo.AdminOrder;
import com.kh.pmfp.admin.model.vo.AdminSeller;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService as;

	@RequestMapping(value="admin", method=RequestMethod.GET)
	public String adminPage(@RequestParam("admin")String admin) {
		System.out.println(admin);
		return "admin/"+admin;
	}
	
	//회원 목록 출력용
	@RequestMapping("userList.ad")
	public String userList(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminMember> userList=new ArrayList<AdminMember>();
		
		try {
			userList=as.selectUserList();
			System.out.println("회원 목록 : "+userList);
			request.setAttribute("memberList", userList);
			return "admin/user/userList";
		} catch (AdminSelectException e) {
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
	public String sellerList(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminSeller> sellerList=new ArrayList<AdminSeller>();
		
		try {
			sellerList=as.selectSellerList();
			System.out.println("지점 목록 : "+sellerList);
			request.setAttribute("sellerList", sellerList);
			return "admin/seller/sellerList";
		} catch (AdminSelectException e) {
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
	
	//업체 상세 조회용
	@RequestMapping(value="sellerDetail.ad", method=RequestMethod.GET)
	public String sellerDetail(int num, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("업체 번호 : "+num);
		AdminSeller seller=new AdminSeller();
		//ArrayList<AdminOrder> orderList=new ArrayList<AdminOrder>();
		
		try {
			seller=as.selectSeller(num);
			//orderList=as.selectSellerOrder(num);
			System.out.println("조회 업체 : "+seller);
			//System.out.println("주문 목록 : "+orderList);
			
			request.setAttribute("seller", seller);
			//request.setAttribute("orderList", orderList);
			
			return "admin/seller/sellerDetail";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//업체 주문 목록 조회용
	
	@RequestMapping("sellerOrder.ad")
	public String sellerOrder(HttpServletRequest request, HttpServletResponse response) {
		//ArrayList<AdminSeller> sellerOrder=new ArrayList<AdminSeller>();
		/*
		try {
			sellerOrder=as.selectWaitSeller();
			System.out.println("업체 주문 : "+sellerOrder);
			request.setAttribute("sellerOrder", sellerOrder);
			return "admin/seller/sellerOrder";
			
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}	*/
		return "admin/seller/sellerOrder";
	}
	
	
	//업체 주문 상세 조회용
	/*
	@RequestMapping(value="sellerOrderDetail.ad", method=RequestMethod.GET)
	public String sellerOrderDetail(int num, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("재료주문번호 : "+num);
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
	*/
	
	@RequestMapping("noticeList.ad")
	public String selectNoticeList(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminBoard> noticeList=new ArrayList<AdminBoard>();
		
		try {
			noticeList=as.selectNoticeList();
			System.out.println("공지사항 목록 : "+noticeList);
			request.setAttribute("noticeList", noticeList);
			
			return "admin/board/noticeList";
		} catch (AdminSelectException e) {
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
	public String qnaList(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminBoard> qnaList=new ArrayList<AdminBoard>();
		
		try {
			qnaList=as.selectQnaList();
			System.out.println("Q&A목록 : "+qnaList);
			request.setAttribute("qnaList", qnaList);
			
			return "admin/board/qnaList";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
	}
	
	//qna 답변 대기 목록 조회용
	@RequestMapping("qnaWaitList.ad")
	public String qnaWaitList(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminBoard> qnaWaitList=new ArrayList<AdminBoard>();
		
		try {
			qnaWaitList=as.selectQnaWaitList();
			System.out.println("Q&A 답변 대기 목록 : "+qnaWaitList);
			request.setAttribute("qnaWaitList", qnaWaitList);
			
			return "admin/board/qnaWaitList";
		} catch (AdminSelectException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
	}
	
	//qna 답변 완료 목록 조회용
	@RequestMapping("qnaCompleteList.ad")
	public String qnaCompleteList(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminBoard> qnaCompleteList=new ArrayList<AdminBoard>();
		
		try {
			qnaCompleteList=as.selectQnaCompleteList();
			System.out.println("Q&A 답변 완료 목록 : "+qnaCompleteList);
			request.setAttribute("qnaCompleteList", qnaCompleteList);
			
			return "admin/board/qnaCompleteList";
		} catch (AdminSelectException e) {
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
		
	
}
