package com.kh.pmfp.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pmfp.common.model.exception.LoginException;
import com.kh.pmfp.common.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{

	//암호화 처리 전 로그인
	@Override
	public Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginException {
		Member loginUser = sqlSession.selectOne("Member.loginCheck",m);
		
		if(loginUser==null) {
			throw new LoginException("로그인 정보가 존재하지 않습니다.");
		}
		return loginUser;
	}

	//일반회원 회원가입
	@Override
	public int insertNormalMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("Member.insertNormalMember",m);
	}

	//암호화된 비밀번호 조회
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("Member.selectPwd",m.getMemberId());
	}
	
	//로그인 정보 조회용 메소드
	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("Member.selectLoginUser",m);
	}
	
	

}
