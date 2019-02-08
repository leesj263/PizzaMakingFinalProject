package com.kh.pmfp.mypage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.pmfp.common.model.vo.Member;
import com.kh.pmfp.mypage.model.service.MypageService;
import com.kh.pmfp.mypage.model.vo.OrderList;

@Controller
public class MypageController {
	@Autowired
	private MypageService mps;
	
	@RequestMapping(value="/mypage.mp")
	public String mypageMain(Model model, Member m) {
		ArrayList<OrderList> orderList = new ArrayList<>();
		
		orderList = mps.selectOrderList(m);
		System.out.println("orderList : " + orderList);
		
		//주문 토핑 split(도우,소스,크러스트는 수량 없애기)
		String[] arr;
		String arr1 = ""; //도우,소스,크러스트
		String arr2 = ""; //나머지 토핑
		
		ArrayList<String> toppingList = new ArrayList<>();
		
		for(int i=0;i<orderList.size();i++) {
			arr = orderList.get(i).getOrderMaterial().split("/");
			for(int j=0;j<3;j++) {
				arr1 += arr[j].substring(0, arr[j].lastIndexOf("1"))+"/";
			}
			for(int k=3;k<arr.length;k++) {
				if(k == arr.length-1) {
					arr2 += arr[k];
				}else {
					arr2 += arr[k]+"/";					
				}
			}
			toppingList.add(arr1+arr2);
			arr1="";
			arr2="";
		}
		
		
		model.addAttribute("orderList",orderList);
		model.addAttribute("toppingList", toppingList);
		
		
		return "mypage/orderList";
	}
	
	
}
