package com.kh.pmfp.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminDeleteException;
import com.kh.pmfp.admin.model.exception.AdminInsertException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.exception.AdminUpdateException;
import com.kh.pmfp.admin.model.vo.AdminBoard;
import com.kh.pmfp.admin.model.vo.AdminBoard2;
import com.kh.pmfp.admin.model.vo.AdminMember;
import com.kh.pmfp.admin.model.vo.AdminOrder;
import com.kh.pmfp.admin.model.vo.AdminSeller;

public interface AdminDao {

	//회원 목록 조회용
	ArrayList<AdminMember> selectUserList(SqlSessionTemplate sqlSession) throws AdminSelectException;

	//회원 상세조회용
	AdminMember selectUser(SqlSessionTemplate sqlSession, int num) throws AdminSelectException;

	//회원 주문 목록 조회용
	ArrayList<AdminOrder> selectOrderList(SqlSessionTemplate sqlSession, int num) throws AdminSelectException;

	//업체 목록 조회용
	ArrayList<AdminSeller> selectSellerList(SqlSessionTemplate sqlSession) throws AdminSelectException;

	//승인 대기 목록 조회용
	ArrayList<AdminSeller> selectWaitSeller(SqlSessionTemplate sqlSession) throws AdminSelectException;

	//업체 상세조회용
	AdminSeller selectSeller(SqlSessionTemplate sqlSession, int num) throws AdminSelectException;

	//공지사항 목록 조회용
	ArrayList<AdminBoard> selectNoticeList(SqlSessionTemplate sqlSession) throws AdminSelectException;

	//공지사항 상세보기용
	AdminBoard selectNotice(SqlSessionTemplate sqlSession, int num) throws AdminSelectException;

	//조회수 증가용
	int updateBCount(SqlSessionTemplate sqlSession, int num) throws AdminCountException;

	//faq 목록 조회용
	ArrayList<AdminBoard> selectFaqList(SqlSessionTemplate sqlSession) throws AdminSelectException;

	//qna 목록 조회용
	ArrayList<AdminBoard> selectQnaList(SqlSessionTemplate sqlSession) throws AdminSelectException;

	//qna 답변 대기 목록 조회용
	ArrayList<AdminBoard> selectQnaWaitList(SqlSessionTemplate sqlSession) throws AdminSelectException;

	//qna 답변 완료 목록 조회용
	ArrayList<AdminBoard> selectQnaCompleteList(SqlSessionTemplate sqlSession) throws AdminSelectException;

	//faq 상세보기용
	AdminBoard selectFaq(SqlSessionTemplate sqlSession, int num) throws AdminSelectException;

	//qna 상세보기용
	AdminBoard selectQna(SqlSessionTemplate sqlSession, int num) throws AdminSelectException;

	//qna 상세보기용
	AdminBoard selectAnswer(SqlSessionTemplate sqlSession, int num) throws AdminSelectException;

	//공지사항 작성용
	int insertNotice(SqlSessionTemplate sqlSession, AdminBoard notice) throws AdminInsertException;

	//수정할 공지사항 조회용
	AdminBoard selectModNotice(SqlSessionTemplate sqlSession, int num) throws AdminSelectException;

	//공지사항 수정용
	int updateNotice(SqlSessionTemplate sqlSession, AdminBoard notice) throws AdminUpdateException;

	//공지사항 삭제용
	int deleteNotice(SqlSessionTemplate sqlSession, int num) throws AdminDeleteException;


}
