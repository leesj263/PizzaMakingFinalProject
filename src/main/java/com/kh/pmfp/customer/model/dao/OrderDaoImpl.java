package com.kh.pmfp.customer.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository
public class OrderDaoImpl implements OrderDao {

	//재료 전체 리스트 가져오기
	@Override
	public ArrayList<MaterialImage> selectMateList(SqlSessionTemplate sqlSession) throws OrderException {
		ArrayList<MaterialImage> mateList = (ArrayList)sqlSession.selectList("CustomerOrder.selectMateList");
		if(mateList == null) throw new OrderException("재료 목록 가져오기 오류 발생!");
		return mateList;
	}

	//기본 메뉴 리스트 가져오기
	@Override
	public ArrayList<BasicMenu> selectBasicMenuList(SqlSessionTemplate sqlSession) throws OrderException {
		ArrayList<BasicMenu> basicMenuList = (ArrayList)sqlSession.selectList("CustomerOrder.selectBasicMenuList");
		if(basicMenuList == null) throw new OrderException("기본메뉴 목록 가져오기 오류 발생!");
		return basicMenuList;
	}

	//기본메뉴 토핑 리스트 가져오기
	@Override
	public ArrayList<BasicTopping> selectBasicToppingList(SqlSessionTemplate sqlSession) throws OrderException {
		ArrayList<BasicTopping> basicToppingList = (ArrayList)sqlSession.selectList("CustomerOrder.selectBasicToppingList");
		if(basicToppingList == null) throw new OrderException("기본메뉴 토핑 목록 가져오기 오류 발생!");
		return basicToppingList;
	}

	//주문항목 pk 가져오기
	@Override
	public int selectOrderIno(SqlSessionTemplate sqlSession) throws OrderException {
		int orderIno = sqlSession.selectOne("CustomerOrder.selectOrderIno");
		if(orderIno == 0) throw new OrderException("ORDER_INO을 가져올 수 없습니다.");
		return orderIno;
	}

	//내 피자 pk 가져오기
	@Override
	public int selectMypizzaNo(SqlSessionTemplate sqlSession) throws OrderException {
		int mypizzaNo = sqlSession.selectOne("CustomerOrder.selectMypizzaNo");
		if(mypizzaNo == 0) throw new OrderException("MYPIZZA_NO을 가져올 수 없습니다.");
		return mypizzaNo;
	}

	//레시피 INSERT
	@Override
	public int insertRecipe(SqlSessionTemplate sqlSession, OrderItem oi) {
		return sqlSession.insert("CustomerOrder.insertRecipeOrderItem", oi);
	}
	@Override
	public int insertRecipe(SqlSessionTemplate sqlSession, OrderTopping orderTopping) {
		return sqlSession.insert("CustomerOrder.insertRecipeOrderTopping", orderTopping);
	}
	@Override
	public int insertRecipe(SqlSessionTemplate sqlSession, MyPizza mp) {
		return sqlSession.insert("CustomerOrder.insertRecipeMyPizza", mp);
	}
	@Override
	public int insertRecipe(SqlSessionTemplate sqlSession, Image image) {
		return sqlSession.insert("CustomerOrder.insertRecipeImage", image);
	}

	//내 레시피 가져오기
	@Override
	public ArrayList<MyPizza> selectMyPizzaList(SqlSessionTemplate sqlSession, int memberNo) throws OrderException {
		ArrayList<MyPizza> mpList = (ArrayList)sqlSession.selectList("CustomerOrder.selectMyPizzaList", memberNo);
		if(mpList == null) throw new OrderException("레시피 가져오기 오류 발생!");
		return mpList;
	}

	//사이드 메뉴 가져오기
	@Override
	public ArrayList<MaterialImage> selectSideList(SqlSessionTemplate sqlSession) throws OrderException {
		ArrayList<MaterialImage> sideList = (ArrayList)sqlSession.selectList("CustomerOrder.selectSideList");
		if(sideList == null) throw new OrderException("사이드 메뉴 목록 가져오기 오류 발생!");
		return sideList;
	}

	//배송지 정보 가져오기
	@Override
	public ArrayList<DeliveryCompany> selectDeliveryCompanyList(SqlSessionTemplate sqlSession, int memberNo) throws OrderException {
		ArrayList<DeliveryCompany> dcList = (ArrayList)sqlSession.selectList("CustomerOrder.selectDeliveryCompanyList", memberNo);
		if(dcList == null) throw new OrderException("배송지 정보 목록 가져오기 오류 발생!");
		return dcList;
	}

	//최근 수령자 정보 가져오기
	@Override
	public OrderMain selectRecentReceiver(SqlSessionTemplate sqlSession, int memberNo) throws OrderException {
		OrderMain receiver = sqlSession.selectOne("CustomerOrder.selectRecentReceiver", memberNo);
		if(receiver == null) throw new OrderException("최근 수령자 정보 가져오기 오류 발생!");
		return receiver;
	}

	@Override
	public ArrayList<Coupon> selectCouponList(SqlSessionTemplate sqlSession, HashMap<String, Integer> condi) throws OrderException {
		ArrayList<Coupon> cpList = (ArrayList)sqlSession.selectList("CustomerOrder.selectCouponList", condi);
		if(cpList == null) throw new OrderException("쿠폰 목록 가져오기 오류 발생!");
		return cpList;
	}


}
