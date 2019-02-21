package com.kh.pmfp.admin.model.service;

import java.util.ArrayList;

import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminDeleteException;
import com.kh.pmfp.admin.model.exception.AdminInsertException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.exception.AdminUpdateException;
import com.kh.pmfp.admin.model.vo.AdminBoard;
import com.kh.pmfp.admin.model.vo.AdminCalculate;
import com.kh.pmfp.admin.model.vo.AdminCalculateList;
import com.kh.pmfp.admin.model.vo.AdminMSales;
import com.kh.pmfp.admin.model.vo.AdminMaterial;
import com.kh.pmfp.admin.model.vo.AdminMember;
import com.kh.pmfp.admin.model.vo.AdminMenu;
import com.kh.pmfp.admin.model.vo.AdminOrder;
import com.kh.pmfp.admin.model.vo.AdminOrderMenu;
import com.kh.pmfp.admin.model.vo.AdminSales;
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

	//업체별 주문횟수 카운트용
	int selectEachSellerOrderCount(int num) throws AdminCountException;
	
	//업체 상세보기 - 업체 주문 조회용
	ArrayList<AdminSellerOrderList> selectEachSellerOrderList(int num, PageInfo pi) throws AdminSelectException;

	//공지사항 글 수
	int selectNoticeCount() throws AdminCountException;

	//공지사항 목록 조회용
	ArrayList<AdminBoard> selectNoticeList(PageInfo pi) throws AdminSelectException;

	//공지사항 상세보기용
	AdminBoard selectNotice(int num) throws AdminSelectException, AdminCountException;

	//faq 목록 조회용
	ArrayList<AdminBoard> selectFaqList() throws AdminSelectException;

	//QNA 글수
	int selectQnaCount() throws AdminCountException;
	
	//qna 목록 조회용
	ArrayList<AdminBoard> selectQnaList(PageInfo pi) throws AdminSelectException;

	//Qna 답변대기중 글수
	int selectQnaWaitCount() throws AdminCountException;

	//qna 답변 대기 목록 조회용
	ArrayList<AdminBoard> selectQnaWaitList(PageInfo pi) throws AdminSelectException;

	//Qna 답변완료 글수
	int selectQnaCompleteCount() throws AdminCountException;
	
	//qna 답변 완료 목록 조회용
	ArrayList<AdminBoard> selectQnaCompleteList(PageInfo pi) throws AdminSelectException;

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

	//정산 목록 전체 수
	int selectCalculateCount() throws AdminCountException;

	//정산 목록 조회용
	ArrayList<AdminCalculateList> selectCalculateList(PageInfo pi) throws AdminSelectException;

	//정산 상세 조회용
	ArrayList<AdminCalculate> selectCalculate(AdminCalculateList cal) throws AdminSelectException;

	//정산 완료 처리용 - 상세보기에서 ajax
	int updateCalculate(AdminCalculate cal) throws AdminUpdateException, AdminCountException;

	//기본 메뉴 개수 조회용
	int selectMenuCount() throws AdminCountException;

	//기본 메뉴 목록 조회용
	ArrayList<AdminMenu> selectMenuList(PageInfo pi) throws AdminSelectException;

	//기본 메뉴 조회용
	AdminMenu selectMenu(int basicNo) throws AdminSelectException, AdminCountException;

	//기본 메뉴 상세 조회용
	ArrayList<AdminMenu> selectMenuDetail(int basicNo) throws AdminSelectException;

	//업체 승인용 
	int confirmSeller(AdminSeller seller) throws AdminUpdateException;

	//업체 주문 업데이트용 
	int sellerOrderApply(AdminSellerOrder order) throws AdminUpdateException, AdminCountException;

	//통계 출력용 - 주문/업체주문
	ArrayList<AdminSales> selectStatistics(AdminSales sales) throws AdminSelectException;

	//통계 출력용 업체 리스트
	ArrayList<AdminSeller> selectSellerList() throws AdminSelectException;

	//통계 출력용 --- 업체 통계 -- 한 업체
	ArrayList<AdminSales> selectComStatistics(AdminSales sales) throws AdminSelectException;

	//통계 출력용 토핑 리스트
	ArrayList<AdminMaterial> selectMaterialList() throws AdminSelectException;

	//통계 출력용 -- 토핑
	ArrayList<AdminMSales> selectOrderMStat(int materialCate) throws AdminSelectException;



	
	

	

}
