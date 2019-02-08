package com.kh.pmfp.customer.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.customer.model.exception.OrderException;
import com.kh.pmfp.customer.model.vo.BasicMenu;
import com.kh.pmfp.customer.model.vo.BasicTopping;
import com.kh.pmfp.customer.model.vo.MaterialImage;

public interface OrderDao {

	ArrayList<MaterialImage> selectMateList(SqlSessionTemplate sqlSession) throws OrderException;

	ArrayList<BasicMenu> selectBasicMenuList(SqlSessionTemplate sqlSession) throws OrderException;

	ArrayList<BasicTopping> selectBasicToppingList(SqlSessionTemplate sqlSession) throws OrderException;

}
