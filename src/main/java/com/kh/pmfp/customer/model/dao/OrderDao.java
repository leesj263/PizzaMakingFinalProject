package com.kh.pmfp.customer.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.common.model.vo.Member;
import com.kh.pmfp.common.model.vo.PageInfo;
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

public interface OrderDao {

	ArrayList<MaterialImage> selectMateList(SqlSessionTemplate sqlSession) throws OrderException;

	ArrayList<BasicMenu> selectBasicMenuList(SqlSessionTemplate sqlSession) throws OrderException;

	ArrayList<BasicTopping> selectBasicToppingList(SqlSessionTemplate sqlSession) throws OrderException;

	int selectOrderIno(SqlSessionTemplate sqlSession);

	int selectMypizzaNo(SqlSessionTemplate sqlSession) throws OrderException;
	
	int insertRecipe(SqlSessionTemplate sqlSession, OrderItem oi);

	int insertRecipe(SqlSessionTemplate sqlSession, OrderTopping orderTopping);

	int insertRecipe(SqlSessionTemplate sqlSession, MyPizza mp);

	int insertRecipe(SqlSessionTemplate sqlSession, Image image);

	ArrayList<MyPizza> selectMyPizzaList(SqlSessionTemplate sqlSession, int memberNo) throws OrderException;

	ArrayList<MaterialImage> selectSideList(SqlSessionTemplate sqlSession) throws OrderException;

	ArrayList<DeliveryCompany> selectDeliveryCompanyList(SqlSessionTemplate sqlSession, int memberNo) throws OrderException;

	OrderMain selectRecentReceiver(SqlSessionTemplate sqlSession, int memberNo) throws OrderException;

	ArrayList<Coupon> selectCouponList(SqlSessionTemplate sqlSession, HashMap<String, Integer> condi) throws OrderException;

	int insertUserDelAddr(SqlSessionTemplate sqlSession, int memberNo, int finalDeliveryLoc, String addr,
			String deliName);

	int insertNoUserDelAddr(SqlSessionTemplate sqlSession, int deliNo, int memberNo, int finalDeliveryLoc, String addr,
			String deliName);

	DeliveryCompany selectComTel(SqlSessionTemplate sqlSession, int finalDeliveryLoc);

	int selectDeliNo(SqlSessionTemplate sqlSession);

	int getSearchResultListCount(SqlSessionTemplate sqlSession, String search);

	ArrayList<DeliveryCompany> selectSearchResultList(SqlSessionTemplate sqlSession, String search, PageInfo pi) throws OrderException;

	DeliveryCompany getComDetail(SqlSessionTemplate sqlSession, String comNo);

	String selectOrderNo(SqlSessionTemplate sqlSession);

	int insertOrderMain(SqlSessionTemplate sqlSession, OrderMain om);

	int insertOrderItem(SqlSessionTemplate sqlSession, OrderItem orderItem);

	int insertOrderTopping(SqlSessionTemplate sqlSession, OrderTopping orderTopping);

}
