package com.kh.pmfp.common.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	//암호화전 로그인
/*	@Override
	public Member loginMember(Member m) throws LoginException {
		
		Member loginUser = md.loginCheck(sqlSession,m);
		
		return loginUser;
	}*/


	//일반회원 회원가입
	@Override
	public int insertNormalMember(Member m) {
		
		int result = md.insertNormalMember(sqlSession,m);
		
		return result;
	}
	
	//암호화 후 로그인
	@Override
	public Member loginMember(Member m) throws LoginException {
		Member loginUser = null;
		//암호화된 비밀번호 조회
		String encPassword = md.selectEncPassword(sqlSession,m);
		
		//System.out.println("로그인 요청 메소드 실행됨!");
		
		if(!passwordEncoder.matches(m.getMemberPwd(), encPassword)) {
			throw new LoginException("로그인 실패");
		}else {
			loginUser=md.selectMember(sqlSession,m);
		}
		
		return loginUser;
	}

	//아이디 중복확인 체크
	@Override
	public int duplicationCheck(String memberId) {
		int result = md.duplicationCheck(sqlSession,memberId);
		//System.out.println("아이디 중복확인!보냄");
		return result;
	}
	

}
