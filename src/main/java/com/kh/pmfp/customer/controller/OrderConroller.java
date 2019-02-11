package com.kh.pmfp.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.pmfp.customer.model.exception.OrderException;
import com.kh.pmfp.customer.model.service.OrderService;
import com.kh.pmfp.customer.model.vo.BasicMenu;
import com.kh.pmfp.customer.model.vo.BasicTopping;
import com.kh.pmfp.customer.model.vo.MaterialImage;

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
			
			return data;
		} catch (OrderException e) {
			return null;
		}
	}
	
	//사이드 메뉴 페이지
	@RequestMapping(value="/sideMenu.cor")
	public String sideMenu() {
		return "customer/order/sideMenu";
	}
	//주문 페이지
	@RequestMapping(value="order.cor")
	public String order() {
		return "customer/order/order";
	}
}
