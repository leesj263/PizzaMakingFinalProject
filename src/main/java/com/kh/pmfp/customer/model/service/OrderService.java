package com.kh.pmfp.customer.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.pmfp.common.model.vo.Member;
import com.kh.pmfp.customer.model.exception.OrderException;
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

public interface OrderService {

	ArrayList<MaterialImage> selectMateList() throws OrderException;

	ArrayList<BasicMenu> selectBasicMenuList() throws OrderException;

	ArrayList<BasicTopping> selectBasicToppingList() throws OrderException;

	int insertRecipe(OrderItem oi, ArrayList<OrderTopping> otList, MyPizza mp, Image image) throws OrderException;

	ArrayList<MyPizza> selectMyPizzaList(int memberNo) throws OrderException;

	ArrayList<MaterialImage> selectSideList() throws OrderException;

	ArrayList<DeliveryCompany> selectDeliveryCompanyList(int memberNo) throws OrderException;

	OrderMain selectRecentReceiver(int memberNo) throws OrderException;

	ArrayList<Coupon> selectCouponList(HashMap<String, Integer> condi) throws OrderException;

	int insertUserDelAddr(int memberNo, int finalDeliveryLoc, String addr, String deliName);

	int insertNoUserDelAddr(int deliNo, int memberNo, int finalDeliveryLoc, String addr, String deliName);

	DeliveryCompany selectComTel(int finalDeliveryLoc);

	int selectDeliNo();
}
