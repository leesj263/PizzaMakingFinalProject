package com.kh.pmfp.admin.model.service;

import java.util.ArrayList;

import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminDeleteException;
import com.kh.pmfp.admin.model.exception.AdminInsertException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.exception.AdminUpdateException;
import com.kh.pmfp.admin.model.vo.AdminBoard;
import com.kh.pmfp.admin.model.vo.AdminBoard2;
import com.kh.pmfp.admin.model.vo.AdminMaterial;
import com.kh.pmfp.admin.model.vo.AdminMember;
import com.kh.pmfp.admin.model.vo.AdminOrder;
import com.kh.pmfp.admin.model.vo.AdminOrderMenu;
import com.kh.pmfp.admin.model.vo.AdminSeller;
import com.kh.pmfp.admin.model.vo.AdminSellerOrder;
import com.kh.pmfp.admin.model.vo.AdminSellerOrderList;
import com.kh.pmfp.common.model.vo.PageInfo;

public interface AdminService {

	//회원 페이징 -카운트 조회용
	int selectUserCount(AdminMember member) throws AdminCountException;
	
	//회원 목록 조회용
	ArrayList<AdminMember> selectUserList(PageInfo pi) throws AdminSelectException;

	//회원 상세조회용
	AdminMember selectUser(int num) throws AdminSelectException;
	
	//회원 주문 목록 조회용
	ArrayList<AdminOrder> selectUserOrder(int num) throws AdminSelectException;

	//업체 목록 조회용
	ArrayList<AdminSeller> selectSellerList(PageInfo pi) throws AdminSelectException;

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

	//업체 주문 수 확인용
	int selectSellerOrderCount() throws AdminCountException;
	
	//업체 주문 목록 조회용
	ArrayList<AdminSellerOrderList> selectSellerOrderList(PageInfo pi) throws AdminSelectException;

	//업체 주문 상세 조회용
	ArrayList<AdminSellerOrder> selectSellerOrder(AdminSellerOrderList orderList) throws AdminSelectException;

	//재료(토핑) 페이징- 게시글 수 확인용
	int selectMatCount() throws AdminCountException;

	//재료 목록 조회용
	ArrayList<AdminMaterial> selectMaterialList(PageInfo pi) throws AdminSelectException;

	//재료 상세보기용
	AdminMaterial selectMaterial(int materialNo) throws AdminSelectException, AdminCountException;

	//토핑 수정용
	int updateMaterial(AdminMaterial topping) throws AdminUpdateException;

	//토핑 판매중지용
	int deleteMaterial(int materialNo) throws AdminDeleteException;

	//토핑 재판매용
	int resellMaterial(int materialNo) throws AdminUpdateException;

	//주문 수 카운트용
	int selectOrderCount() throws AdminCountException;

	//주문 목록 조회용
	ArrayList<AdminOrder> selectOrderList(PageInfo pi) throws AdminSelectException;

	//주문 상세보기 용
	AdminOrder selectOrder(int orderNo) throws AdminSelectException;

	//주문 상세보기 용
	ArrayList<AdminOrderMenu> selectOrderMenu(int orderNo) throws AdminSelectException;


	

}
