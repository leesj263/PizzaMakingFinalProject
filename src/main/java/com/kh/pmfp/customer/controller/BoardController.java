package com.kh.pmfp.customer.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.pmfp.customer.model.exception.BoardException;
import com.kh.pmfp.customer.model.service.BoardService;
import com.kh.pmfp.customer.model.vo.Board;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bs;
	
	@RequestMapping("faqOrder.bo")
	public String faqOrder(HttpServletRequest request){
		ArrayList<Board> faqOrder = new ArrayList<Board>();
		
		try {
			faqOrder= bs.selectfaqOrder();
			request.setAttribute("faqOrder", faqOrder);
			
			return "customer/faq/faqOrder";
		} catch (BoardException e) {
			request.setAttribute("msg", e.getMessage());
			 
			return "common/errorPage";
		}
		
	}

}
