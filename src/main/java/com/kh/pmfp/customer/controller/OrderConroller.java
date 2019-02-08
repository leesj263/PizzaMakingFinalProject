package com.kh.pmfp.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
			
			model.addAttribute("mateMap", mateMap);
			model.addAttribute("doughList", doughList);
			model.addAttribute("sizeList", sizeList);
			model.addAttribute("sauceList", sauceList);
			model.addAttribute("edgeList", edgeList);
			model.addAttribute("toppingList", toppingList);
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
				if(!basicMenu.contains(menu.getBasicMenu())) basicMenu.add(menu.getBasicMenu());
				
				ArrayList<BasicTopping> toppings = new ArrayList<BasicTopping>();
				for(BasicTopping topping : basicToppingList) {
					if(menu.getBasicNo() == topping.getBasicNo()) toppings.add(topping);
				}
				menu.setBasicTopping(toppings);
			}
			
			model.addAttribute("basicMenu", basicMenu);
			model.addAttribute("basicMenuList", basicMenuList);
			//----------------------------------------------------------------------------------------------
			
			return "customer/order/pizzaMaking";
		} catch (OrderException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
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
