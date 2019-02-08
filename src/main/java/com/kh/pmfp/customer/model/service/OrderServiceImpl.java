package com.kh.pmfp.customer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pmfp.customer.model.dao.OrderDao;
import com.kh.pmfp.customer.model.exception.OrderException;
import com.kh.pmfp.customer.model.vo.BasicMenu;
import com.kh.pmfp.customer.model.vo.BasicTopping;
import com.kh.pmfp.customer.model.vo.MaterialImage;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private OrderDao od;
	
	//재료 전체 리스트 가져오기
	@Override
	public ArrayList<MaterialImage> selectMateList() throws OrderException {
		return od.selectMateList(sqlSession);
	}

	//기본메뉴 리스트 가져오기
	@Override
	public ArrayList<BasicMenu> selectBasicMenuList() throws OrderException {
		return od.selectBasicMenuList(sqlSession);
	}

	//기본메뉴 토핑 리스트 가져오기
	@Override
	public ArrayList<BasicTopping> selectBasicToppingList() throws OrderException {
		return od.selectBasicToppingList(sqlSession);
	}
}
