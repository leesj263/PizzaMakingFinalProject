package com.kh.pmfp.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pmfp.admin.model.dao.AdminDao;
import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.vo.AdminBoard;
import com.kh.pmfp.admin.model.vo.AdminMember;
import com.kh.pmfp.admin.model.vo.AdminOrder;
import com.kh.pmfp.admin.model.vo.AdminSeller;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDao ad;

	//회원 목록 조회용
	@Override
	public ArrayList<AdminMember> selectUserList() throws AdminSelectException {
		
		ArrayList<AdminMember> userList=ad.selectUserList(sqlSession);
		
		return userList;
	}

	//회원 상세조회용
	@Override
	public AdminMember selectUser(int num) throws AdminSelectException {
		AdminMember am=new AdminMember();
		am=ad.selectUser(sqlSession, num);
		
		return am;
	}

	//회원 주문 목록 조회용
	@Override
	public ArrayList<AdminOrder> selectUserOrder(int num) throws AdminSelectException {
		ArrayList<AdminOrder> orderList=ad.selectOrderList(sqlSession, num);
		
		return orderList;
	}

	//업체 목록 조회용
	@Override
	public ArrayList<AdminSeller> selectSellerList() throws AdminSelectException {
		ArrayList<AdminSeller> sellerList=ad.selectSellerList(sqlSession);
		
		return sellerList;
	}
	
	//승인 대기 목록 조회용
	@Override
	public ArrayList<AdminSeller> selectWaitSeller() throws AdminSelectException {
		ArrayList<AdminSeller> waitSeller=ad.selectWaitSeller(sqlSession);
		
		return waitSeller;
	}

	//업체 상세조회용
	@Override
	public AdminSeller selectSeller(int num) throws AdminSelectException {
		AdminSeller seller=new AdminSeller();
		seller=ad.selectSeller(sqlSession, num);
		
		return seller;
	}

	//공지사항 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectNoticeList() throws AdminSelectException {
		ArrayList<AdminBoard> noticeList=new ArrayList<AdminBoard>();
		noticeList=ad.selectNoticeList(sqlSession);
		
		return noticeList;
	}

	//공지사항 상세보기용
	@Override
	public AdminBoard selectNotice(int num) throws AdminSelectException, AdminCountException {
		AdminBoard notice=new AdminBoard();

		//조회수 증가
		int result=ad.updateBCount(sqlSession,num);
		
		System.out.println("조회수 증가 결과 : "+result);
		
		if(result>0) {
			notice=ad.selectNotice(sqlSession, num);
		}
		
		return notice;
	}
}
