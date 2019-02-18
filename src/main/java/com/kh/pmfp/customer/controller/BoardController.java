package com.kh.pmfp.customer.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.pmfp.admin.model.exception.AdminInsertException;
import com.kh.pmfp.admin.model.vo.AdminBoard;
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
	@RequestMapping("qnaWrite.ad")
	public String noticeWrite(@ModelAttribute Board qna, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(qna);

		qna.setMemberNo(1);

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
}
