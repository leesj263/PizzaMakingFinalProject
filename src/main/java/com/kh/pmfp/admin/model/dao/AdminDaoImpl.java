package com.kh.pmfp.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.vo.AdminMember;
import com.kh.pmfp.admin.model.vo.AdminOrder;
import com.kh.pmfp.admin.model.vo.AdminSeller;

@Repository
public class AdminDaoImpl implements AdminDao {

	//회원 목록 조회용
	@Override
	public ArrayList<AdminMember> selectUserList(SqlSessionTemplate sqlSession) throws AdminSelectException {
		ArrayList<AdminMember> userList=new ArrayList<AdminMember>();
		userList=(ArrayList)sqlSession.selectList("Admin.selectMemberList");
		if(userList==null) {
			throw new AdminSelectException("회원 목록 조회 실패!");
		}
		return userList;
	}

	//회원 상세조회용
	@Override
	public AdminMember selectUser(SqlSessionTemplate sqlSession, int num) throws AdminSelectException {
		AdminMember am=new AdminMember();
		am=sqlSession.selectOne("Admin.selectMember", num);
		if(am==null) {
			throw new AdminSelectException("회원 상세정보 조회 실패!");
		}
		return am;
	}

	//회원 주문 목록 조회용
	@Override
	public ArrayList<AdminOrder> selectOrderList(SqlSessionTemplate sqlSession, int num) throws AdminSelectException {
		ArrayList<AdminOrder> orderList=new ArrayList<AdminOrder>();
		orderList=(ArrayList)sqlSession.selectList("Admin.selectUserOrderList", num);
		if(orderList==null) {
			throw new AdminSelectException("회원 주문목록 조회 실패!");
		}
		return orderList;
	}

	//업체 목록 조회용
	@Override
	public ArrayList<AdminSeller> selectSellerList(SqlSessionTemplate sqlSession) throws AdminSelectException {
		ArrayList<AdminSeller> sellerList=new ArrayList<AdminSeller>();
		
		sellerList=(ArrayList)sqlSession.selectList("Admin.selectSellerList");
		
		if(sellerList==null) {
			throw new AdminSelectException("지점 목록 조회 실패!");
		}
		
		return sellerList;
	}

	//승인 대기 목록 조회용
	@Override
	public ArrayList<AdminSeller> selectWaitSeller(SqlSessionTemplate sqlSession) throws AdminSelectException {
		ArrayList<AdminSeller> waitSeller=new ArrayList<AdminSeller>();
		
		waitSeller=(ArrayList)sqlSession.selectList("Admin.selectWaitSeller");
		
		if(waitSeller==null) {
			throw new AdminSelectException("인증 대기중 지점 조회 실패!");
		}
		
		return waitSeller;
	}

	//업체 상세조회용
	@Override
	public AdminSeller selectSeller(SqlSessionTemplate sqlSession, int num) throws AdminSelectException {
		AdminSeller seller=new AdminSeller();
		seller=sqlSession.selectOne("Admin.selectSeller", num);
		
		if(seller==null) {
			throw new AdminSelectException("업체 상세조회 실패");
		}
		return seller;
	}

}
