package com.kh.pmfp.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.common.model.exception.LoginException;
import com.kh.pmfp.common.model.vo.Company;
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
	
	//아이디 중복확인 체크
	int duplicationCheck(SqlSessionTemplate sqlSession, String memberId);

	//사업자 회원가입(Company)
	int insertBusinessCompany(SqlSessionTemplate sqlSession, Company c);

	//사업자 회원가입(Member)
	int insertBusinessMember(SqlSessionTemplate sqlSession, Member m);

	//아이디 찾기
	String selectIdSearch(SqlSessionTemplate sqlSession, Member m);

	//비밀번호 찾기
	String selectPwdSearch(SqlSessionTemplate sqlSession, Member m);

	//임시비밀번호로 update
	int updatePwd(SqlSessionTemplate sqlSession, Member m);

}
