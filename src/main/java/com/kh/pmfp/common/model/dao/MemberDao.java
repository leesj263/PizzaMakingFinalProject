package com.kh.pmfp.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.common.model.exception.LoginException;
import com.kh.pmfp.common.model.vo.Member;

public interface MemberDao {

	//암호화 처리전 로그인
	Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginException;
	
	//일반회원 회원가입
	int insertNormalMember(SqlSessionTemplate sqlSession, Member m);

	//암호화된 비밀번호 조회
	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);
	
	//로그인 정보 조회용 메소드
	Member selectMember(SqlSessionTemplate sqlSession, Member m);

}
