package com.kh.pmfp.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pmfp.admin.model.dao.AdminDao;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.vo.AdminMember;
import com.kh.pmfp.admin.model.vo.AdminOrder;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDao ad;

	@Override
	public ArrayList<AdminMember> selectUserList() throws AdminSelectException {
		
		ArrayList<AdminMember> userList=ad.selectUserList(sqlSession);
		
		return userList;
	}

	@Override
	public AdminMember selectUser(int num) throws AdminSelectException {
		AdminMember am=new AdminMember();
		am=ad.selectUser(sqlSession, num);
		
		return am;
	}

	@Override
	public ArrayList<AdminOrder> selectUserOrder(int num) throws AdminSelectException {
		ArrayList<AdminOrder> orderList=ad.selectOrderList(sqlSession, num);
		
		return orderList;
	}

}
