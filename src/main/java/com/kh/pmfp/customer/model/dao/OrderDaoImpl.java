package com.kh.pmfp.customer.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pmfp.customer.model.exception.OrderException;
import com.kh.pmfp.customer.model.vo.BasicMenu;
import com.kh.pmfp.customer.model.vo.BasicTopping;
import com.kh.pmfp.customer.model.vo.MaterialImage;

@Repository
public class OrderDaoImpl implements OrderDao {

	//재료 전체 리스트 가져오기
	@Override
	public ArrayList<MaterialImage> selectMateList(SqlSessionTemplate sqlSession) throws OrderException {
		ArrayList<MaterialImage> mateList = (ArrayList)sqlSession.selectList("CustomerOrder.selectMateList");
		if(mateList == null) throw new OrderException("재료 목록이 없습니다.");
		return mateList;
	}

	//기본 메뉴 리스트 가져오기
	@Override
	public ArrayList<BasicMenu> selectBasicMenuList(SqlSessionTemplate sqlSession) throws OrderException {
		ArrayList<BasicMenu> basicMenuList = (ArrayList)sqlSession.selectList("CustomerOrder.selectBasicMenuList");
		if(basicMenuList == null) throw new OrderException("기본메뉴 목록이 없습니다.");
		return basicMenuList;
	}

	//기본메뉴 토핑 리스트 가져오기
	@Override
	public ArrayList<BasicTopping> selectBasicToppingList(SqlSessionTemplate sqlSession) throws OrderException {
		ArrayList<BasicTopping> basicToppingList = (ArrayList)sqlSession.selectList("CustomerOrder.selectBasicToppingList");
		if(basicToppingList == null) throw new OrderException("기본메뉴 토핑 목록이 없습니다.");
		return basicToppingList;
	}

}
