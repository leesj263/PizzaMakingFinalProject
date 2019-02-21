package com.kh.pmfp.customer.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.customer.model.dao.OrderDao;
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

	//레시피 저장
	@Override
	public int insertRecipe(OrderItem oi, ArrayList<OrderTopping> otList, MyPizza mp, Image image) throws OrderException {
		int result = 0;
		
		//ORDER_INO, MYPIZZA_NO setting
		int orderIno = od.selectOrderIno(sqlSession);
		int mypizzaNo = od.selectMypizzaNo(sqlSession);
		oi.setOrderIno(orderIno);
		for(int i=0; i<otList.size(); i++) otList.get(i).setOrderIno(orderIno);
		mp.setOrderIno(orderIno);
		mp.setMypizzaNo(mypizzaNo);
		image.setMypizzaNo(mypizzaNo);
		
		//INSERT
		int result1 = od.insertRecipe(sqlSession, oi);
		int result2 = 0;
		for(int i=0; i<otList.size(); i++) result2 += od.insertRecipe(sqlSession, otList.get(i));
		int result3 = od.insertRecipe(sqlSession, mp);
		int result4 = od.insertRecipe(sqlSession, image);
		
		if(result1 == 1 && result2 == otList.size() && result3 == 1 && result4 == 1) result = 1;
		
		return result;
	}
	
	//내 레시피 가져오기
	@Override
	public ArrayList<MyPizza> selectMyPizzaList(int memberNo) throws OrderException {
		return od.selectMyPizzaList(sqlSession, memberNo);
	}

	//사이드 메뉴 가져오기
	@Override
	public ArrayList<MaterialImage> selectSideList() throws OrderException {
		return od.selectSideList(sqlSession);
	}

	//배송지 정보 가져오기
	@Override
	public ArrayList<DeliveryCompany> selectDeliveryCompanyList(int memberNo) throws OrderException {
		return od.selectDeliveryCompanyList(sqlSession, memberNo);
	}

	//최근 수령자 정보 가져오기
	@Override
	public OrderMain selectRecentReceiver(int memberNo) throws OrderException {
		return od.selectRecentReceiver(sqlSession, memberNo);
	}

	//쿠폰 목록 가져오기
	@Override
	public ArrayList<Coupon> selectCouponList(HashMap<String, Integer> condi) throws OrderException {
		return od.selectCouponList(sqlSession, condi);
	}

	//배송지 추가
	@Override
	public int insertUserDelAddr(int memberNo, int finalDeliveryLoc, String addr, String deliName) {
		return od.insertUserDelAddr(sqlSession, memberNo, finalDeliveryLoc, addr, deliName);
	}

	//비회원 배송지 추가
	@Override
	public int insertNoUserDelAddr(int deliNo, int memberNo, int finalDeliveryLoc, String addr, String deliName) {
		return od.insertNoUserDelAddr(sqlSession, deliNo, memberNo, finalDeliveryLoc, addr, deliName);
	}

	//업체 정보 가져오기
	@Override
	public DeliveryCompany selectComTel(int finalDeliveryLoc) {
		return od.selectComTel(sqlSession, finalDeliveryLoc);
	}
	//deliNo 가져오기
	@Override
	public int selectDeliNo() {
		return od.selectDeliNo(sqlSession);
	}

	//업체 리스트 카운트
	@Override
	public int getSearchResultListCount(String search) {
		return od.getSearchResultListCount(sqlSession, search);
	}

	//업체 검색 조회
	@Override
	public ArrayList<DeliveryCompany> selectSearchResultList(String search, PageInfo pi) throws OrderException {
		return od.selectSearchResultList(sqlSession, search, pi);
	}

	//매장 상세 정보
	@Override
	public DeliveryCompany getComDetail(String comNo) {
		return od.getComDetail(sqlSession, comNo);
	}

	//주문번호 가져오기
	@Override
	public String selectOrderNo() {
		return od.selectOrderNo(sqlSession);
	}

	//주문정보 입력하기
	@Override
	public int insertOrder(OrderMain om, Coupon cp, ArrayList<OrderItem> oiList) {
		int result = 0;
		
		int resultOM = od.insertOrderMain(sqlSession, om);
		//System.out.println("OrderMain Insert: " + resultOM);
		int resultOI = 0;
		for(int i=0; i<oiList.size(); i++) {
			int orderIno = od.selectOrderIno(sqlSession);
			oiList.get(i).setOrderIno(orderIno);
			int result1 = od.insertOrderItem(sqlSession, oiList.get(i));
			//System.out.println("OrderItem Insert: " + result1);
			
			int result2 = 0;
			for(int j=0; j<oiList.get(i).getOrderTopping().size(); j++) {
				oiList.get(i).getOrderTopping().get(j).setOrderIno(orderIno);
				result2 += od.insertOrderTopping(sqlSession, oiList.get(i).getOrderTopping().get(j));
			}
			//System.out.println("OrderTopping Insert: " + result2);
			if(result1 == 1 && result2 == oiList.get(i).getOrderTopping().size()) resultOI++;
		}
		
		int resultCP = 0;
		if(cp.getIssueNo() != 0) {
			resultCP = od.updateCouponIssue(sqlSession, cp);
		} else {
			resultCP = 1;
		}
		
		if(resultOM == 1 && resultOI == oiList.size() && resultCP == 1) result = 1;
		return result;
	}
}
