package com.kh.pmfp.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.pmfp.common.model.vo.Member;

@Component
public class Interceptor extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		try { 
			
			if(request.getSession().getAttribute("loginUser") == null || 
					((Member)request.getSession().getAttribute("loginUser")).getMemberCateg()==0){ 
				
				response.sendRedirect("goMain.co");	
				return false; 
			} else if(((Member)request.getSession().getAttribute("loginUser")).getMemberCateg()==1) {
				
				response.sendRedirect("goMain.com?memberNo="+((Member)request.getSession().getAttribute("loginUser")).getMemberNo());
				return false;
			}
		} catch (Exception e) { 
				e.printStackTrace(); 
		} 
		//null이 아니면 정상적으로 controller 호출 
		return true; 
		
	}

}
