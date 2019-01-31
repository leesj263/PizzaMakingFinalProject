package com.kh.pmfp.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.common.model.exception.LoginException;
import com.kh.pmfp.common.model.vo.Member;

public interface MemberDao {

	//암호화 처리전 로그인
	Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginException;

}
