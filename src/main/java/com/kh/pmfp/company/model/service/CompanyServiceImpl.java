package com.kh.pmfp.company.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.pmfp.company.model.dao.CompanyDao;
import com.kh.pmfp.company.model.exception.FailSelectAdminMessage;
import com.kh.pmfp.company.model.exception.FaileDetailMessage;
import com.kh.pmfp.company.model.vo.CompanyBoard;

@Component
public class CompanyServiceImpl implements CompanyService{

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CompanyDao cd;
	
	@Override
	public ArrayList<CompanyBoard> selectAdminMessage() throws FailSelectAdminMessage {
		// TODO Auto-generated method stub
		ArrayList<CompanyBoard> adminMessage = new ArrayList<CompanyBoard>();
		adminMessage = cd.selectAdminMessage(sqlSession);
		
		
		return adminMessage;
	}

	@Override
	public CompanyBoard detailAdminMessage(int boardNo) throws FaileDetailMessage {
		// TODO Auto-generated method stub
		CompanyBoard detailMessage = cd.detailAdminMessage(sqlSession,boardNo);
		
		return detailMessage;
	}
}
