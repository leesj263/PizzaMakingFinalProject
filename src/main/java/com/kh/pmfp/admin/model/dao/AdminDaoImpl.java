package com.kh.pmfp.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository
public class AdminDaoImpl implements AdminDao {

	//회원 목록 조회용
	@Override
	public ArrayList<AdminMember> selectUserList(SqlSessionTemplate sqlSession) throws AdminSelectException {
		ArrayList<AdminMember> userList=new ArrayList<AdminMember>();
		userList=(ArrayList)sqlSession.selectList("Admin.selectMemberList");
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
	public ArrayList<AdminSeller> selectSellerList(SqlSessionTemplate sqlSession) throws AdminSelectException {
		ArrayList<AdminSeller> sellerList=new ArrayList<AdminSeller>();
		
		sellerList=(ArrayList)sqlSession.selectList("Admin.selectSellerList");
		
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

	//공지사항 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectNoticeList(SqlSessionTemplate sqlSession) throws AdminSelectException {
		ArrayList<AdminBoard> noticeList=new ArrayList<AdminBoard>();
		noticeList=(ArrayList)sqlSession.selectList("Admin.selectNoticeList");
		
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

	//qna 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectQnaList(SqlSessionTemplate sqlSession) throws AdminSelectException {
		ArrayList<AdminBoard> qnaList=new ArrayList<AdminBoard>();
		qnaList=(ArrayList)sqlSession.selectList("Admin.selectQnaList");
		
		if(qnaList==null) {
			throw new AdminSelectException("Q&A 목록 조회 실패");
		}
		
		return qnaList;
	}

	//qna 답변 대기 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectQnaWaitList(SqlSessionTemplate sqlSession) throws AdminSelectException {
		ArrayList<AdminBoard> qnaWaitList=new ArrayList<AdminBoard>();
		qnaWaitList=(ArrayList)sqlSession.selectList("Admin.selectQnaWaitList");
		
		if(qnaWaitList==null) {
			throw new AdminSelectException("Q&A 답변 대기 목록 조회 실패");
		}
		
		return qnaWaitList;
	}

	//qna 답변 완료 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectQnaCompleteList(SqlSessionTemplate sqlSession) throws AdminSelectException {
		ArrayList<AdminBoard> qnaCompleteList=new ArrayList<AdminBoard>();
		qnaCompleteList=(ArrayList)sqlSession.selectList("Admin.selectQnaCompleteList");
		
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



}
