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
import com.kh.pmfp.admin.model.vo.AdminSellerOrder;
import com.kh.pmfp.admin.model.vo.AdminSellerOrderList;

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

	//수정할 faq 조회용
	AdminBoard selectModFaq(SqlSessionTemplate sqlSession, int num) throws AdminSelectException;

	//faq 수정용
	int updateFaq(SqlSessionTemplate sqlSession, AdminBoard faq) throws AdminUpdateException;

	//faq 삭제용
	int deleteFaq(SqlSessionTemplate sqlSession, int num) throws AdminDeleteException;

	//faq 작성용 
	int insertFaq(SqlSessionTemplate sqlSession, AdminBoard faq) throws AdminInsertException;
	
	//qna 답변용
	int insertAnswer(SqlSessionTemplate sqlSession, AdminBoard answer) throws AdminInsertException;

	//qna 답변결과 적용
	int updateQna(SqlSessionTemplate sqlSession, int boardRefNo) throws AdminUpdateException;

	//업체 주문 목록 조회용
	ArrayList<AdminSellerOrderList> selectSellerOrderList(SqlSessionTemplate sqlSession) throws AdminSelectException;

	//업체 주문 상세 조회용
	ArrayList<AdminSellerOrder> selectSellerOrder(SqlSessionTemplate sqlSession, AdminSellerOrderList orderList) throws AdminSelectException;




}
