package com.kh.pmfp.customer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pmfp.admin.model.vo.AdminBoard;
import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.customer.model.dao.BoardDao;
import com.kh.pmfp.customer.model.exception.BoardException;
import com.kh.pmfp.customer.model.vo.Board;

@Service 
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BoardDao bd;
	
	@Override
	public ArrayList<Board> selectfaqOrder() throws BoardException {
		ArrayList<Board> selectfaqOrder=new ArrayList<Board>();
		selectfaqOrder = bd.selectfaqOrder(sqlSession);
		return selectfaqOrder;
	}
//qna작성
	@Override
	public int insertqna(Board qna) throws BoardException {
		int result=bd.insertqna(sqlSession, qna);
		return result;
	}

	
//qna 리스트 글 수
	@Override
	public int selectQnaCount() throws BoardException {
		int result=0;
		result=bd.selectQnaCount(sqlSession);
		return result;
	}
//qna 리스트조회
	@Override
	public ArrayList<Board> selectqnaList(PageInfo pi) throws BoardException {
		ArrayList<Board> qnaList=new ArrayList<Board>();
		qnaList=bd.selectqnaList(sqlSession, pi);
		
		return qnaList;
	}
//qna 상세조회
	@Override
	public Board selectQna(int num) throws BoardException {
		Board qna=new Board();

		//조회수 증가
		int result=bd.updateBoardCount(sqlSession,num);
		
		System.out.println("조회수 증가 결과 : "+result);
		
		if(result>0) {
			qna=bd.selectQna(sqlSession, num);
		}
		
		return qna;
	}
	//qna답변
	@Override
	public Board selectAnswer(int num) throws BoardException {
		Board answer= new Board();
		answer=bd.selectAnswer(sqlSession, num);
		return answer;
	}
	//qna삭제
	@Override
	public int deleteqna(int boardNo) throws BoardException {
		int result = bd.deleteqna(sqlSession, boardNo);
		return result;
	}
	//수정
	@Override
	public Board updateqna2(int boardNo) throws BoardException {
		
		return bd.updateqna2(sqlSession, boardNo);
	}
	@Override
	public int qnaUpdateC(Board qna) throws BoardException {
		int result= bd.qnaUpdateC(sqlSession, qna);
		return result;
	}
	
	
	
		

}
