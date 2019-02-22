package com.kh.pmfp.customer.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.pmfp.common.model.vo.Member;
import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.common.model.vo.Pagination3;
import com.kh.pmfp.customer.model.exception.OrderException;
import com.kh.pmfp.customer.model.service.OrderService;
import com.kh.pmfp.customer.model.vo.BasicMenu;
import com.kh.pmfp.customer.model.vo.BasicTopping;
import com.kh.pmfp.customer.model.vo.Coupon;
import com.kh.pmfp.customer.model.vo.DeliveryCompany;
import com.kh.pmfp.customer.model.vo.Image;
import com.kh.pmfp.customer.model.vo.MaterialImage;
import com.kh.pmfp.customer.model.vo.MyPizza;
import com.kh.pmfp.customer.model.vo.OrderItem;
import com.kh.pmfp.customer.model.vo.OrderMain;
import com.kh.pmfp.customer.model.vo.OrderTopping;

@Controller
public class OrderConroller {
	@Autowired
	private OrderService os;
	
	//피자 만들기 페이지
	@RequestMapping(value="/pizzaMaking.cor")
	public String pizzaMaking(HttpServletRequest request, Model model) {
		return "customer/order/pizzaMaking";
	}
	
	//피자 만들기 정보 가져오기
	@RequestMapping(value="/pizzaMakingData.cor")
	public @ResponseBody HashMap<String, Object> pizzaMakingData(HttpServletRequest request) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		try {
			//재료 메뉴----------------------------------------------------------------------------------------------
			//재료+이미지 가져오기
			ArrayList<MaterialImage> mateList = os.selectMateList();
			
			//for(MaterialImage mate : mateList) System.out.println(mate);
			
			//메뉴 리스트 작성
			HashMap<Integer, MaterialImage> mateMap = new HashMap<Integer, MaterialImage>();
			ArrayList<String> doughList = new ArrayList<String>();
			ArrayList<String> sizeList = new ArrayList<String>();
			ArrayList<String> sauceList = new ArrayList<String>();
			ArrayList<String> edgeList = new ArrayList<String>();
			ArrayList<MaterialImage> toppingList = new ArrayList<MaterialImage>();
			
			sizeList.add("M");
			sizeList.add("L");
			for(MaterialImage mate : mateList) {
				mateMap.put(mate.getMaterialNo(), mate);
				
				if(mate.getMaterialCateg() == 1
						&& !doughList.contains(mate.getMaterialName())) {
					doughList.add(mate.getMaterialName());
				} else if(mate.getMaterialCateg() == 2
						&& !sauceList.contains(mate.getMaterialName())) {
					sauceList.add(mate.getMaterialName());
				} else if(mate.getMaterialCateg() == 3
						&& !edgeList.contains(mate.getMaterialName())) {
					edgeList.add(mate.getMaterialName());
				} else if(mate.getMaterialCateg() == 4) {
					toppingList.add(mate);
				}
			}
			
			/*System.out.println(mateMap);
			System.out.println(doughList);
			System.out.println(sizeList);
			System.out.println(sauceList);
			System.out.println(edgeList);
			System.out.println(toppingList);*/
			data.put("mateMap", mateMap);
			data.put("doughList", doughList);
			data.put("sizeList", sizeList);
			data.put("sauceList", sauceList);
			data.put("edgeList", edgeList);
			data.put("toppingList", toppingList);
			//----------------------------------------------------------------------------------------------
			
			//기본메뉴----------------------------------------------------------------------------------------------
			//기본메뉴, 기본메뉴 토핑 가져오기
			ArrayList<BasicMenu> basicMenuList = os.selectBasicMenuList();
			ArrayList<BasicTopping> basicToppingList = os.selectBasicToppingList();
			
			//for(BasicMenu menu : basicMenuList) System.out.println(basicMenu);
			//for(BasicTopping topping : basicToppingList) System.out.println(basicTopping);
			
			//기본메뉴 리스트 작성
			ArrayList<String> basicMenu = new ArrayList<String>();
			for(BasicMenu menu : basicMenuList) {
				if(!basicMenu.contains(menu.getBasicMenu())) {
					basicMenu.add(menu.getBasicMenu());
				}
				
				ArrayList<BasicTopping> toppings = new ArrayList<BasicTopping>();
				for(BasicTopping topping : basicToppingList) {
					if(menu.getBasicNo() == topping.getBasicNo()) {
						toppings.add(topping);
					}
				}
				menu.setBasicTopping(toppings);
			}
			
			/*for(String asd : basicMenu) System.out.println(asd);
			for(BasicMenu asd : basicMenuList) System.out.println(asd);*/
			data.put("basicMenu", basicMenu);
			data.put("basicMenuList", basicMenuList);
			//----------------------------------------------------------------------------------------------
			
			//내 레시피 ----------------------------------------------------------------------------------------------
			if(request.getSession().getAttribute("loginUser") != null) {
				int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
				ArrayList<MyPizza> mpList = os.selectMyPizzaList(memberNo);
				
				HashMap<Integer, ArrayList<MyPizza>> mpMap = new HashMap<Integer, ArrayList<MyPizza>>();
				for(int i=0; i<mpList.size(); i++) {
					mpMap.put(mpList.get(i).getMypizzaNo(), null);
				}
				for(Integer key : mpMap.keySet()) {
					ArrayList<MyPizza> mps = new ArrayList<MyPizza>();
					for(int i=0; i<mpList.size(); i++) {
						if(mpList.get(i).getMypizzaNo() == key) {
							mps.add(mpList.get(i));
						}
					}
					mpMap.put(key, mps);
				}
				
				//System.out.println(mpMap);
				data.put("mpMap", mpMap);
			}
			
			//----------------------------------------------------------------------------------------------
			return data;
		} catch (OrderException e) {
			return null;
		}
	}
	
	//이미지 파일 생성
	@RequestMapping(value="/pizzaMakingImgUpload.cor")
	public @ResponseBody String pizzaMakingImgUpload(HttpServletRequest request,
			@RequestParam String img) {
		
		//이미지 파일 생성
		String base64Image = img.split(",")[1];
		byte[] imageBytes = javax.xml.bind.DatatypeConverter.parseBase64Binary(base64Image);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\customer\\images\\myPizza";
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String randomNum = String.format("%07d",(int)(Math.random() * 1000000));
		String fileName = ft.format(new java.util.Date(currentTime)) + randomNum + ".png";
		
		File file = new File(filePath, fileName);
		BufferedOutputStream bos = null;
		try {
			bos = new BufferedOutputStream(new FileOutputStream(file));
			
			bos.write(imageBytes);
			bos.flush();
		} catch (IOException e) {
			e.printStackTrace();
			if(file.exists()) file.delete();
			return "fileError";
		} finally {
			try {
				if(bos != null) bos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return "complete";
	}
	
	//레시피 저장
	@RequestMapping(value="/saveRecipe.cor")
	public @ResponseBody HashMap<Integer, ArrayList<MyPizza>> saveRecipe(HttpServletRequest request,
			@RequestParam(value="pizzaName", required=false) String pizzaName,
			@RequestParam(value="dough", required=false) String dough,
			@RequestParam(value="size", required=false) String size,
			@RequestParam(value="edge", required=false) String edge,
			@RequestParam(value="sauce", required=false) String sauce,
			@RequestParam(value="toppings[]", required=false) List<String> toppings,
			@RequestParam(value="img", required=false) String img) {
		/*System.out.println(pizzaName);
		System.out.println(dough);
		System.out.println(size);
		System.out.println(edge);
		System.out.println(sauce);
		System.out.println(toppings);
		System.out.println(img);*/
		//비로그인 시
		if(request.getSession().getAttribute("loginUser") == null) return null;
		
		//객체 생성
		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		OrderItem oi = new OrderItem();
		oi.setOrderIsize(size);
		
		ArrayList<OrderTopping> otList = new ArrayList<OrderTopping>();
		otList.add(new OrderTopping(Integer.parseInt(dough), 1));
		otList.add(new OrderTopping(Integer.parseInt(edge), 1));
		otList.add(new OrderTopping(Integer.parseInt(sauce), 1));
		
		for(int i=0; i<toppings.size(); i++){
			String[] tmp = toppings.get(i).split(":");
			
			OrderTopping ot = new OrderTopping();
			ot.setMaterialNo(Integer.parseInt(tmp[0]));
			ot.setOrderTcount(Integer.parseInt(tmp[1]));
			
			otList.add(ot);
		}
		
		MyPizza mp = new MyPizza();
		mp.setMemberNo(memberNo);
		mp.setMypizzaName(pizzaName);
		
		//이미지 파일 생성
		String base64Image = img.split(",")[1];
		byte[] imageBytes = javax.xml.bind.DatatypeConverter.parseBase64Binary(base64Image);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\customer\\images\\myPizza";
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String randomNum = String.format("%07d",(int)(Math.random() * 1000000));
		String fileName = ft.format(new java.util.Date(currentTime)) + randomNum + ".png";
		
		File file = new File(filePath, fileName);
		BufferedOutputStream bos = null;
		try {
			bos = new BufferedOutputStream(new FileOutputStream(file));
			
			bos.write(imageBytes);
			bos.flush();
		} catch (IOException e) {
			e.printStackTrace();
			if(file.exists()) file.delete();
		} finally {
			try {
				if(bos != null) bos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		Image image = new Image();
		image.setImgFilepath(filePath);
		image.setImgOriginname(pizzaName + ".png");
		image.setImgChangename(fileName);
		
		//INSERT
		try {
			int result = os.insertRecipe(oi, otList, mp, image);
			
			if(result > 0) {
				ArrayList<MyPizza> mpList = os.selectMyPizzaList(memberNo);
				
				HashMap<Integer, ArrayList<MyPizza>> mpMap = new HashMap<Integer, ArrayList<MyPizza>>();
				for(int i=0; i<mpList.size(); i++) {
					mpMap.put(mpList.get(i).getMypizzaNo(), null);
				}
				for(Integer key : mpMap.keySet()) {
					ArrayList<MyPizza> mps = new ArrayList<MyPizza>();
					for(int i=0; i<mpList.size(); i++) {
						if(mpList.get(i).getMypizzaNo() == key) {
							mps.add(mpList.get(i));
						}
					}
					mpMap.put(key, mps);
				}
				return mpMap;
			} else {
				if(file.exists()) file.delete();
				return null;
			}
		} catch (OrderException e) {
			if(file.exists()) file.delete();
			return null;
		}
	}
	
	//사이드 메뉴 페이지
	@RequestMapping(value="/sideMenu.cor")
	public String sideMenu(Model model) {
		try {
			ArrayList<MaterialImage> sideList = os.selectSideList();
			//System.out.println(sideList);
			
			model.addAttribute("sideList", sideList);
			
		} catch (OrderException e) {
			e.printStackTrace();
		}
		
		return "customer/order/sideMenu";
	}
	
	//사이드 메뉴 장바구니 불러오기
	@RequestMapping(value="/mateList.cor")
	public @ResponseBody HashMap<Integer, MaterialImage> mateList() {
		try {
			ArrayList<MaterialImage> mateList = os.selectMateList();
			
			//메뉴 리스트 작성
			HashMap<Integer, MaterialImage> mateMap = new HashMap<Integer, MaterialImage>();
			
			for(MaterialImage mate : mateList) {
				mateMap.put(mate.getMaterialNo(), mate);
			}
			
			return mateMap;
			
		} catch (OrderException e) {
			e.printStackTrace();
			
			return null;
		}
	}
	
	//주문 페이지
	@RequestMapping(value="/order.cor")
	public String order(HttpServletRequest request) {
		if(request.getSession().getAttribute("loginUser") != null) {
			int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
			//System.out.println(memberNo);
			try {
				OrderMain receiver = os.selectRecentReceiver(memberNo);
				//System.out.println(receiver);
				request.setAttribute("receiver", receiver);
				return "customer/order/order";
			} catch (OrderException e) {
				return "customer/order/order";
			}
		} else {
			return "customer/order/order";
		}
		
	}
	
	//배송지 정보 가져오기
	@RequestMapping(value="/getDeliveryInfo.cor")
	public @ResponseBody ArrayList<DeliveryCompany> getDeliveryInfo(HttpServletRequest request) {
		if(request.getSession().getAttribute("loginUser") != null) {
			int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
			
			try {
				ArrayList<DeliveryCompany> dcList = os.selectDeliveryCompanyList(memberNo);
				
				//System.out.println(dcList);
				return dcList;
			} catch (OrderException e) {
				
				e.printStackTrace();
				return null;
			}
		} else {
			return null;
		}
		
	}
	
	//쿠폰 목록 가져오기
	@RequestMapping(value="/getCouponList.cor")
	public @ResponseBody ArrayList<Coupon> getCouponList(HttpServletRequest request, @RequestParam(value="totalPrice", required=false) String totalPrice) {
		if(request.getSession().getAttribute("loginUser") != null) {
			int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
			HashMap<String, Integer> condi = new HashMap<String, Integer>();
			condi.put("memberNo", memberNo);
			condi.put("totalPrice", Integer.parseInt(totalPrice));
			try {
				ArrayList<Coupon> cpList = os.selectCouponList(condi);
				//System.out.println(cpList);
				return cpList;
			} catch (OrderException e) {
				e.printStackTrace();
				return new ArrayList<Coupon>();
			}
		} else {
			return new ArrayList<Coupon>();
		}
	}
	
	//배송지 추가 팝업
	@RequestMapping(value="/myPageDelPopup.cor")
	public String delPopup() {
		return "customer/order/deliveryPopup";
	}
	
	//배송지 추가
	@RequestMapping(value="/deliveryAdd.cor")
	public @ResponseBody String deliveryAdd(HttpServletRequest request, String finalDeliveryLoc, String addr, String deliName ,Model model) {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		//System.out.println(finalDeliveryLoc+":"+addr+":"+deliName);
		
		int result = os.insertUserDelAddr(memberNo, Integer.parseInt(finalDeliveryLoc), addr, deliName);
		
		if(result>0) {
			
			return "성공";
		}else {
			//model.addAttribute("msg", "배송지 추가 실패");
			//return "common/errorPage";
			return null;
		}
	}
	
	//비회원 배송지 추가
	@RequestMapping(value="/deliveryAddNoUser.cor")
	public @ResponseBody DeliveryCompany deliveryAddNoUser(HttpServletRequest request, String finalDeliveryLocStr, String addr, String deliName ,Model model) {
		/*HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();*/
		int finalDeliveryLoc = Integer.parseInt(finalDeliveryLocStr);
		System.out.println(finalDeliveryLoc+":"+addr+":"+deliName);
		
		int deliNo = os.selectDeliNo();
		int result = os.insertNoUserDelAddr(deliNo, 0, finalDeliveryLoc, addr, deliName);
		DeliveryCompany data = os.selectComTel(finalDeliveryLoc);
		data.setDeliveryAddress(addr);
		data.setDeliveryNo(deliNo);
		
		if(result>0) {
			
			return data;
		}else {
			//model.addAttribute("msg", "배송지 추가 실패");
			//return "common/errorPage";
			return null;
		}
	}
	
	//매장 선택 팝업
	@RequestMapping(value="/comPop.cor")
	public String comPop(Model model, @RequestParam(required=false) String currentPage, @RequestParam(required=false) String search) {
		int currPage = 1;
		if(currentPage != null) currPage = Integer.parseInt(currentPage);
		if(search == null) search = "";
		
		int listCount = os.getSearchResultListCount(search);
		
		PageInfo pi = Pagination3.getPageInfo(currPage, listCount);
		try {
			ArrayList<DeliveryCompany> list = os.selectSearchResultList(search, pi);
			
			//System.out.println(list);
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("search", search);
			
			return "customer/order/companyPopup";
		} catch (OrderException e) {
			e.printStackTrace();
			
			return "customer/order/companyPopup";
		}
	}
	
	//업체 상세 정보
	@RequestMapping(value="/comDetail.cor")
	public @ResponseBody DeliveryCompany getComDetail(@RequestParam String comNo) {
		return os.getComDetail(comNo);
	}
	
	//주문번호 가져오기
	@RequestMapping(value="/selectOrderNo.cor")
	public @ResponseBody String selectOrderNo(HttpServletRequest request) throws OrderException {
		if(request.getSession().getAttribute("loginUser") == null && request.getSession().getAttribute("noUserLogin") == null) {
			return "fail";
		}
		return os.selectOrderNo();
	}
	
	//주문하기
	@RequestMapping(value="/insertOrder.cor")
	public @ResponseBody String insertOrder(HttpServletRequest request, @RequestBody HashMap<String, Object> jsonData) {
		//System.out.println(jsonData);
		OrderMain om = new OrderMain();
		Coupon cp = new Coupon();
		ArrayList<OrderItem> oiList = new ArrayList<OrderItem>();
		
		if(request.getSession().getAttribute("loginUser") != null) {
			om.setMemberNo(((Member)request.getSession().getAttribute("loginUser")).getMemberNo());
		} else if(request.getSession().getAttribute("noUserLogin") != null) {
			om.setMemberNo(0);
		}
		
		for(String key: jsonData.keySet()) {
			if(key.equals("orderItem")) {
				ArrayList list = (ArrayList)jsonData.get(key);
				
				for(int i=0; i<list.size(); i++) {
					//System.out.println("orderItem: " + list.get(i));
					HashMap<String, Object> hmap = (HashMap<String, Object>)list.get(i);
					OrderItem oi = new OrderItem();
					oi.setOrderIcateg(Integer.parseInt((String)hmap.get("orderIcateg")));
					if((String)hmap.get("orderIsize") != "") oi.setOrderIsize((String)hmap.get("orderIsize"));
					oi.setOrderTcount(Integer.parseInt((String)hmap.get("orderTcount")));
					
					ArrayList<OrderTopping> otList = new ArrayList<OrderTopping>();
					ArrayList<HashMap<String, String>> tpList = (ArrayList)hmap.get("orderTopping");
					for(int j=0; j<tpList.size(); j++) {
						OrderTopping ot = new OrderTopping();
						HashMap<String, String> tpHmap = (HashMap<String, String>)tpList.get(j);
						ot.setMaterialNo(Integer.parseInt(tpHmap.get("materialNo")));
						ot.setOrderTcount(Integer.parseInt(tpHmap.get("orderTcount")));
						otList.add(ot);
					}
					oi.setOrderTopping(otList);
					oiList.add(oi);
				}
			} else {
				//System.out.println(key + ": "+ jsonData.get(key));
				if(key.equals("orderMethod")) {
					om.setOrderMethod(Integer.parseInt((String)jsonData.get(key)));
				} else if(key.equals("orderReceiver")) {
					om.setOrderReceiver((String)jsonData.get(key));
				} else if(key.equals("orderRtel")) {
					om.setOrderRtel((String)jsonData.get(key));
				} else if(key.equals("orderReservetime")) {
					if((String)jsonData.get(key) != "") {
						String reserve = (String)jsonData.get(key);
						Calendar time = Calendar.getInstance();
						time.set(Calendar.HOUR_OF_DAY, Integer.parseInt(reserve.split(":")[0]));
						time.set(Calendar.MINUTE, Integer.parseInt(reserve.split(":")[1]));
						time.set(Calendar.SECOND, 0);
						om.setOrderReservetime(new java.sql.Date(time.getTimeInMillis()));
						//System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(om.getOrderReservetime()));
					}
				} else if(key.equals("orderPayprice")) {
					om.setOrderPayprice(Integer.parseInt((String)jsonData.get(key)));
				} else if(key.equals("deliveryNo")) {
					if((String)jsonData.get(key) != "") om.setDeliveryNo(Integer.parseInt((String)jsonData.get(key)));
				} else if(key.equals("comNo")) {
					om.setComNo(Integer.parseInt((String)jsonData.get(key)));
				} else if(key.equals("issueNo")) {
					if((String)jsonData.get(key) != "") cp.setIssueNo(Integer.parseInt((String)jsonData.get(key)));
				} else if(key.equals("orderNo")) {
					om.setOrderNo(Integer.parseInt((String)jsonData.get(key)));
				} else if(key.equals("orderPayno")) {
					om.setOrderPayno((String)jsonData.get(key));
				}
			}
		}
		
		for(int i=0; i<oiList.size(); i++) {
			oiList.get(i).setOrderNo(om.getOrderNo());
		}
		cp.setOrderNo(om.getOrderNo());
		
		/*System.out.println("OrderMain: " + om);
		System.out.println("Coupon: " + cp);
		System.out.println("OrderItemList: " + oiList);*/
		
		int result = os.insertOrder(om, cp, oiList);
		
		//System.out.println(result);
		
		if(result < 1) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	//주문완료 페이지
	@RequestMapping(value="orderComplete.cor")
	public String orderComplete() {
		return "customer/order/orderComplete";
	}
}
