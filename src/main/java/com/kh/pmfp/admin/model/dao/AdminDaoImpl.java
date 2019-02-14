package com.kh.pmfp.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminDeleteException;
import com.kh.pmfp.admin.model.exception.AdminInsertException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.exception.AdminUpdateException;
import com.kh.pmfp.admin.model.vo.AdminBoard;
import com.kh.pmfp.admin.model.vo.AdminBoard2;
import com.kh.pmfp.admin.model.vo.AdminCalculateList;
import com.kh.pmfp.admin.model.vo.AdminMaterial;
import com.kh.pmfp.admin.model.vo.AdminMember;
import com.kh.pmfp.admin.model.vo.AdminOrder;
import com.kh.pmfp.admin.model.vo.AdminOrderMenu;
import com.kh.pmfp.admin.model.vo.AdminSeller;
import com.kh.pmfp.admin.model.vo.AdminSellerOrder;
import com.kh.pmfp.admin.model.vo.AdminSellerOrderList;
import com.kh.pmfp.common.model.vo.PageInfo;

@Repository
public class AdminDaoImpl implements AdminDao {

	//회원 페이징 -카운트 조회용
	@Override
	public int selectUserCount(SqlSessionTemplate sqlSession, AdminMember member) throws AdminCountException {
		int listCount=-1;
		listCount=sqlSession.selectOne("Admin.selectUserCount", member);
		if(listCount<0) {
			throw new AdminCountException("회원 수 조회 실패");
		}
		return listCount;
	}
	
	//회원 목록 조회용
	@Override
	public ArrayList<AdminMember> selectUserList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminSelectException {
		ArrayList<AdminMember> userList=new ArrayList<AdminMember>();
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		userList=(ArrayList)sqlSession.selectList("Admin.selectMemberList", null, rowBounds);
		if(userList==null) {
			throw new AdminSelectException("회원 목록 조회 실패!");
		}
		return userList;
	}

	//회원 상세조회용
	@Override
	public AdminMember selectUser(SqlSessionTemplate sqlSession, int num) throws AdminSelectException {
		AdminMember am=new AdminMember();
		am=sqlSession.selectOne("Admin.selectMember", num);
		if(am==null) {
			throw new AdminSelectException("회원 상세정보 조회 실패!");
		}
		return am;
	}

	//회원 주문 목록 조회용
	@Override
	public ArrayList<AdminOrder> selectOrderList(SqlSessionTemplate sqlSession, int num) throws AdminSelectException {
		ArrayList<AdminOrder> orderList=new ArrayList<AdminOrder>();
		
		orderList=(ArrayList)sqlSession.selectList("Admin.selectUserOrderList", num);
		if(orderList==null) {
			throw new AdminSelectException("회원 주문목록 조회 실패!");
		}
		return orderList;
	}

	//업체 목록 조회용
	@Override
	public ArrayList<AdminSeller> selectSellerList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminSelectException {
		ArrayList<AdminSeller> sellerList=new ArrayList<AdminSeller>();
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		sellerList=(ArrayList)sqlSession.selectList("Admin.selectSellerList", null, rowBounds);
		
		if(sellerList==null) {
			throw new AdminSelectException("지점 목록 조회 실패!");
		}
		
		return sellerList;
	}

	//승인 대기 목록 조회용
	@Override
	public ArrayList<AdminSeller> selectWaitSeller(SqlSessionTemplate sqlSession) throws AdminSelectException {
		ArrayList<AdminSeller> waitSeller=new ArrayList<AdminSeller>();
		
		waitSeller=(ArrayList)sqlSession.selectList("Admin.selectWaitSeller");
		
		if(waitSeller==null) {
			throw new AdminSelectException("인증 대기중 지점 조회 실패!");
		}
		
		return waitSeller;
	}

	//업체 상세조회용
	@Override
	public AdminSeller selectSeller(SqlSessionTemplate sqlSession, int num) throws AdminSelectException {
		AdminSeller seller=new AdminSeller();
		seller=sqlSession.selectOne("Admin.selectSeller", num);
		
		if(seller==null) {
			throw new AdminSelectException("업체 상세조회 실패");
		}
		return seller;
	}

	//업체별 주문횟수 카운트용
	@Override
	public int selectEachSellerOrderCount(SqlSessionTemplate sqlSession, int num) throws AdminCountException{
		int result=-1;
		result=sqlSession.selectOne("Admin.selectEachSellerOrderCount", num);
		if(result<0) {
			throw new AdminCountException("업체 주문횟수 조회 실패");
		}
		return result;
	}
	
	//업체 상세보기 - 업체 주문 조회용
	@Override
	public ArrayList<AdminSellerOrderList> selectEachSellerOrderList(SqlSessionTemplate sqlSession, int num,
			PageInfo pi) throws AdminSelectException {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<AdminSellerOrderList> orderList=new ArrayList<AdminSellerOrderList>();
		orderList=(ArrayList)sqlSession.selectList("Admin.selectEachSellerOrderList", num, rowBounds);
		
		return orderList;
	}
	
	//공지사항 글수
	@Override
	public int selectNoticeCount(SqlSessionTemplate sqlSession) throws AdminCountException {
		int result=-1;
		result=sqlSession.selectOne("Admin.selectNoticeCount");
		if(result<0) {
			throw new AdminCountException("공지사항 글 수 조회 실패");
		}
		return result;
	}

	//공지사항 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminSelectException {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<AdminBoard> noticeList=new ArrayList<AdminBoard>();
		noticeList=(ArrayList)sqlSession.selectList("Admin.selectNoticeList", null, rowBounds);
		
		if(noticeList==null) {
			throw new AdminSelectException("공지사항 목록 조회 실패");
		}
		
		return noticeList;
	}

	//조회수 증가용
	@Override
	public int updateBCount(SqlSessionTemplate sqlSession, int num) throws AdminCountException {
		int result=0;
		result=sqlSession.update("Admin.updateBCount", num);
		
		if(result<=0) {
			throw new AdminCountException("조회수 증가 실패");
		}
		return result;
	}
	
	//공지사항 상세보기용
	@Override
	public AdminBoard selectNotice(SqlSessionTemplate sqlSession, int num) throws AdminSelectException {
		AdminBoard notice=new AdminBoard();
		notice=sqlSession.selectOne("Admin.selectNotice", num);
		
		if(notice==null) {
			throw new AdminSelectException("공지사항 상세조회 실패");
		}
		
		return notice;
	}

	//faq 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectFaqList(SqlSessionTemplate sqlSession) throws AdminSelectException {
		ArrayList<AdminBoard> faqList=new ArrayList<AdminBoard>();
		faqList=(ArrayList)sqlSession.selectList("Admin.selectFaqList");
		
		if(faqList==null) {
			throw new AdminSelectException("FAQ 목록 조회 실패");
		}
		
		return faqList;
	}

	//QNA 글수
	@Override
	public int selectQnaCount(SqlSessionTemplate sqlSession) throws AdminCountException {
		int result=-1;
		result=sqlSession.selectOne("Admin.selectQnaCount");
		if(result<0) {
			throw new AdminCountException("Q&A 글 수 조회 실패");
		}
		return result;
	}

	//qna 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminSelectException {
		ArrayList<AdminBoard> qnaList=new ArrayList<AdminBoard>();
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		qnaList=(ArrayList)sqlSession.selectList("Admin.selectQnaList", null, rowBounds);
		
		if(qnaList==null) {
			throw new AdminSelectException("Q&A 목록 조회 실패");
		}
		
		return qnaList;
	}

	//Qna 답변대기중 글수
	@Override
	public int selectQnaWaitCount(SqlSessionTemplate sqlSession) throws AdminCountException {
		int result=-1;
		result=sqlSession.selectOne("Admin.selectQnaWaitCount");
		if(result<0) {
			throw new AdminCountException("Q&A 답변 대기 글 수 조회 실패");
		}
		return result;
	}

	//qna 답변 대기 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectQnaWaitList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminSelectException {
		ArrayList<AdminBoard> qnaWaitList=new ArrayList<AdminBoard>();
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		qnaWaitList=(ArrayList)sqlSession.selectList("Admin.selectQnaWaitList", null, rowBounds);
		
		if(qnaWaitList==null) {
			throw new AdminSelectException("Q&A 답변 대기 목록 조회 실패");
		}
		
		return qnaWaitList;
	}

	//Qna 답변완료 글수
	@Override
	public int selectQnaCompleteCount(SqlSessionTemplate sqlSession) throws AdminCountException {
		int result=-1;
		result=sqlSession.selectOne("Admin.selectQnaCompleteCount");
		if(result<0) {
			throw new AdminCountException("Q&A 답변 완료 글 수 조회 실패");
		}
		return result;
	}
	//qna 답변 완료 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectQnaCompleteList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminSelectException {
		ArrayList<AdminBoard> qnaCompleteList=new ArrayList<AdminBoard>();
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		qnaCompleteList=(ArrayList)sqlSession.selectList("Admin.selectQnaCompleteList", null, rowBounds);
		
		if(qnaCompleteList==null) {
			throw new AdminSelectException("Q&A 답변 완료 목록 조회 실패");
		}
		
		return qnaCompleteList;
	}

	//faq 상세보기용
	@Override
	public AdminBoard selectFaq(SqlSessionTemplate sqlSession, int num) throws AdminSelectException {
		AdminBoard faq=new AdminBoard();
		faq=sqlSession.selectOne("Admin.selectFaq", num);
		
		if(faq==null) {
			throw new AdminSelectException("FAQ 상세조회 실패");
		}
		
		return faq;
	}

	//qna 상세보기용
	@Override
	public AdminBoard selectQna(SqlSessionTemplate sqlSession, int num) throws AdminSelectException {
		AdminBoard qna=new AdminBoard();
		qna=sqlSession.selectOne("Admin.selectQna", num);
		
		if(qna==null) {
			throw new AdminSelectException("Q&A 상세조회 실패");
		}
		
		return qna;
	}

	//qna 상세보기용
	@Override
	public AdminBoard selectAnswer(SqlSessionTemplate sqlSession, int num) throws AdminSelectException {
		AdminBoard answer=new AdminBoard();
		answer=sqlSession.selectOne("Admin.selectAnswer", num);
		/*
		if(answer==null) {
			throw new AdminSelectException("Q&A 답변조회 실패");
		}
		*/
		return answer;
	}

	//공지사항 작성용
	@Override
	public int insertNotice(SqlSessionTemplate sqlSession, AdminBoard notice) throws AdminInsertException {
		int result=0;
		result=sqlSession.insert("Admin.insertNotice", notice);
		
		if(result<=0) {
			throw new AdminInsertException("공지사항 작성 실패");
		}
		return result;
	}

	//수정할 공지사항 가져오기
	@Override
	public AdminBoard selectModNotice(SqlSessionTemplate sqlSession, int num) throws AdminSelectException {
		AdminBoard notice=new AdminBoard();
		notice=sqlSession.selectOne("Admin.selectNotice", num);
		
		if(notice==null) {
			throw new AdminSelectException("수정할 공지사항 가져오기 실패");
		}
		
		return notice;
	}

	//공지사항 수정용
	@Override
	public int updateNotice(SqlSessionTemplate sqlSession, AdminBoard notice) throws AdminUpdateException {
		int result=0;
		result=sqlSession.update("Admin.updateNotice", notice);
		
		if(result<=0) {
			throw new AdminUpdateException("공지사항 수정 실패");
		}
		
		return result;
	}

	//공지사항 삭제용
	@Override
	public int deleteNotice(SqlSessionTemplate sqlSession, int num) throws AdminDeleteException {
		int result=0;
		
		result=sqlSession.update("Admin.deleteNotice", num);
		
		if(result<=0) {
			throw new AdminDeleteException("공지사항 삭제 실패");
		}
		return result;
	}

	//수정할 faq 조회용
	@Override
	public AdminBoard selectModFaq(SqlSessionTemplate sqlSession, int num) throws AdminSelectException {
		AdminBoard faq=new AdminBoard();
		faq=sqlSession.selectOne("Admin.selectFaq", num);
		
		if(faq==null) {
			throw new AdminSelectException("수정할 FAQ 가져오기 실패");
		}
		
		return faq;
	}

	//faq 수정용
	@Override
	public int updateFaq(SqlSessionTemplate sqlSession, AdminBoard faq) throws AdminUpdateException {
		int result=0;
		result=sqlSession.update("Admin.updateFaq", faq);
		
		if(result<=0) {
			throw new AdminUpdateException("FAQ 수정 실패");
		}

		return result;
	}

	//faq 삭제용
	@Override
	public int deleteFaq(SqlSessionTemplate sqlSession, int num) throws AdminDeleteException {
		int result=0;
		result=sqlSession.update("Admin.deleteFaq", num);
		
		if(result<=0) {
			throw new AdminDeleteException("FAQ 삭제 실패");
		}

		return result;
	}

	//faq 작성용
	@Override
	public int insertFaq(SqlSessionTemplate sqlSession, AdminBoard faq) throws AdminInsertException {
		int result=sqlSession.insert("Admin.insertFaq", faq);
		if(result<=0) {
			throw new AdminInsertException("FAQ 작성 실패");
		}
		return result;
	}
	
	//qna 답변용
	@Override
	public int insertAnswer(SqlSessionTemplate sqlSession, AdminBoard answer) throws AdminInsertException {
		int result=0;
		
		result=sqlSession.insert("Admin.insertAnswer", answer);
		
		if(result<=0) {
			throw new AdminInsertException("Q&A 답변 등록 실패");
		}
		return result;
	}


	//qna 답변결과 적용
	@Override
	public int updateQna(SqlSessionTemplate sqlSession, int boardRefNo) throws AdminUpdateException {
		int result=0;
		int num=boardRefNo;
		result=sqlSession.update("Admin.updateQna", num);
		
		if(result<=0) {
			throw new AdminUpdateException("Q&A 답변 상태 변경 실패");
		}
		
		return result;
	}

	//업체 주문 수 확인용
	@Override
	public int selectSellerOrderCount(SqlSessionTemplate sqlSession) throws AdminCountException {
		int listCount=-1;
		listCount=sqlSession.selectOne("Admin.selectSellerOrderCount");
		if(listCount<0) {
			throw new AdminCountException("업체 주문 수 조회 실패");
		}
		return listCount;
	}

	//업체 주문 목록 조회용
	@Override
	public ArrayList<AdminSellerOrderList> selectSellerOrderList(SqlSessionTemplate sqlSession, PageInfo pi)
			throws AdminSelectException {
		ArrayList<AdminSellerOrderList> orderList=new ArrayList<AdminSellerOrderList>();
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		orderList=(ArrayList)sqlSession.selectList("Admin.selectSellerOrderList", null, rowBounds);
		if(orderList==null) {
			throw new AdminSelectException("업체 주문 목록 조회 실패");
		}
		
		return orderList;
	}

	//업체 주문 상세 조회용
	@Override
	public ArrayList<AdminSellerOrder> selectSellerOrder(SqlSessionTemplate sqlSession, AdminSellerOrderList orderList)
			throws AdminSelectException {
		ArrayList<AdminSellerOrder> order=new ArrayList<AdminSellerOrder>();
		order=(ArrayList)sqlSession.selectList("Admin.selectSellerOrder", orderList);
		if(order==null) {
			throw new AdminSelectException("업체 주문 상세 조회 - 주문이력 가져오기 실패");
		}
		return order;
	}

	//재료(토핑) 페이징- 게시글 수 확인용
	@Override
	public int selectMatCount(SqlSessionTemplate sqlSession) throws AdminCountException  {
		int listCount=-1;
		listCount=sqlSession.selectOne("Admin.selectMatCount");
		
		if(listCount<0) {
			throw new AdminCountException("재료(토핑) 개수 조회 실패");
		}
		return listCount;
	}

	//재료 목록 조회용
	@Override
	public ArrayList<AdminMaterial> selectMaterialList(SqlSessionTemplate sqlSession, PageInfo pi)
			throws AdminSelectException {
		ArrayList<AdminMaterial> toppingList=new ArrayList<AdminMaterial>();
		
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		toppingList=(ArrayList)sqlSession.selectList("Admin.selectMaterialList", null, rowBounds);
		
		if(toppingList==null) {
			throw new AdminSelectException("재료 목록 조회 실패");
		}
		return toppingList;
	}

	//재료 이미지 여부 확인
	@Override
	public int selectIfMaterial(SqlSessionTemplate sqlSession, int materialNo) throws AdminCountException {
		int result=-1;
		result=sqlSession.selectOne("Admin.selectIfMaterial", materialNo);
		if(result<0) {
			throw new AdminCountException("재료 이미지 확인 실패");
		}
		return result;
	}
	
	//재료 상세보기용
	@Override
	public AdminMaterial selectMaterial(SqlSessionTemplate sqlSession, int materialNo) throws AdminSelectException {
		AdminMaterial topping=new AdminMaterial();
		topping=sqlSession.selectOne("Admin.selectMaterial", materialNo);
		if(topping==null) {
			throw new AdminSelectException("재료 상세조회 실패");
		}
		return topping;
	}
	
	//재료 상세보기용
	@Override
	public AdminMaterial selectMaterialImg(SqlSessionTemplate sqlSession, int materialNo) throws AdminSelectException {
		AdminMaterial topping=new AdminMaterial();
		topping=sqlSession.selectOne("Admin.selectMaterialImg", materialNo);
		if(topping==null) {
			throw new AdminSelectException("재료 상세조회 실패");
		}
		return topping;
	}

	//토핑 수정용
	@Override
	public int updateMaterial(SqlSessionTemplate sqlSession, AdminMaterial topping) throws AdminUpdateException {
		int result=0;
		System.out.println("dao");
		result=sqlSession.update("Admin.updateMaterial", topping);
		
		if(result<=0) {
			throw new AdminUpdateException("재료 수정 실패");
		}
		return result;
	}
	
	//토핑 판매중지용
	@Override
	public int deleteMaterial(SqlSessionTemplate sqlSession, int materialNo) throws AdminDeleteException {
		int result=0;
		result=sqlSession.update("Admin.deleteMaterial", materialNo);
		if(result<=0) {
			throw new AdminDeleteException("토핑 삭제 실패");
		}
		return result;
	}

	//토핑 재판매용
	@Override
	public int resellMaterial(SqlSessionTemplate sqlSession, int materialNo)  throws AdminUpdateException {
		int result=0;
		result=sqlSession.update("Admin.resellMaterial", materialNo);
		if(result<=0) {
			throw new AdminUpdateException("토핑 재판매변경 실패");
		}
		return result;
	}

	//주문 수 카운트용
	@Override
	public int selectOrderCount(SqlSessionTemplate sqlSession) throws AdminCountException {
		int result=-1;
		result=sqlSession.selectOne("Admin.selectOrderCount");
		if(result<0) {
			throw new AdminCountException("주문 수 카운트 실패");
		}
		return result;
	}

	//주문 목록 조회용
	@Override
	public ArrayList<AdminOrder> selectOrderList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminSelectException {
		ArrayList<AdminOrder> orderList=new ArrayList<AdminOrder>();
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		orderList=(ArrayList)sqlSession.selectList("Admin.selectOrderList", null, rowBounds);
		if(orderList==null) {
			throw new AdminSelectException("주문 목록 조회 실패");
		}
		return orderList;
	}

	//주문 상세보기 용
	@Override
	public AdminOrder selectOrder(SqlSessionTemplate sqlSession, int orderNo) throws AdminSelectException {
		AdminOrder order=new AdminOrder();
		order=sqlSession.selectOne("Admin.selectOrder", orderNo);
		if(order==null) {
			throw new AdminSelectException("주문 상세 조회 실패");
		}
		return order;
	}

	//주문 상세보기 용
	@Override
	public ArrayList<AdminOrderMenu> selectOrderMenu(SqlSessionTemplate sqlSession, int orderNo)
			throws AdminSelectException {
		ArrayList<AdminOrderMenu> menuList=new ArrayList<AdminOrderMenu>();
		menuList=(ArrayList)sqlSession.selectList("Admin.selectOrderMenu", orderNo);
		if(menuList==null) {
			throw new AdminSelectException("주문 메뉴 조회 실패");
		}
		return menuList;
	}

	//정산 목록 전체 수
	@Override
	public int selectCalculateCount(SqlSessionTemplate sqlSession) throws AdminCountException {
		int result=-1;
		result=sqlSession.selectOne("Admin.selectCalculateCount");
		if(result<0) {
			throw new AdminCountException("정산 목록 수 조회 실패");
		}
		return result;
	}

	//정산 목록 조회용
	@Override
	public ArrayList<AdminCalculateList> selectCalculateList(SqlSessionTemplate sqlSession, PageInfo pi)
			throws AdminSelectException {
		ArrayList<AdminCalculateList> calList=new ArrayList<AdminCalculateList>();
		int offset=pi.getLimit()*(pi.getCurrentPage()-1);
		RowBounds rowBounds=new RowBounds(offset, pi.getLimit());
		calList=(ArrayList)sqlSession.selectList("Admin.selectCalculateList", null, rowBounds);
		
		return calList;
	}

	
	

}
