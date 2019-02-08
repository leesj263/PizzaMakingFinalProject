package com.kh.pmfp.customer.model.service;

import java.util.ArrayList;

import com.kh.pmfp.customer.model.exception.OrderException;
import com.kh.pmfp.customer.model.vo.BasicMenu;
import com.kh.pmfp.customer.model.vo.BasicTopping;
import com.kh.pmfp.customer.model.vo.MaterialImage;

public interface OrderService {

	ArrayList<MaterialImage> selectMateList() throws OrderException;

	ArrayList<BasicMenu> selectBasicMenuList() throws OrderException;

	ArrayList<BasicTopping> selectBasicToppingList() throws OrderException;

}
