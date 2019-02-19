package com.kh.pmfp.customer.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.pmfp.admin.model.exception.AdminInsertException;
import com.kh.pmfp.admin.model.vo.AdminBoard;
import com.kh.pmfp.common.model.vo.Member;
import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.common.model.vo.Pagination;
import com.kh.pmfp.customer.model.exception.BoardException;
import com.kh.pmfp.customer.model.service.BoardService;
import com.kh.pmfp.customer.model.vo.Board;

@Controller
public class BoardController {

	@Autowired
	private BoardService bs;

	// faq나타내기
	@RequestMapping("faqOrder.bo")
	public String faqOrder(HttpServletRequest request) {
		ArrayList<Board> faqOrder = new ArrayList<Board>();

		try {
			faqOrder = bs.selectfaqOrder();
			request.setAttribute("faqOrder", faqOrder);

			return "customer/faq/faqOrder";
		} catch (BoardException e) {
			request.setAttribute("msg", e.getMessage());

			return "common/errorPage";
		}

	}

	// qna작성
	@RequestMapping("qnaWrite.bo")
	public String noticeWrite(@ModelAttribute Board qna, HttpServletRequest request, HttpServletResponse response, String category) {
		System.out.println(qna);
		System.out.println(category);
		Integer.parseInt(category);
		// 세션에서 memberNo 가져와서 넣기qna.setMemberNo(1);
		HttpSession session = request.getSession();
		Member loginUser= (Member) session.getAttribute("loginUser");
		qna.setMemberNo(loginUser.getMemberNo());
		qna.setBoardCateg(Integer.parseInt(category));


		try {
			int result = bs.insertqna(qna);
			System.out.println("작성한 qna 개수: " + result);

			return "redirect:qnaList.bo";
		} catch (BoardException e) {
			request.setAttribute("msg", e.getMessage());

			return "common/errorPage";
		}
	}

	// qna수정
	@RequestMapping("qnaUpdate.bo")
	public String qnaUpdate(@ModelAttribute Board qna, HttpServletRequest request, HttpServletResponse response) {
		qna.setMemberNo(1);

		try {
			int result = bs.updateqna(qna);
			return "redirect:qnaList.bo";
		} catch (BoardException e) {
			request.setAttribute("msg", e.getMessage());

			return "common/errorPage";
		}
		
	}	
	//qna리스트
	@RequestMapping("qnaList.bo")
	public String qnaList(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, HttpServletRequest request, HttpServletResponse response) {
		ArrayList<Board> qnaList=new ArrayList<Board>();
		
		
		try {
			int listCount = bs.selectQnaCount();
			PageInfo pi=Pagination.getPageInfo(currentPage, listCount);
			qnaList=bs.selectqnaList(pi);
			request.setAttribute("qnaList", qnaList);
			request.setAttribute("pi", pi);
			System.out.println(qnaList);
			return "customer/qna/qnaList";
		} catch (BoardException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	
	}
	//qna 상세보기
	@RequestMapping(value="qnaDetail.bo", method=RequestMethod.GET)
	public String selectQna(int num, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("게시글 번호 : "+num);
		Board qna=new Board();
		Board answer=new Board();
		//qna=bs.selectQna(num);
		answer=bs.selectAnswer(num);
		return "customer/qna/qnaDetail";
	}
	//qna 삭제용
		@RequestMapping(value="noticeDelete.bo", method=RequestMethod.GET)
		public String noticeDelete(@RequestParam int num, HttpServletRequest request, HttpServletResponse response) {
			return null;
	
}
}

