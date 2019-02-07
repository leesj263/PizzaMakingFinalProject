package com.kh.pmfp.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.vo.AdminMember;
import com.kh.pmfp.admin.model.vo.AdminOrder;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public ArrayList<AdminMember> selectUserList(SqlSessionTemplate sqlSession) throws AdminSelectException {
		ArrayList<AdminMember> userList=new ArrayList<AdminMember>();
		userList=(ArrayList)sqlSession.selectList("Admin.selectMemberList");
		if(userList==null) {
			throw new AdminSelectException("회원 목록 조회 실패!");
		}
		return userList;
	}

	@Override
	public AdminMember selectUser(SqlSessionTemplate sqlSession, int num) throws AdminSelectException {
		AdminMember am=new AdminMember();
		am=sqlSession.selectOne("Admin.selectMember", num);
		if(am==null) {
			throw new AdminSelectException("회원 상세정보 조회 실패!");
		}
		return am;
	}

	@Override
	public ArrayList<AdminOrder> selectOrderList(SqlSessionTemplate sqlSession, int num) throws AdminSelectException {
		ArrayList<AdminOrder> orderList=new ArrayList<AdminOrder>();
		orderList=(ArrayList)sqlSession.selectList("Admin.selectUserOrderList", num);
		if(orderList==null) {
			throw new AdminSelectException("회원 주문목록 조회 실패!");
		}
		return orderList;
	}

}
