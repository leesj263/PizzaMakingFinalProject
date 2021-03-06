package com.kh.pmfp.common.model.service;

import com.kh.pmfp.common.model.exception.LoginException;
import com.kh.pmfp.common.model.vo.Company;
import com.kh.pmfp.common.model.vo.Member;

public interface MemberService {

	//암호화전 로그인
	Member loginMember(Member m) throws LoginException;

	//일반회원 회원가입
	int insertNormalMember(Member m);

	//id중복확인 체크
	int duplicationCheck(String memberId);

	//사업자 회원가입
	int insertBusinessMember(Member m, Company c);

	//아이디 찾기
	String selectIdSearch(Member m);

	//비밀번호 찾기
	String selectPwdSearch(Member m);

	//임시 비밀번호로 update
	int updatePwd(Member m);

	//마이페이지-회원정보 수정
	int updateModifyMember(Member m);

	//마이페이지-회원탈퇴
	int deleteMember(String deleteId);

	//카카오 로그인 
	Member kakaoLoginMember(String memberId);

	



	

}
