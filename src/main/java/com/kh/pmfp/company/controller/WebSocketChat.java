package com.kh.pmfp.company.controller;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.server.ServerEndpoint;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.pmfp.company.model.exception.FailSelectOrder;
import com.kh.pmfp.company.model.service.CompanyService;
import com.kh.pmfp.company.model.service.CompanyServiceImpl;
import com.kh.pmfp.company.model.vo.CompanyOrder;

import javax.websocket.RemoteEndpoint.Basic;

@Controller
@ServerEndpoint(value="/echo.com")
public class WebSocketChat extends TextWebSocketHandler{

	@Autowired
	private CompanyService cs;
	
   private static final List<Session> sessionList=new ArrayList<Session>();;
   private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
   public WebSocketChat() {
       // TODO Auto-generated constructor stub
       System.out.println("웹소켓(서버) 객체생성");
   }
   @RequestMapping(value="/chat.com")
   public ModelAndView getChatViewPage(ModelAndView mav) {
       mav.setViewName("chat");
       return mav;
   }
   @OnOpen
   public void onOpen(Session session) {
       logger.info("Open session id:"+session.getId());
       try {
           final Basic basic=session.getBasicRemote();
           basic.sendText("Connection Established");
       }catch (Exception e) {
           // TODO: handle exception
           System.out.println(e.getMessage());
       }
       sessionList.add(session);
   }
   /*
    * 모든 사용자에게 메시지를 전달한다.
    * @param self
    * @param message
    */
   public void sendAllSessionToMessage(Session self,String message) {
       try {
           for(Session session : WebSocketChat.sessionList) {
               if(!self.getId().equals(session.getId())) {
                   session.getBasicRemote().sendText("Message category : "+message.split(",")[0]  + 
                		   ",Id : "+message.split(",")[1]);
               }
           }
       }catch (Exception e) {
           // TODO: handle exception
           System.out.println(e.getMessage());
       }
   }
   @OnMessage
   public void onMessage(String message,Session session) {
	   System.out.println("onMessage동작!");
	   System.out.println("message : " + message);
	   ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
	  
	   int result=0;
	   //로그인시 동작할 조건문
	   if(message.split(",")[0].equals("find")) {
		   logger.info("Message category : "+message.split(",")[0]  + 
	    		   ",Id : "+message.split(",")[1]);
		   //배달목록 리스트 가져오기
		   
		   int comNo = Integer.parseInt(message.split(",")[1]);
			//여기서 못넘어감
			//CompanyService cs = new CompanyServiceImpl();
		   	//CompanyController cc = new CompanyController();
			try {
				//ArrayList<CompanyOrder> list = cc.TestMapping(3);
				//System.out.println("TestMapping동작 : " + list);
				CompanyService cs = new CompanyServiceImpl();
				list = cs.orderDeliveringSocket(comNo);
				System.out.println("웹소켓으로 조회해온 list : " + list);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			try {
		    	   //보낸 당사자에게만 반환
		           final Basic basic=session.getBasicRemote();
		           basic.sendText("to : "+ list);
		       }catch (Exception e) {
		           // TODO: handle exception
		           System.out.println(e.getMessage());
		       }
			
	   }//login If문 종료
      
	   if(message.split(",")[0].equals("change")) {
		   logger.info("Message category : "+message.split(",")[0]  + 
	    		   ",Id : "+message.split(",")[1]);
		   
		   int orderNo = Integer.parseInt(message.split(",")[1]);
			try {
		   CompanyService cs = new CompanyServiceImpl();
		   result = cs.orderUpdateToCompleteSocket(orderNo);
			System.out.println("웹소켓으로 갱신된 행 갯수 result : " + result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
	    	   //보낸 당사자에게만 반환
	           final Basic basic=session.getBasicRemote();
	           basic.sendText("to : "+ result);
	       }catch (Exception e) {
	           // TODO: handle exception
	           System.out.println(e.getMessage());
	       }
	   }
	   
       
       //모든 사용자에게 반환
       sendAllSessionToMessage(session, message);
   }
   @OnError
   public void onError(Throwable e,Session session) {
	   System.out.println("onError : "+e.getMessage());
   }
   @OnClose
   public void onClose(Session session) {
       logger.info("Session "+session.getId()+" has ended");
       sessionList.remove(session);
   }
}