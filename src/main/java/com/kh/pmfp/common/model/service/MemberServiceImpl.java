package com.kh.pmfp.common.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pmfp.common.model.dao.MemberDao;
import com.kh.pmfp.common.model.exception.LoginException;
import com.kh.pmfp.common.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao md;
	
	
	//암호화전 로그인
	@Override
	public Member loginMember(Member m) throws LoginException {
		
		Member loginUser = md.loginCheck(sqlSession,m);
		
		return loginUser;
	}

}
