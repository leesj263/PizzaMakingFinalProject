package com.kh.pmfp.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pmfp.common.model.exception.LoginException;
import com.kh.pmfp.common.model.vo.Company;
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
	
	//아이디 중복확인 체크
	@Override
	public int duplicationCheck(SqlSessionTemplate sqlSession, String memberId) {
		
		return sqlSession.selectOne("Member.duplicationCheck",memberId);
	}

	//사업자 회원가입(Company 테이블)
	@Override
	public int insertBusinessCompany(SqlSessionTemplate sqlSession, Company c) {
		
		return sqlSession.insert("Member.insertBusinessCompany",c);
	}

	//사업자 회원가입(Member 테이블)
	@Override
	public int insertBusinessMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("Member.insertBusinessMember", m);
	}
	
	//아이디 찾기
	@Override
	public String selectIdSearch(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("Member.selectIdSearch",m);
	}

	//비밀번호 찾기(DB에 id와 Email이 있는지 조회)
	@Override
	public String selectPwdSearch(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("Member.selectPwdSearch",m);
	}

	@Override
	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("Member.updatePwd",m);
	}
	
	

}
