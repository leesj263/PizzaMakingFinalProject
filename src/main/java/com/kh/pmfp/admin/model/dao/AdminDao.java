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
import com.kh.pmfp.admin.model.vo.AdminMaterial;
import com.kh.pmfp.admin.model.vo.AdminMember;
import com.kh.pmfp.admin.model.vo.AdminOrder;
import com.kh.pmfp.admin.model.vo.AdminOrderMenu;
import com.kh.pmfp.admin.model.vo.AdminSeller;
import com.kh.pmfp.admin.model.vo.AdminSellerOrder;
import com.kh.pmfp.admin.model.vo.AdminSellerOrderList;
import com.kh.pmfp.common.model.vo.PageInfo;

public interface AdminDao {

	//회원 페이징 -카운트 조회용
	int selectUserCount(SqlSessionTemplate sqlSession, AdminMember member) throws AdminCountException;
	
	//회원 목록 조회용
	ArrayList<AdminMember> selectUserList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminSelectException;

	//회원 상세조회용
	AdminMember selectUser(SqlSessionTemplate sqlSession, int num) throws AdminSelectException;

	//회원 주문 목록 조회용
	ArrayList<AdminOrder> selectOrderList(SqlSessionTemplate sqlSession, int num) throws AdminSelectException;

	//업체 목록 조회용
	ArrayList<AdminSeller> selectSellerList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminSelectException;

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
	
	//업체 주문 수 확인용
	int selectSellerOrderCount(SqlSessionTemplate sqlSession) throws AdminCountException;

	//업체 주문 목록 조회용
	ArrayList<AdminSellerOrderList> selectSellerOrderList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminSelectException;

	//업체 주문 상세 조회용
	ArrayList<AdminSellerOrder> selectSellerOrder(SqlSessionTemplate sqlSession, AdminSellerOrderList orderList) throws AdminSelectException;

	//재료(토핑) 페이징- 게시글 수 확인용
	int selectMatCount(SqlSessionTemplate sqlSession) throws AdminCountException;

	//재료 목록 조회용
	ArrayList<AdminMaterial> selectMaterialList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminSelectException;

	//재료 이미지 여부 확인
	int selectIfMaterial(SqlSessionTemplate sqlSession, int materialNo) throws AdminCountException;

	//재료 상세보기용
	AdminMaterial selectMaterial(SqlSessionTemplate sqlSession, int materialNo) throws AdminSelectException;

	//재료 상세보기용
	AdminMaterial selectMaterialImg(SqlSessionTemplate sqlSession, int materialNo) throws AdminSelectException;

	//토핑 수정용
	int updateMaterial(SqlSessionTemplate sqlSession, AdminMaterial topping) throws AdminUpdateException;

	//토핑 판매중지용
	int deleteMaterial(SqlSessionTemplate sqlSession, int materialNo) throws AdminDeleteException;

	//토핑 재판매용
	int resellMaterial(SqlSessionTemplate sqlSession, int materialNo) throws AdminUpdateException ;

	//주문 수 카운트용
	int selectOrderCount(SqlSessionTemplate sqlSession) throws AdminCountException;

	//주문 목록 조회용
	ArrayList<AdminOrder> selectOrderList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminSelectException;

	//주문 상세보기 용
	AdminOrder selectOrder(SqlSessionTemplate sqlSession, int orderNo) throws AdminSelectException;

	//주문 상세보기 용
	ArrayList<AdminOrderMenu> selectOrderMenu(SqlSessionTemplate sqlSession, int orderNo) throws AdminSelectException;






}
