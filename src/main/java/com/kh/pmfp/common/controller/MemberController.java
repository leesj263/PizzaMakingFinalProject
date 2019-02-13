package com.kh.pmfp.common.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.pmfp.common.model.exception.LoginException;
import com.kh.pmfp.common.model.service.MemberService;
import com.kh.pmfp.common.model.vo.Company;
import com.kh.pmfp.common.model.vo.MailHandler;
import com.kh.pmfp.common.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private JavaMailSender mailSender;
	
	
	//로그인!-암호화 처리 전
	@RequestMapping(value="login.co",method=RequestMethod.POST)
	public String loginCheck(Member m,HttpServletRequest request,HttpServletResponse response) {
		
		System.out.println("member:"+m);
		
		try {
			Member loginUser = ms.loginMember(m);
			request.getSession().setAttribute("loginUser", loginUser);

			if(loginUser.getMemberCateg()==1) {
				return "redirect:goMain.com";
			}else if(loginUser.getMemberCateg()==2) {
				return "redirect:adminMain.t";
			}else {
				return "redirect:goMain.co";
			}
			
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
	
	//회원가입
	@RequestMapping("insertJoin.co")
	public String insertMember(Member m,Company c, HttpServletRequest request, HttpServletResponse response
								,@RequestParam String changeNum ,@RequestParam String comAddress3,@RequestParam String comAddress2,
								@RequestParam String openTime,@RequestParam String closeTime) {
		String allAddress = comAddress3+" "+comAddress2;
		String allSalestime = openTime+" ~ "+closeTime;
		c.setComAddress(allAddress);
		c.setComSalestime(allSalestime);
		//System.out.println("Member"+m);
		//System.out.println("Company"+c);
		//System.out.println("전체주소는 : "+allAddress);
		//System.out.println("전체 영업시간은 : "+allSalestime);
		//System.out.println(changeNum); //짝수이면 사업자 회원가입
		
		//bcrypt란?
				//DB에 비밀번호를 저장할 목적으로 설계되었다.
				
				//단방향 해쉬 함수는 암호화된 메세지를 수학적인 연산을 통해 암호화 된 메세지인 다이제스트를 생성한다.
				//원본 메세지를 가지고 암호화된 메세지를 복호화 할 수 있는 것을 양방향이라고 하고
				//암호화된 메세지를 복호화 할 수 없는 것을 단방향이라고 한다.
				
				//단방향 해쉬 함수도 사용하면 안되는 이유
				//1. 단방향 해쉬함수는 많은 다이제스트가 확보되면 평문을 찾아낼 수 있다.
				
				//2. 비밀번호를 저장하기 위한 목적으로 설계된 알고리즘이 아닌,
				//   검색을 위해 설계된 알고리즘이다.
				
				//이를 해결하기 위해 슬링(salting)기법이 추가되었다.
				//원본 메세지에 문자열을 추가하여 동일한 길이의 다이제스트를 생성하는 것을 슬링이라 한다.
				
				//하지만 salt값을 알아내면 나머지는 단방향 해쉬함수를 통한 다이제스트를 복호화 하는 것과
				//별 차이가 없다.
				
				//bcrypt방식은 이러한 salt값을 랜덤하게 생성하여 암호화를 하는 방식이다.
				//추가적으로 다이제스트를 생성하는데 걸릴 시간을 결정할 수도 있다.
				
				//1999년에 발표되어 현재까지 사용되는 가장 강력한 비밀번호 저장용 매커니즘이다.
		
		String encPassword = passwordEncoder.encode(m.getMemberPwd());
		System.out.println("암호화후 :"+encPassword);
		
		m.setMemberPwd(encPassword);
		int result=0;
		//사업자 회원가입
		if(Integer.parseInt(changeNum)%2==0) {
			result = ms.insertBusinessMember(m,c);
		}else {
			//일반회원 회원가입
			result = ms.insertNormalMember(m);
		}
		
		if(result>0) {
			return "redirect:goMain.co";
		}else {
			return "common/errorPage";
		}
		
		//return null;
	}
	
	//아이디 중복확인 체크!
	@RequestMapping("duplicationCheck.co")
	public @ResponseBody int duplicationCheck(@RequestParam String memberId, HttpServletResponse response) {
		
		System.out.println(memberId);
		int result = ms.duplicationCheck(memberId);
	
		if(result>0) {
			System.out.println("아이디 중복됨!!!");
		}else if(result==0){
			System.out.println("사용 가능한 아이디입니당");
		}else {
			System.out.println("아이디 공백쓰...?");
			result=100;
		}
		
		return result;
	}
	
	
	//회원가입-이메일 인증
	@RequestMapping("joinSendMail.co")
	public @ResponseBody HashMap<String,Object> joinSendMail(@RequestParam String memberId,@RequestParam String memberEmail,@RequestParam String randomCode) throws MessagingException, UnsupportedEncodingException {
		//System.out.println(memberId+memberEmail+randomCode);
		
		
		HashMap<String, Object> hmap=new HashMap<String,Object>();
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[피자 스쿨 이메일 인증 발송]");
		sendMail.setText(new StringBuffer().append("<h1>인증번호</h1>")
                .append("["+randomCode+"]")
                .toString());
		sendMail.setFrom("yesols9003@gmail.com", "예솔쓰");
		sendMail.setTo(memberEmail);
		sendMail.send();
		
		hmap.put("sendMail", "성공");
		return hmap;
		
	}
	
	//아이디 찾기-전송
	 @RequestMapping("idSearch.co")
	 public @ResponseBody HashMap<String, Object> idSearch(Member m, @RequestParam String idSearchName,@RequestParam String idSearchEmail) throws MessagingException, UnsupportedEncodingException{
		 //System.out.println(idSearchEmail+idSearchName);
		 
	     m.setMemberName(idSearchName);
	     m.setMemberEmail(idSearchEmail);
	     
	     String idSearch = ms.selectIdSearch(m);
	    // String dbIDsearch=idSearch.getMemberId();
	     
	     System.out.println(idSearch);
	     if(idSearch!=null) {
	    	//id와 pwd가 일치한다면 아이디 가져오기(정보있음)
	    	
	    	HashMap<String, Object> hmap=new HashMap<String,Object>();
	 		MailHandler sendMail = new MailHandler(mailSender);
	 		sendMail.setSubject("[피자 제작소 아이디 찾기]");
	 		sendMail.setText(new StringBuffer().append("<h1>아이디 찾기</h1>")
	                 .append(idSearchName+"님의 아이디는 ["+idSearch+"] 입니다.")
	                 .append("까먹지 마세용!")
	                 .toString());
	 		sendMail.setFrom("yesols9003@gmail.com", "예솔쓰");
	 		sendMail.setTo(idSearchEmail);
	 		sendMail.send();
	 		
	 		hmap.put("sendMail", "성공");
	 		return hmap;
	 		
	     }
	     return null;
	 }
	 
	 @RequestMapping("pwdSearch.co")
	 public @ResponseBody HashMap<String, Object> PwdSearch(Member m, @RequestParam String pwdSearchId,@RequestParam String pwdSearchEmail) throws MessagingException, UnsupportedEncodingException{
		
		// System.out.println("연결되닝?!");

		m.setMemberId(pwdSearchId);
		m.setMemberEmail(pwdSearchEmail);
		//System.out.println("아이디"+pwdSearchId);
		//System.out.println("이메일"+pwdSearchEmail);
		 
		//임시 비밀번호 
		String tempPassword = "";
		for (int i = 0; i < 8; i++) {
			int rndVal = (int) (Math.random() * 62);
			if (rndVal < 10) {
				tempPassword += rndVal;
			} else if (rndVal > 35) {
				tempPassword += (char) (rndVal + 61);
			} else {
				tempPassword += (char) (rndVal + 55);
			}
		}
		//System.out.println("임시비밀번호 : " + tempPassword);
		 
		
		 
		String pwdSearch = ms.selectPwdSearch(m);
		//System.out.println("null이 뜨는지 안뜨는지"+pwdSearch);
		
		if(pwdSearch!=null) {
			//이메일로 랜덤 코드전송
			HashMap<String, Object> hmap=new HashMap<String,Object>();
	 		MailHandler sendMail = new MailHandler(mailSender);
	 		sendMail.setSubject("[피자 제작소 : 임시 비밀번호]");
	 		sendMail.setText(new StringBuffer().append("<h1>임시 비밀번호</h1>")
	                 .append("임시 비밀번호는 ["+tempPassword+"] 입니다.")
	                 .append("다시 로그인 해주세용!")
	                 .toString());
	 		sendMail.setFrom("yesols9003@gmail.com", "예솔쓰");
	 		sendMail.setTo(pwdSearchEmail);
	 		sendMail.send();
	 		
	 		hmap.put("sendMail", "성공");
	 		
	 		String encPassword2 = passwordEncoder.encode(tempPassword);
	 		
	 		//DB에 업데이트
	 		m.setMemberPwd(encPassword2);
	 		int result = ms.updatePwd(m);
	 		
	 		if(result>0) {
	 			return hmap;
	 		}else {
	 			return null;
	 		}
		}
			return null;
	 }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
