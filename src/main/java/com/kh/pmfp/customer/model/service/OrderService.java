package com.kh.pmfp.customer.model.service;

import java.util.ArrayList;

import com.kh.pmfp.customer.model.exception.OrderException;
import com.kh.pmfp.customer.model.vo.BasicMenu;
import com.kh.pmfp.customer.model.vo.BasicTopping;
import com.kh.pmfp.customer.model.vo.Image;
import com.kh.pmfp.customer.model.vo.MaterialImage;
import com.kh.pmfp.customer.model.vo.MyPizza;
import com.kh.pmfp.customer.model.vo.OrderItem;
import com.kh.pmfp.customer.model.vo.OrderTopping;

public interface OrderService {

	ArrayList<MaterialImage> selectMateList() throws OrderException;

	ArrayList<BasicMenu> selectBasicMenuList() throws OrderException;

	ArrayList<BasicTopping> selectBasicToppingList() throws OrderException;

	int insertRecipe(OrderItem oi, ArrayList<OrderTopping> otList, MyPizza mp, Image image) throws OrderException;

	ArrayList<MyPizza> selectMyPizzaList(int memberNo) throws OrderException;

	ArrayList<MaterialImage> selectSideList() throws OrderException;

}
