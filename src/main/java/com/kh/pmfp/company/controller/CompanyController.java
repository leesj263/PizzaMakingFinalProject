package com.kh.pmfp.company.controller;


import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.pmfp.company.model.exception.FailInsertEmployeeInfo;
import com.kh.pmfp.company.model.exception.FailInsertOrderStock;
import com.kh.pmfp.company.model.exception.FailSelectAdminMessage;
import com.kh.pmfp.company.model.exception.FailSelectCompanyReview;
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
import com.kh.pmfp.company.model.vo.CompanyEmployee;
import com.kh.pmfp.company.model.vo.CompanyMaterial;
import com.kh.pmfp.company.model.vo.CompanyOrder;
import com.kh.pmfp.company.model.vo.CompanyOrderStock;
import com.kh.pmfp.company.model.vo.CompanyRemainMaterial;


@Controller
public class CompanyController {
	@Autowired
	private CompanyService cs;
	
	/*@RequestMapping("/login.me")
	public String loginCheck(HttpServletRequest request, HttpServletResponse response) {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		System.out.println("userId : " + userId);
		System.out.println("userPwd : " + userPwd);
		
		return "main/main";
	}*/
	
	/*@RequestMapping(value = "/login.me", method=RequestMethod.POST)
	public String loginCheck(@RequestParam("userId")String userId, @RequestParam("userPwd")String userPwd) {
			
		
		System.out.println("userId : " + userId);
		System.out.println("userPwd : " + userPwd);
		
				
		return "main/main";
	}*/
	
	/*@RequestMapping(value = "/login.me", method=RequestMethod.POST)
	public String loginCheck(String userId, String userPwd) {
		
		System.out.println("userId : " + userId);
		System.out.println("userPwd : " + userPwd);
		
		return "main/main";
	}*/
	
	/*@RequestMapping(value = "/login.me", method=RequestMethod.POST)
	public String loginCheck(@ModelAttribute Member m) {
		
		System.out.println("member : " + m);
		
		return "main/main";
	}*/

	@RequestMapping(value = "movePage.com", method=RequestMethod.GET)
	public String moveCompanyPage(String movePage) {
		return "company/"+movePage;
	}
	
	@RequestMapping(value = "movePageToCustomerReview.com", method=RequestMethod.GET)
	public String moveCompanyPage2(String movePage) {
		return "customer/review/"+movePage;
	}
	
	@RequestMapping(value = "goMain.com", method = RequestMethod.GET)
	public String goCompanyMain(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CompanyBoard> adminMessage = new ArrayList<CompanyBoard>();
		
		try {
			adminMessage = cs.selectAdminMessage();
			//System.out.println("adminMessage : " + adminMessage);
			request.setAttribute("adminMessage", adminMessage);
			return "company/companyMain";
			//return "redirect:RedirectGoMain.com";
		} catch (FailSelectAdminMessage e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}
	
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
	
	@RequestMapping("orderWaiting.com")
	public String orderWaiting(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		try {
			list = cs.orderWaiting();
			System.out.println("대기중 리스트 : " + list);
			request.setAttribute("list", list);
			return "company/orderListWaitting";
			
		} catch (FailSelectOrder e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
		
	}
	
	@RequestMapping("orderMaking.com")
	public String orderMaking(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		ArrayList<CompanyEmployee> DeliveryManList = new ArrayList<CompanyEmployee>();
		try {
			list = cs.orderMaking();
			System.out.println("제조중 리스트 : " + list);
			request.setAttribute("list", list);
			
			//CompanyNo를 임시로 2로 부여
			DeliveryManList = cs.remainDeliveryMan(2);
			request.setAttribute("DeliveryManList", DeliveryManList);
			System.out.println("배달원 리스트 : " + DeliveryManList);
			return "company/orderListMaking";
			
		} catch (FailSelectOrder | FailSelectDeliveryMan e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@RequestMapping("orderDelivering.com")
	public String orderDelivering(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		try {
			list = cs.orderDelivering();
			System.out.println("배달중 리스트 : " + list);
			request.setAttribute("list", list);
			return "company/orderListDelivering";
			
		} catch (FailSelectOrder e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@RequestMapping("orderComplete.com")
	public String orderComplete(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		try {
			list = cs.orderComplete();
			System.out.println("배달완료 리스트 : " + list);
			request.setAttribute("list", list);
			return "company/orderListComplete";
			
		} catch (FailSelectOrder e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping("orderRefuseList.com")
	public String orderRefuseList( HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		try {
			list = cs.orderRefuseList();
			System.out.println("거절목록 리스트 : " + list);
			request.setAttribute("list", list);
			return "company/orderListRefuse";
			
		} catch (FailSelectOrder e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	
	
	
	
	//주문을 수락
	@RequestMapping("acceptOrder.com")
	public String acceptOrder(String orderNo) {
		int orderNoInt = Integer.parseInt(orderNo);
		//System.out.println("orderNoInt : " + orderNoInt);
		try {
			int result = cs.acceptOrder(orderNoInt);
			System.out.println("acceptresult : " + result);
			
			
		} catch (FailUpdateOrderStatus e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:orderWaiting.com";
	}
	
	//주문을 거절
	@RequestMapping("refuseOrder.com")
	public String refuseOrder(String orderNo) {
		int orderNoInt = Integer.parseInt(orderNo);
		//System.out.println("orderNoInt : " + orderNoInt);
		try {
			int result = cs.refuseOrder(orderNoInt);
			System.out.println("refuseresult : " + result);
			
			
		} catch (FailUpdateOrderStatus e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:orderWaiting.com";
	}
	
	
/*	@RequestMapping("remainDeliveryMan.com")
	public String remainDeliveryMan(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CompanyEmployee> DeliveryManList = new ArrayList<CompanyEmployee>();
		try {
			DeliveryManList = cs.remainDeliveryMan();
			request.setAttribute("DeliveryManList", DeliveryManList);
			System.out.println("배달원 목록 : " + DeliveryManList);
			return "redirect:orderMaking.com";
			//이 함수 내용들을 orderListMaking에 들어갈때 같이 정보들을 가져오도록 하기
			
		} catch (FailSelectDeliveryMan e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}
	*/
	
	
	@RequestMapping("assignDeliveryMan.com")
	public String assignDeliveryMan(String orderNo, String empNo, HttpServletRequest request, HttpServletResponse response) {
		//배달원 상태변경
		//주문 상태변경 2가지를 수행해야됨
		//System.out.println("orderNo : " + orderNo);
		System.out.println("배달원지정 메소드 들어옴");
		int orderNoInt = Integer.parseInt(orderNo);
		int empNoInt = Integer.parseInt(empNo);
		
		try {
			int deliveryManUpdate = cs.deliveryManUpdateM(orderNoInt, empNoInt);		
			int orderUpdate = cs.orderUpdateM(orderNoInt);
			System.out.println("deliveryManUpdate : " + deliveryManUpdate);
			System.out.println("orderUpdate : " + orderUpdate);
			
			return "redirect:orderMaking.com";
		} catch (FailUpdateDelivery | FailUpdateOrderStatus e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@RequestMapping("deliveryComplete.com")
	public String deliveryComplete(String orderNo ,HttpServletRequest request, HttpServletResponse response) {
		int orderNoInt = Integer.parseInt(orderNo);
		
		try {
			int result = cs.orderUpdateToComplete(orderNoInt);
			return "redirect:orderDelivering.com";
			
		} catch (FailUpdateOrderStatus e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
		
	}
	
	
	@RequestMapping("orderUpdateToDelete.com")
	public String orderUpdateToDelete(String orderNo ,HttpServletRequest request, HttpServletResponse response) {
		
		int orderNoInt = Integer.parseInt(orderNo);
		
		try {
			int result = cs.orderUpdateToDelete(orderNoInt);
			
			return "redirect:orderComplete.com";
			
		} catch (FailUpdateOrderStatus e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@RequestMapping("refuseListDelete.com")
	public String refuseListDelete(String orderNo ,HttpServletRequest request, HttpServletResponse response) {
		
		int orderNoInt = Integer.parseInt(orderNo);
		
		try {
			int result = cs.refuseListDelete(orderNoInt);
			
			return "redirect:orderRefuseList.com";
		} catch (FailUpdateOrderStatus e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@RequestMapping("selectEmployeeList.com")
	public String selectEmployeeList(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CompanyEmployee> list = new ArrayList<CompanyEmployee>();
		try {
			//업체번호를 임시로 2로 부여
			list = cs.selectEmployeeList(2);
			request.setAttribute("list", list);
			return "company/CompanyEmployeeList";
			
		} catch (FailSelectEmployeeList e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping("inputEmployeeInfo.com")
	public void inputEmployeeInfo(HttpServletRequest request, HttpServletResponse response) {
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
			
			CompanyEmployee ce = new CompanyEmployee();
			//나중에 업체번호도 넣어야됨
			ce.setEmployeeRank(inputRank);
			ce.setEmployeeName(inputName);
			ce.setEmployeePhone(inputPhone);
			ce.setEmployeeAddress(inputAddress);
			ce.setEmployeeDate(date);
			
			int result = cs.inputEmployeeInfo(ce);
			
		} catch (FailInsertEmployeeInfo e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	@RequestMapping("deleteEmployeeInfo.com")
	public void deleteEmployeeInfo(HttpServletRequest request, HttpServletResponse response) {
		String[] empNoList = request.getParameterValues("arr");
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		System.out.println("empNoList길이 : " + empNoList.length);
		
		for(int i = 0; i< empNoList.length; i++) {
			list.add(Integer.parseInt(empNoList[i]));
			System.out.println("empNoList["+i+"] : " + empNoList[i]);
		}
		
		try {
			int result = cs.deleteEmployeeInfo(list);
			
			
		} catch (FailUpdateEmployeeInfo e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
	@RequestMapping("selectCompanyReview.com")
	public String selectCompanyReview(HttpServletRequest request, HttpServletResponse response) {
		
		ArrayList<CompanyBoard> list = new ArrayList<CompanyBoard>();
		try {
			//업체번호를 넘겨야됨(임시로 2번)
			list = cs.selectCompanyReview(2);
			request.setAttribute("list", list);
			return "company/companyAnswer";
			
			
		} catch (FailSelectCompanyReview e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
		
		
		
	}
	
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
	
	
	@RequestMapping("applyStock.com")
	public void applyStock(HttpServletRequest request, HttpServletResponse response) {

		String[] arr = request.getParameterValues("arr");
		ArrayList<CompanyOrderStock> list = new ArrayList<CompanyOrderStock>();
		
		
		/*for(int i = 0; i< arr.length; i++) {
			System.out.println("arr[" + i + "] : " + arr[i]);
		}*/
		
		for(int i = 0; i< arr.length; i++) {
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
	
	
	
	
	@RequestMapping("selectOrderStockList.com")
	public String selectOrderStockList(HttpServletRequest request, HttpServletResponse response) {
		
		ArrayList<CompanyOrderStock> list = new ArrayList<CompanyOrderStock>();
		try {
			//회사번호 임의 입력
			list = cs.selectOrderStockList(2);
			request.setAttribute("list", list);
			return "company/orderStockList";
			
		} catch (FailSelectOrderStock e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}
	
	
	
	
	
	
	@RequestMapping("receiptConfirm.com")
	public void receiptConfirm(HttpServletRequest request, HttpServletResponse response) {
		String[] arr = request.getParameterValues("arr");
		ArrayList<Integer> orderMno = new ArrayList<Integer>();
		
		for(int i = 0; i < arr.length ; i++) {
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
	
	
	@RequestMapping("selectReceiptList.com")
	public String selectReceiptList(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<CompanyOrderStock> list = new ArrayList<CompanyOrderStock>();
		//임시로 회사번호 2번으로 넘김, 나중에 로그인 완성시 수정하기
		try {
			list = cs.selectReceiptList(2);
			request.setAttribute("list", list);
			return "company/companyReceipt";
		} catch (FailSelectOrderStock e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	

	
	
	
	@RequestMapping("selectAllMaterialList.com")
	public String selectAllMaterialList(HttpServletRequest request, HttpServletResponse response) {
		//임시로 업체번호를 2번으로 지정, 나중에 로그인 완성시 수정하기
		ArrayList<CompanyRemainMaterial> list = new ArrayList<CompanyRemainMaterial>();
		try {
			list = cs.selectAllMaterialList(2);
			request.setAttribute("list", list);
			System.out.println("조회한 모든 남은재고 list : " + list);
			return "company/companyStock";
			
		} catch (FailSelectOrderStock e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
}
