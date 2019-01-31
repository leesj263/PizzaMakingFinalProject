package com.kh.pmfp.common.model.service;

import com.kh.pmfp.common.model.exception.LoginException;
import com.kh.pmfp.common.model.vo.Member;

public interface MemberService {

	//암호화전 로그인
	Member loginMember(Member m) throws LoginException;

}
