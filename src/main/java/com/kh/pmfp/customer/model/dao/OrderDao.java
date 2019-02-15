package com.kh.pmfp.customer.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.customer.model.exception.OrderException;
import com.kh.pmfp.customer.model.vo.BasicMenu;
import com.kh.pmfp.customer.model.vo.BasicTopping;
import com.kh.pmfp.customer.model.vo.Image;
import com.kh.pmfp.customer.model.vo.MaterialImage;
import com.kh.pmfp.customer.model.vo.MyPizza;
import com.kh.pmfp.customer.model.vo.OrderItem;
import com.kh.pmfp.customer.model.vo.OrderTopping;

public interface OrderDao {

	ArrayList<MaterialImage> selectMateList(SqlSessionTemplate sqlSession) throws OrderException;

	ArrayList<BasicMenu> selectBasicMenuList(SqlSessionTemplate sqlSession) throws OrderException;

	ArrayList<BasicTopping> selectBasicToppingList(SqlSessionTemplate sqlSession) throws OrderException;

	int selectOrderIno(SqlSessionTemplate sqlSession) throws OrderException;

	int selectMypizzaNo(SqlSessionTemplate sqlSession) throws OrderException;
	
	int insertRecipe(SqlSessionTemplate sqlSession, OrderItem oi);

	int insertRecipe(SqlSessionTemplate sqlSession, OrderTopping orderTopping);

	int insertRecipe(SqlSessionTemplate sqlSession, MyPizza mp);

	int insertRecipe(SqlSessionTemplate sqlSession, Image image);

	ArrayList<MyPizza> selectMyPizzaList(SqlSessionTemplate sqlSession, int memberNo) throws OrderException;

	ArrayList<MaterialImage> selectSideList(SqlSessionTemplate sqlSession) throws OrderException;

}
