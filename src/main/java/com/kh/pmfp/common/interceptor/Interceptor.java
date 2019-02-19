package com.kh.pmfp.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.pmfp.common.model.vo.Member;

public class Interceptor extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){ 
		try { 
			//loginUser 세션값이 널일경우
			if(request.getSession().getAttribute("loginUser") == null || 
					((Member)request.getSession().getAttribute("loginUser")).getMemberCateg()==0){ 
				//로그인페이지로 redirect 
				response.sendRedirect("goMain.co");	
				return false; 
			} else if(((Member)request.getSession().getAttribute("loginUser")).getMemberCateg()==1) {
				
				response.sendRedirect("goMain.com?memberNo="+((Member)request.getSession().getAttribute("loginUser")).getMemberNo());
				return false;
			}
		} catch (Exception e) { 
				e.printStackTrace(); 
		} 
		//널이 아니면 정상적으로 컨트롤러 호출 
		return true; 
		
	}

}
