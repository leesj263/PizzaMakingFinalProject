package com.kh.pmfp.common.model.service;

import com.kh.pmfp.common.model.exception.LoginException;
import com.kh.pmfp.common.model.vo.Member;

public interface MemberService {

	//암호화전 로그인
	Member loginMember(Member m) throws LoginException;

	//일반회원 회원가입
	int insertNormalMember(Member m);

	//id중복확인 체크
	int duplicationCheck(String memberId);

}
