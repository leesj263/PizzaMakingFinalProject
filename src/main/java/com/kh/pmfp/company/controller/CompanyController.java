package com.kh.pmfp.company.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.pmfp.company.model.exception.FailChangeCalendarDate;
import com.kh.pmfp.company.model.exception.FailInsertEmployeeInfo;
import com.kh.pmfp.company.model.exception.FailInsertOrderStock;
import com.kh.pmfp.company.model.exception.FailSelectAdminMessage;
import com.kh.pmfp.company.model.exception.FailSelectCalendar;
import com.kh.pmfp.company.model.exception.FailSelectCompanyReview;
import com.kh.pmfp.company.model.exception.FailSelectCompanySales;
import com.kh.pmfp.company.model.exception.FailSelectDeliveryMan;
import com.kh.pmfp.company.model.exception.FailSelectEmployeeList;
import com.kh.pmfp.company.model.exception.FailSelectOrder;
import com.kh.pmfp.company.model.exception.FailSelectOrderStock;
import com.kh.pmfp.company.model.exception.FailUpdateDelivery;
import com.kh.pmfp.company.model.exception.FailUpdateEmployeeInfo;
import com.kh.pmfp.company.model.exception.FailUpdateOrderStatus;
import com.kh.pmfp.company.model.exception.FaileDetailMessage;
import com.kh.pmfp.company.model.service.CompanyService;
import com.kh.pmfp.company.model.vo.CompanyBoard;
import com.kh.pmfp.company.model.vo.CompanyCalendar;
import com.kh.pmfp.company.model.vo.CompanyEmployee;
import com.kh.pmfp.company.model.vo.CompanyMaterial;
import com.kh.pmfp.company.model.vo.CompanyOrder;
import com.kh.pmfp.company.model.vo.CompanyOrderStock;
import com.kh.pmfp.company.model.vo.CompanyRemainMaterial;
import com.kh.pmfp.company.model.vo.CompanySales;
import com.kh.pmfp.company.model.vo.CompanySalesList;

import net.sf.json.JSONObject;

@Controller
public class CompanyController {
	@Autowired
	private CompanyService cs;

	/*
	 * @RequestMapping("/login.me") public String loginCheck(HttpServletRequest
	 * request, HttpServletResponse response) {
	 * 
	 * String userId = request.getParameter("userId"); String userPwd =
	 * request.getParameter("userPwd");
	 * 
	 * System.out.println("userId : " + userId); System.out.println("userPwd : " +
	 * userPwd);
	 * 
	 * return "main/main"; }
	 */

	/*
	 * @RequestMapping(value = "/login.me", method=RequestMethod.POST) public String
	 * loginCheck(@RequestParam("userId")String
	 * userId, @RequestParam("userPwd")String userPwd) {
	 * 
	 * 
	 * System.out.println("userId : " + userId); System.out.println("userPwd : " +
	 * userPwd);
	 * 
	 * 
	 * return "main/main"; }
	 */

	/*
	 * @RequestMapping(value = "/login.me", method=RequestMethod.POST) public String
	 * loginCheck(String userId, String userPwd) {
	 * 
	 * System.out.println("userId : " + userId); System.out.println("userPwd : " +
	 * userPwd);
	 * 
	 * return "main/main"; }
	 */

	/*
	 * @RequestMapping(value = "/login.me", method=RequestMethod.POST) public String
	 * loginCheck(@ModelAttribute Member m) {
	 * 
	 * System.out.println("member : " + m);
	 * 
	 * return "main/main"; }
	 */
	//페이지 이동
	@RequestMapping(value = "movePage.com", method = RequestMethod.GET)
	public String moveCompanyPage(String movePage) {
		return "company/" + movePage;
	}
	
	//고객페이지로 이동
	@RequestMapping(value = "movePageToCustomerReview.com", method = RequestMethod.GET)
	public String moveCompanyPage2(String movePage) {
		return "customer/review/" + movePage;
	}

	
/*	
	@RequestMapping(value = "goMain.com", method = RequestMethod.GET)
	public String goCompanyMain(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CompanyBoard> adminMessage = new ArrayList<CompanyBoard>();
		HashMap<String, ArrayList> hmap = new HashMap<String, ArrayList>();
		try {
			adminMessage = cs.selectAdminMessage();
			// System.out.println("adminMessage : " + adminMessage);
			request.setAttribute("adminMessage", adminMessage);
			return "company/companyMain";
			// return "redirect:RedirectGoMain.com";
		} catch (FailSelectAdminMessage e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}*/
	
	//업체 메인페이지로 이동(관리자 메세지보기, 달력보기)
	@RequestMapping(value = "goMain.com", method = RequestMethod.GET)
	public String goCompanyMain(HttpServletRequest request, HttpServletResponse response, String memberNo) {
		HashMap<String, ArrayList> hmap = new HashMap<String, ArrayList>();
		try {
			int IntMemberNo = Integer.parseInt(memberNo);
			hmap = cs.selectAdminMessage(IntMemberNo);
			ArrayList<CompanyBoard> adminMessage = hmap.get("adminMessage");
			ArrayList<CompanyCalendar> memberCalendar = hmap.get("memberCalendar");
			// System.out.println("adminMessage : " + adminMessage);
			request.setAttribute("adminMessage", adminMessage);
			request.setAttribute("memberCalendar", memberCalendar);
			System.out.println("adminMessage : " + adminMessage);
			System.out.println("memberCalendar : " + memberCalendar);
			return "company/companyMain";
			// return "redirect:RedirectGoMain.com";
		} catch (FailSelectAdminMessage e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
	}
	
	
	/*//여기 부분 goMain.com부분과 합치는것으로 테스트해보기
		@RequestMapping("selectMemberCalendar.com")
		public String selectMemberCalendar(String memberNo, HttpServletRequest request, HttpServletResponse response) {
			ArrayList<CompanyCalendar> calendarList = new ArrayList<CompanyCalendar>();
			//임의로 회원번호 삽입
			int selectMemberNo = Integer.parseInt(memberNo);
			try {
				calendarList = cs.selectMemberCalendar(selectMemberNo);
				System.out.println("calendarList : " + calendarList);
				request.setAttribute("calendarList", calendarList);
				
				return "redirect:goMain.com";
			} catch (FailSelectCalendar e) {
				// TODO Auto-generated catch block
				request.setAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
			
			
		}*/
	
	
	
	
	
	//관리자 메세지 상세보기
	@RequestMapping("detailAdminMessage.com")
	public String detailAdminMessage(int boardNo, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("클릭한 게시글 번호 : " + boardNo);

		try {
			CompanyBoard detailMessage = cs.detailAdminMessage(boardNo);
			System.out.println("detailMessage : " + detailMessage);
			request.setAttribute("detailMessage", detailMessage);
			return "company/DetailAdminMessage";

		} catch (FaileDetailMessage e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	@RequestMapping("RedirectGoMain.com")
	public String goMain() {
		return "company/companyMain";
	}

	//주문대기
	@RequestMapping("orderWaiting.com")
	public String orderWaiting(HttpServletRequest request, HttpServletResponse response, String comNo) {
		int IntComNo = Integer.parseInt(comNo);
		System.out.println("IntComNo : " + IntComNo);
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		try {
			list = cs.orderWaiting(IntComNo);
			System.out.println("대기중 리스트 : " + list);
			request.setAttribute("list", list);
			return "company/orderListWaitting";

		} catch (FailSelectOrder e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}
	
	//주문 제조중
	@RequestMapping("orderMaking.com")
	public String orderMaking(HttpServletRequest request, HttpServletResponse response, String comNo) {
		int IntComNo = Integer.parseInt(comNo);
		System.out.println("IntComNo : " + IntComNo);
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		ArrayList<CompanyEmployee> DeliveryManList = new ArrayList<CompanyEmployee>();
		try {
			list = cs.orderMaking(IntComNo);
			System.out.println("제조중 리스트 : " + list);
			request.setAttribute("list", list);

			DeliveryManList = cs.remainDeliveryMan(IntComNo);
			request.setAttribute("DeliveryManList", DeliveryManList);
			System.out.println("배달원 리스트 : " + DeliveryManList);
			return "company/orderListMaking";

		} catch (FailSelectOrder | FailSelectDeliveryMan e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	//주문 배달중
	@RequestMapping("orderDelivering.com")
	public String orderDelivering(HttpServletRequest request, HttpServletResponse response, String comNo) {
		int IntComNo = Integer.parseInt(comNo);
		System.out.println("IntComNo : " + IntComNo);
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		try {
			list = cs.orderDelivering(IntComNo);
			System.out.println("배달중 리스트 : " + list);
			request.setAttribute("list", list);
			return "company/orderListDelivering";

		} catch (FailSelectOrder e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	//배달완료
	@RequestMapping("orderComplete.com")
	public String orderComplete(HttpServletRequest request, HttpServletResponse response, String comNo) {
		int IntComNo = Integer.parseInt(comNo);
		System.out.println("IntComNo : " + IntComNo);
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		try {
			list = cs.orderComplete(IntComNo);
			System.out.println("배달완료 리스트 : " + list);
			request.setAttribute("list", list);
			return "company/orderListComplete";

		} catch (FailSelectOrder e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	//배달 거절목록
	@RequestMapping("orderRefuseList.com")
	public String orderRefuseList(HttpServletRequest request, HttpServletResponse response, String comNo) {
		int IntComNo = Integer.parseInt(comNo);
		System.out.println("IntComNo : " + IntComNo);
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		try {
			list = cs.orderRefuseList(IntComNo);
			System.out.println("거절목록 리스트 : " + list);
			request.setAttribute("list", list);
			return "company/orderListRefuse";

		} catch (FailSelectOrder e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 주문을 수락
	@RequestMapping("acceptOrder.com")
	public String acceptOrder(String orderNo, String comNo) {
		int orderNoInt = Integer.parseInt(orderNo);
		int IntComNo = Integer.parseInt(comNo);
		
		
		CompanySales comsales = new CompanySales();
		comsales.setOrderNo(orderNoInt);
		comsales.setComNo(IntComNo);
		
		try {
			int result = cs.acceptOrder(comsales);
			System.out.println("acceptresult : " + result);

		} catch (FailUpdateOrderStatus e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:orderWaiting.com?comNo="+comNo;
	}

	// 주문을 거절
	@RequestMapping("refuseOrder.com")
	public String refuseOrder(String orderNo, String comNo) {
		int orderNoInt = Integer.parseInt(orderNo);
		try {
			int result = cs.refuseOrder(orderNoInt);
			System.out.println("refuseresult : " + result);

		} catch (FailUpdateOrderStatus e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:orderWaiting.com?comNo="+comNo;
	}

	/*
	 * @RequestMapping("remainDeliveryMan.com") public String
	 * remainDeliveryMan(HttpServletRequest request, HttpServletResponse response) {
	 * ArrayList<CompanyEmployee> DeliveryManList = new
	 * ArrayList<CompanyEmployee>(); try { DeliveryManList = cs.remainDeliveryMan();
	 * request.setAttribute("DeliveryManList", DeliveryManList);
	 * System.out.println("배달원 목록 : " + DeliveryManList); return
	 * "redirect:orderMaking.com"; //이 함수 내용들을 orderListMaking에 들어갈때 같이 정보들을 가져오도록
	 * 하기
	 * 
	 * } catch (FailSelectDeliveryMan e) { request.setAttribute("msg",
	 * e.getMessage()); return "common/errorPage"; }
	 * 
	 * }
	 */

	//배달원 배정
	@RequestMapping("assignDeliveryMan.com")
	public String assignDeliveryMan(String orderNo, String empNo, HttpServletRequest request,
			HttpServletResponse response, String comNo) {
		// 배달원 상태변경
		// 주문 상태변경 2가지를 수행해야됨
		System.out.println("배달원지정 메소드 들어옴");
		int orderNoInt = Integer.parseInt(orderNo);
		int empNoInt = Integer.parseInt(empNo);

		try {
			int deliveryManUpdate = cs.deliveryManUpdateM(orderNoInt, empNoInt);
			int orderUpdate = cs.orderUpdateM(orderNoInt);
			System.out.println("deliveryManUpdate : " + deliveryManUpdate);
			System.out.println("orderUpdate : " + orderUpdate);

			return "redirect:orderMaking.com?comNo="+comNo;
		} catch (FailUpdateDelivery | FailUpdateOrderStatus e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	//배달완료로 상태변경
	@RequestMapping("deliveryComplete.com")
	public String deliveryComplete(String orderNo, HttpServletRequest request, HttpServletResponse response, String comNo) {
		int orderNoInt = Integer.parseInt(orderNo);

		try {
			int result = cs.orderUpdateToComplete(orderNoInt);
			return "redirect:orderDelivering.com?comNo="+comNo;

		} catch (FailUpdateOrderStatus e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}

	//배달상태 삭제로 변경
	@RequestMapping("orderUpdateToDelete.com")
	public String orderUpdateToDelete(String orderNo, HttpServletRequest request, HttpServletResponse response, String comNo) {

		int orderNoInt = Integer.parseInt(orderNo);

		try {
			int result = cs.orderUpdateToDelete(orderNoInt);

			return "redirect:orderComplete.com?comNo="+comNo;

		} catch (FailUpdateOrderStatus e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	//거절목록 삭제
	@RequestMapping("refuseListDelete.com")
	public String refuseListDelete(String orderNo, HttpServletRequest request, HttpServletResponse response, String comNo) {

		int orderNoInt = Integer.parseInt(orderNo);

		try {
			int result = cs.refuseListDelete(orderNoInt);

			return "redirect:orderRefuseList.com?comNo="+comNo;
		} catch (FailUpdateOrderStatus e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	//직원목록 가져오기
	@RequestMapping("selectEmployeeList.com")
	public String selectEmployeeList(HttpServletRequest request, HttpServletResponse response, String comNo) {
		int IntComNo = Integer.parseInt(comNo);
		ArrayList<CompanyEmployee> list = new ArrayList<CompanyEmployee>();
		try {
			list = cs.selectEmployeeList(IntComNo);
			request.setAttribute("list", list);
			return "company/CompanyEmployeeList";

		} catch (FailSelectEmployeeList e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	//새로운 직원 넣기
	@RequestMapping("inputEmployeeInfo.com")
	public void inputEmployeeInfo(HttpServletRequest request, HttpServletResponse response, String comNo) {
		int IntComNo = Integer.parseInt(comNo);
		String inputRank = request.getParameter("inputRank");
		String inputName = request.getParameter("inputName");
		String inputPhone = request.getParameter("inputPhone");
		String inputAddress = request.getParameter("inputAddress");
		String inputDate = request.getParameter("inputDate");

		System.out.println("inputRank : " + inputRank);
		System.out.println("inputName : " + inputName);
		System.out.println("inputPhone : " + inputPhone);
		System.out.println("inputAddress : " + inputAddress);
		System.out.println("inputDate : " + inputDate);

		try {
			java.sql.Date date = java.sql.Date.valueOf(inputDate);
			System.out.println("date : " + date);
			CompanyEmployee ce = new CompanyEmployee();
			ce.setEmployeeRank(inputRank);
			ce.setEmployeeName(inputName);
			ce.setEmployeePhone(inputPhone);
			ce.setEmployeeAddress(inputAddress);
			ce.setEmployeeDate(date);
			ce.setCompanyNo(IntComNo);
			
			int result = cs.inputEmployeeInfo(ce);

		} catch (FailInsertEmployeeInfo e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	//직원 목록 삭제
	@RequestMapping("deleteEmployeeInfo.com")
	public void deleteEmployeeInfo(HttpServletRequest request, HttpServletResponse response) {
		String[] empNoList = request.getParameterValues("arr");
		ArrayList<Integer> list = new ArrayList<Integer>();

		System.out.println("empNoList길이 : " + empNoList.length);

		for (int i = 0; i < empNoList.length; i++) {
			list.add(Integer.parseInt(empNoList[i]));
			System.out.println("empNoList[" + i + "] : " + empNoList[i]);
		}

		try {
			int result = cs.deleteEmployeeInfo(list);

		} catch (FailUpdateEmployeeInfo e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
	//업체 리뷰목록 가져오기
	@RequestMapping("selectCompanyReview.com")
	public String selectCompanyReview(HttpServletRequest request, HttpServletResponse response, String comNo) {
		int IntComNo = Integer.parseInt(comNo);
		ArrayList<CompanyBoard> list = new ArrayList<CompanyBoard>();
		try {
			list = cs.selectCompanyReview(IntComNo);
			request.setAttribute("list", list);
			return "company/companyAnswer";

		} catch (FailSelectCompanyReview e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}

	//재고 주문페이지로 이동(재고들 목록 가져옴(가격, 종류등 정보))
	@RequestMapping("orderStrok.com")
	public String orderStrok(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CompanyMaterial> list = new ArrayList<CompanyMaterial>();
		try {
			list = cs.orderStrok();
			request.setAttribute("list", list);
			return "company/orderStock";
		} catch (FailSelectOrderStock e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}

	//재고 주문하기(주문할 재고들 선택된 상태)
	@RequestMapping("applyStock.com")
	public void applyStock(HttpServletRequest request, HttpServletResponse response) {

		String[] arr = request.getParameterValues("arr");
		ArrayList<CompanyOrderStock> list = new ArrayList<CompanyOrderStock>();

		/*
		 * for(int i = 0; i< arr.length; i++) { System.out.println("arr[" + i + "] : " +
		 * arr[i]); }
		 */

		for (int i = 0; i < arr.length; i++) {
			String[] splitArr;
			splitArr = arr[i].split(",");
			CompanyOrderStock cos = new CompanyOrderStock();
			cos.setComNo(Integer.parseInt(splitArr[0]));
			cos.setMaterialNo(Integer.parseInt(splitArr[1]));
			cos.setMaterialWeight(Integer.parseInt(splitArr[3].split("k")[0]));
			cos.setMaterialPrice(Integer.parseInt(splitArr[4]));
			list.add(cos);
		}
		System.out.println("list : " + list);

		try {
			int result = cs.applyStock(list);

		} catch (FailInsertOrderStock e) {
			request.setAttribute("msg", e.getMessage());
		}

	}

	//주문목록 리스트 가져옴
	@RequestMapping("selectOrderStockList.com")
	public String selectOrderStockList(HttpServletRequest request, HttpServletResponse response, String comNo) {
		int IntComNo = Integer.parseInt(comNo);
		ArrayList<CompanyOrderStock> list = new ArrayList<CompanyOrderStock>();
		try {
			list = cs.selectOrderStockList(IntComNo);
			request.setAttribute("list", list);
			return "company/orderStockList";

		} catch (FailSelectOrderStock e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}

	//배달 수령으로 상태변경 
	@RequestMapping("receiptConfirm.com")
	public void receiptConfirm(HttpServletRequest request, HttpServletResponse response) {
		String[] arr = request.getParameterValues("arr");
		ArrayList<Integer> orderMno = new ArrayList<Integer>();

		for (int i = 0; i < arr.length; i++) {
			orderMno.add(Integer.parseInt(arr[i]));
		}

		System.out.println("orderMno : " + orderMno);

		try {
			int result = cs.receiptConfirm(orderMno);

		} catch (FailInsertOrderStock e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//결제목록 리스트 가져오기
	@RequestMapping("selectReceiptList.com")
	public String selectReceiptList(HttpServletRequest request, HttpServletResponse response, String comNo) {
		int IntComNo = Integer.parseInt(comNo);
		ArrayList<CompanyOrderStock> list = new ArrayList<CompanyOrderStock>();
		try {
			list = cs.selectReceiptList(IntComNo);
			request.setAttribute("list", list);
			return "company/companyReceipt";
		} catch (FailSelectOrderStock e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	//모든 재고 리스트 가져오기
	@RequestMapping("selectAllMaterialList.com")
	public String selectAllMaterialList(HttpServletRequest request, HttpServletResponse response, String comNo) {
		int IntConNo = Integer.parseInt(comNo);
		ArrayList<CompanyRemainMaterial> list = new ArrayList<CompanyRemainMaterial>();
		try {
			list = cs.selectAllMaterialList(IntConNo);
			request.setAttribute("list", list);
			System.out.println("조회한 모든 남은재고 list : " + list);
			return "company/companyStock";

		} catch (FailSelectOrderStock e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	/*@RequestMapping("sendExampleMsg.com")
	public String sendExampleMsg() {
		String api_key = "NCSA1PQVNBG12DPQ";
		String api_secret = "QMHDIEK4KXNCWF1IFOGFKFTT6OW62YPT";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", "01095902959");
		params.put("from", "01095902959");
		params.put("type", "SMS");
		params.put("text", "Coolsms Testing Message!");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
			return "redirect:selectReceiptList.com";
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
			return "common/errorPage";
		}
	}*/
	
	//영수증 메세지 보내기
	@RequestMapping("sendExampleMsg.com")
	  public String sendSms(HttpServletRequest request) throws Exception {
		String comNo = request.getParameter("comNo");
	    String api_key = "NCSA40TFBGX94XV0";
	    String api_secret = "98M3RJGXL6EKXF2I1SCV1ZJJD9AT546V";
	    Coolsms coolsms = new Coolsms(api_key, api_secret);

	    HashMap<String, String> set = new HashMap<String, String>();
	    set.put("from", "01095902959"); // 수신번호

	    set.put("to", (String)request.getParameter("from")); // 발신번호
	    set.put("text", (String)request.getParameter("text")); // 문자내용
	    set.put("subject", "피자학교"); // 문자내용
	    set.put("type", "lms"); // 문자 타입

	    System.out.println(set);

	    org.json.simple.JSONObject result = coolsms.send(set); // 보내기&전송결과받기

	    if ((boolean)result.get("status") == true) {
	      // 메시지 보내기 성공 및 전송결과 출력
	      System.out.println("성공");
	      System.out.println(result.get("group_id")); // 그룹아이디
	      System.out.println(result.get("result_code")); // 결과코드
	      System.out.println(result.get("result_message")); // 결과 메시지
	      System.out.println(result.get("success_count")); // 메시지아이디
	      System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
	    } else {
	      // 메시지 보내기 실패
	      System.out.println("실패");
	      System.out.println(result.get("code")); // REST API 에러코드
	      System.out.println(result.get("message")); // 에러메시지
	    }

	    return "redirect:selectReceiptList.com?comNo="+comNo;
	  }
	
	
	
	@RequestMapping("sendCustomerDeliveryMsg.com")
	  public String sendCustomerDeliveryMsg(HttpServletRequest request) throws Exception {
		String comNo = request.getParameter("comNo");
		String expectTime = request.getParameter("expectTime");
		String phoneNumber = request.getParameter("phoneNumber");
		String text = "[피자학교]주문하신 음식의 예상 소요시간은  " + expectTime +"분 입니다!";
		
	    String api_key = "NCSA40TFBGX94XV0";
	    String api_secret = "98M3RJGXL6EKXF2I1SCV1ZJJD9AT546V";
	    Coolsms coolsms = new Coolsms(api_key, api_secret);

	    HashMap<String, String> set = new HashMap<String, String>();
	    set.put("from", "01095902959"); // 수신번호
	    set.put("to", phoneNumber); // 발신번호
	    set.put("text", text); // 문자내용
	    set.put("type", "sms"); // 문자 타입

	    System.out.println(set);

	    org.json.simple.JSONObject result = coolsms.send(set); // 보내기&전송결과받기

	    if ((boolean)result.get("status") == true) {
	      // 메시지 보내기 성공 및 전송결과 출력
	      System.out.println("성공");
	      System.out.println(result.get("group_id")); // 그룹아이디
	      System.out.println(result.get("result_code")); // 결과코드
	      System.out.println(result.get("result_message")); // 결과 메시지
	      System.out.println(result.get("success_count")); // 메시지아이디
	      System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
	    } else {
	      // 메시지 보내기 실패
	      System.out.println("실패");
	      System.out.println(result.get("code")); // REST API 에러코드
	      System.out.println(result.get("message")); // 에러메시지
	    }

	    return "redirect:orderWaiting.com?comNo="+comNo;
	  }

	
	
	//업체의 모든 매출목록 가져오기
	@RequestMapping("selectAllCompanySales.com")
	public String selectAllCompanySales(HttpServletRequest request, HttpServletResponse response, String comNo) {
		int IntComNo = Integer.parseInt(comNo);
		ArrayList<CompanySales> list = new ArrayList<CompanySales>();
		try {
			list = cs.selectAllCompanySales(IntComNo);
			request.setAttribute("list", list);
			System.out.println("매출 리스트 : " + list);
			return "company/companySales";
			
			
		} catch (FailSelectCompanySales e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}
	
	//매출목록 리스트 가져오기(텍스트)
	@RequestMapping("selectCompanySalesList.com")
	public String selectCompanySalesList(HttpServletRequest request, HttpServletResponse response, String comNo) {
		int IntComNo = Integer.parseInt(comNo);
		HashMap<String, ArrayList<CompanySalesList>> hmap = new HashMap<String, ArrayList<CompanySalesList>>();
		try {
			hmap = cs.selectCompanySalesList(IntComNo);
			ArrayList<CompanySalesList> inComeList = hmap.get("inComeList");
			ArrayList<CompanySalesList> outComeList = hmap.get("outComeList");
			request.setAttribute("inComeList", inComeList);
			request.setAttribute("outComeList", outComeList);
			System.out.println("inComeList : " + inComeList);
			System.out.println("outComeList : " + outComeList);
			return "company/companySalesList";
			
		} catch (FailSelectCompanySales e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
		
		
	}
	
	//달력 상세보기
	@RequestMapping("calendarDetail.com")
	public String calendarDetail(HttpServletRequest request, HttpServletResponse response, String id, String memberNo) {
		ArrayList<CompanyCalendar> list = new ArrayList<CompanyCalendar>();
		
		int IntMemberNo = Integer.parseInt(memberNo);
		
		System.out.println("id : " + id);
		java.sql.Date date = java.sql.Date.valueOf(id);
		System.out.println("date : " + date);
		
		CompanyCalendar cc = new CompanyCalendar();
		cc.setMemberNo(IntMemberNo);
		cc.setCalendarDate(date);
		try {
			list = cs.calendarDetail(cc);
			
			request.setAttribute("list", list);
			request.setAttribute("date", date);
			return "company/calendarDetail";
			
			
		} catch (FailSelectCalendar e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
	}
	
	//달력에 일정 삽입하기
	@RequestMapping("insertCalendarData.com")
	public String insertCalendarData(String date, String memberNo, String listSize, String text) {
		/*System.out.println("date : " + date);
		System.out.println("memberNo : " + memberNo);
		System.out.println("listSize : " + listSize);
		System.out.println("text : " + text);*/
		
		//DB에 값 집어넣기
		CompanyCalendar cc = new CompanyCalendar();
		cc.setCalendarCateg(Integer.parseInt(listSize));
		cc.setCalendarContent(text);
		cc.setCalendarDate(java.sql.Date.valueOf(date));
		cc.setMemberNo(Integer.parseInt(memberNo));
		try {
			int result = cs.insertCalendarData(cc);
			System.out.println("달력 데이터 삽입 결과 개수 : " + result);
			return "redirect:calendarDetail.com?id="+date + "&memberNo=" + memberNo;
		} catch (FailChangeCalendarDate e) {
			return "common/errorPage";
		}
		
	}
	
	//일정 지우기
	@RequestMapping("deleteCalendarData.com")
	public String deleteCalendarData(String date, String listSize, String calendarNo, String memberNo) {
		
		CompanyCalendar cc = new CompanyCalendar();
		cc.setCalendarCateg(Integer.parseInt(listSize));
		cc.setCalendarDate(java.sql.Date.valueOf(date));
		cc.setCalendarNo(Integer.parseInt(calendarNo));
		try {
			int result = cs.deleteCalendarData(cc);
			
			return "redirect:calendarDetail.com?id="+date + "&memberNo=" + memberNo;
		} catch (FailChangeCalendarDate e) {
			return "common/errorPage";
		}
		
		
	}
	
	//일정 수정하기
	@RequestMapping("reflectModify.com")
	public void reflectModify(HttpServletRequest request, HttpServletResponse response, String date, String calendarNo, String content) {
		System.out.println("date : " + date);
		System.out.println("calendarNo : " + calendarNo);
		System.out.println("content : " + content);
		
		
		CompanyCalendar cc = new CompanyCalendar();
		cc.setCalendarNo(Integer.parseInt(calendarNo));
		cc.setCalendarContent(content);
		cc.setCalendarDate(java.sql.Date.valueOf(date));

		
		try {
			int result = cs.reflectModify(cc);
		} catch (FailChangeCalendarDate e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	
}
