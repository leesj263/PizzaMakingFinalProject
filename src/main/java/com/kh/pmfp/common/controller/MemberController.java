package com.kh.pmfp.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.pmfp.common.model.exception.LoginException;
import com.kh.pmfp.common.model.service.MemberService;
import com.kh.pmfp.common.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;
	
	
	//로그인!-암호화 처리 전
	@RequestMapping(value="login.co",method=RequestMethod.POST)
	public String loginCheck(Member m,HttpServletRequest request,HttpServletResponse response) {
		
		System.out.println("member:"+m);
		
		try {
			Member loginUser = ms.loginMember(m);
			request.getSession().setAttribute("loginUser", loginUser);
			
			return "redirect:goMain.co";
		} catch (LoginException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

		//return "main/main";
		
	}
	
	@RequestMapping("goMain.co")
	public String goMain() {
		return "main/main";
	}
	
	@RequestMapping("logout.co")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:goMain.co";
	}
	
	
	
	
}
