package com.kh.pmfp.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pmfp.admin.model.dao.AdminDao;
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

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDao ad;

	//회원 목록 조회용
	@Override
	public ArrayList<AdminMember> selectUserList() throws AdminSelectException {
		
		ArrayList<AdminMember> userList=ad.selectUserList(sqlSession);
		
		return userList;
	}

	//회원 상세조회용
	@Override
	public AdminMember selectUser(int num) throws AdminSelectException {
		AdminMember am=new AdminMember();
		am=ad.selectUser(sqlSession, num);
		
		return am;
	}

	//회원 주문 목록 조회용
	@Override
	public ArrayList<AdminOrder> selectUserOrder(int num) throws AdminSelectException {
		ArrayList<AdminOrder> orderList=ad.selectOrderList(sqlSession, num);
		
		return orderList;
	}

	//업체 목록 조회용
	@Override
	public ArrayList<AdminSeller> selectSellerList() throws AdminSelectException {
		ArrayList<AdminSeller> sellerList=ad.selectSellerList(sqlSession);
		
		return sellerList;
	}
	
	//승인 대기 목록 조회용
	@Override
	public ArrayList<AdminSeller> selectWaitSeller() throws AdminSelectException {
		ArrayList<AdminSeller> waitSeller=ad.selectWaitSeller(sqlSession);
		
		return waitSeller;
	}

	//업체 상세조회용
	@Override
	public AdminSeller selectSeller(int num) throws AdminSelectException {
		AdminSeller seller=new AdminSeller();
		seller=ad.selectSeller(sqlSession, num);
		
		return seller;
	}

	//공지사항 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectNoticeList() throws AdminSelectException {
		ArrayList<AdminBoard> noticeList=new ArrayList<AdminBoard>();
		noticeList=ad.selectNoticeList(sqlSession);
		
		return noticeList;
	}

	//공지사항 상세보기용
	@Override
	public AdminBoard selectNotice(int num) throws AdminSelectException, AdminCountException {
		AdminBoard notice=new AdminBoard();

		//조회수 증가
		int result=ad.updateBCount(sqlSession,num);
		
		System.out.println("조회수 증가 결과 : "+result);
		
		if(result>0) {
			notice=ad.selectNotice(sqlSession, num);
		}
		
		return notice;
	}

	//faq 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectFaqList() throws AdminSelectException {
		ArrayList<AdminBoard> faqList=new ArrayList<AdminBoard>();
		faqList=ad.selectFaqList(sqlSession);
		
		return faqList;
	}

	//qna 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectQnaList() throws AdminSelectException {
		ArrayList<AdminBoard> qnaList=new ArrayList<AdminBoard>();
		qnaList=ad.selectQnaList(sqlSession);
		
		return qnaList;
	}

	//qna 답변 대기 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectQnaWaitList() throws AdminSelectException {
		ArrayList<AdminBoard> qnaWaitList=new ArrayList<AdminBoard>();
		qnaWaitList=ad.selectQnaWaitList(sqlSession);
		
		return qnaWaitList;
	}

	//qna 답변 완료 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectQnaCompleteList() throws AdminSelectException {
		ArrayList<AdminBoard> qnaCompleteList=new ArrayList<AdminBoard>();
		qnaCompleteList=ad.selectQnaCompleteList(sqlSession);
		
		return qnaCompleteList;
	}

	//faq 상세보기용
	@Override
	public AdminBoard selectFaq(int num) throws AdminSelectException, AdminCountException {
		AdminBoard faq=new AdminBoard();

		//조회수 증가
		int result=ad.updateBCount(sqlSession,num);
		
		System.out.println("조회수 증가 결과 : "+result);
		
		if(result>0) {
			faq=ad.selectFaq(sqlSession, num);
		}
		
		return faq;
	}

	//qna 상세보기용
	@Override
	public AdminBoard selectQna(int num) throws AdminSelectException, AdminCountException {
		AdminBoard qna=new AdminBoard();

		//조회수 증가
		int result=ad.updateBCount(sqlSession,num);
		
		System.out.println("조회수 증가 결과 : "+result);
		
		if(result>0) {
			qna=ad.selectQna(sqlSession, num);
		}
		
		return qna;
	}

	@Override
	public AdminBoard selectAnswer(int num) throws AdminSelectException, AdminCountException {
		AdminBoard answer=new AdminBoard();
		answer=ad.selectAnswer(sqlSession, num);
		
		return answer;
	}

	//공지사항 작성용
	@Override
	public int insertNotice(AdminBoard notice) throws AdminInsertException {
		int result=ad.insertNotice(sqlSession, notice);
		return result;
	}

	//수정할 공지사항 조회용
	@Override
	public AdminBoard selectModNotice(int num) throws AdminSelectException {
		AdminBoard notice=new AdminBoard();
		notice=ad.selectModNotice(sqlSession, num);
		
		return notice;
	}

	//공지사항 수정용
	@Override
	public int updateNotice(AdminBoard notice) throws AdminUpdateException {
		int result=ad.updateNotice(sqlSession, notice);
		return result;
	}

	//공지사항 삭제용
	@Override
	public int deleteNotice(int num) throws AdminDeleteException {
		int result=ad.deleteNotice(sqlSession, num);
		return result;
	}

	//수정할 faq 조회용
	@Override
	public AdminBoard selectModFaq(int num) throws AdminSelectException {
		AdminBoard faq=new AdminBoard();
		faq=ad.selectModFaq(sqlSession, num);
		
		return faq;
	}

	//faq 수정용
	@Override
	public int updateFaq(AdminBoard faq) throws AdminUpdateException {
		int result=ad.updateFaq(sqlSession, faq);
		return result;
	}

	//faq 삭제용
	@Override
	public int deleteFaq(int num) throws AdminDeleteException {
		int result=ad.deleteFaq(sqlSession, num);
		return result;
	}

	@Override
	public int insertFaq(AdminBoard faq) throws AdminInsertException {
		int result=ad.insertFaq(sqlSession, faq);
		return result;
	}
	
	//qna 답변용
	@Override
	public int insertAnswer(AdminBoard answer) throws AdminInsertException, AdminUpdateException {
		int result1=0;
		int result2=0;
		int result=0;
		
		result1=ad.insertAnswer(sqlSession, answer);
		if(result1>0) {
			System.out.println("답변 등록 성공");
			result2=ad.updateQna(sqlSession, answer.getBoardRefNo());
		}
		if(result1>0 && result2>0) {
			result=1;
			System.out.println("질문 상태 변경 완료");
		}
		return result;
	}



}
