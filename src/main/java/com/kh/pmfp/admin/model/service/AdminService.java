package com.kh.pmfp.admin.model.service;

import java.util.ArrayList;

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

public interface AdminService {

	//회원 목록 조회용
	ArrayList<AdminMember> selectUserList() throws AdminSelectException;

	//회원 상세조회용
	AdminMember selectUser(int num) throws AdminSelectException;
	
	//회원 주문 목록 조회용
	ArrayList<AdminOrder> selectUserOrder(int num) throws AdminSelectException;

	//업체 목록 조회용
	ArrayList<AdminSeller> selectSellerList() throws AdminSelectException;

	//승인 대기 목록 조회용
	ArrayList<AdminSeller> selectWaitSeller() throws AdminSelectException;

	//업체 상세조회용
	AdminSeller selectSeller(int num) throws AdminSelectException;

	//공지사항 목록 조회용
	ArrayList<AdminBoard> selectNoticeList() throws AdminSelectException;

	//공지사항 상세보기용
	AdminBoard selectNotice(int num) throws AdminSelectException, AdminCountException;

	//faq 목록 조회용
	ArrayList<AdminBoard> selectFaqList() throws AdminSelectException;

	//qna 목록 조회용
	ArrayList<AdminBoard> selectQnaList() throws AdminSelectException;

	//qna 답변 대기 목록 조회용
	ArrayList<AdminBoard> selectQnaWaitList() throws AdminSelectException;

	//qna 답변 완료 목록 조회용
	ArrayList<AdminBoard> selectQnaCompleteList() throws AdminSelectException;

	//faq 상세보기용
	AdminBoard selectFaq(int num) throws AdminSelectException, AdminCountException;

	//qna 상세보기용
	AdminBoard selectQna(int num) throws AdminSelectException, AdminCountException;

	//qna 상세보기용
	AdminBoard selectAnswer(int num) throws AdminSelectException, AdminCountException;

	//공지사항 작성용
	int insertNotice(AdminBoard notice) throws AdminInsertException;

	//수정할 공지사항 조회용
	AdminBoard selectModNotice(int num) throws AdminSelectException;

	//공지사항 수정용
	int updateNotice(AdminBoard notice) throws AdminUpdateException;

	//공지사항 삭제용
	int deleteNotice(int num) throws AdminDeleteException;

	//수정할 faq 조회용
	AdminBoard selectModFaq(int num) throws AdminSelectException;

	//faq 수정용
	int updateFaq(AdminBoard faq) throws AdminUpdateException;

	//faq 삭제용
	int deleteFaq(int num) throws AdminDeleteException;

	//faq 작성용 
	int insertFaq(AdminBoard faq) throws AdminInsertException;
	
	//qna 답변용
	int insertAnswer(AdminBoard answer) throws AdminInsertException, AdminUpdateException;

	//업체 주문 목록 조회용
	ArrayList<AdminSellerOrderList> selectSellerOrderList() throws AdminSelectException;

	//업체 주문 상세 조회용
	ArrayList<AdminSellerOrder> selectSellerOrder(AdminSellerOrderList orderList) throws AdminSelectException;

}
