package com.kh.pmfp.customer.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.vo.AdminBoard;
import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.customer.model.exception.BoardException;
import com.kh.pmfp.customer.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Override
	public ArrayList<Board> selectfaqOrder(SqlSessionTemplate sqlSession) throws BoardException {
		ArrayList<Board> selectfaqOrder = new ArrayList<Board>();
		selectfaqOrder = (ArrayList) sqlSession.selectList("Board.selectfaqOrder");
		if (selectfaqOrder == null)
			throw new BoardException("주문faq실패");
		return selectfaqOrder;
	}

	// qna작성
	@Override
	public int insertqna(SqlSessionTemplate sqlSession, Board qna) throws BoardException {
		int result = 0;
		result = sqlSession.insert("Board.insertqna", qna);

		if (result <= 0) {
			throw new BoardException("qna 작성실패");
		}

		return result;
	}

	
	// qna글 수
	@Override
	public int selectQnaCount(SqlSessionTemplate sqlSession) throws BoardException {
		int result = 0;
		result = sqlSession.selectOne("Board.selectQnaCount");
		if (result < 0) {
			throw new BoardException("공지사항 글 수 조회 실패");
		}
		return result;
	}

	// qna리스트 조회
	@Override
	public ArrayList<Board> selectqnaList(SqlSessionTemplate sqlSession, PageInfo pi) throws BoardException {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<Board> qnaList = new ArrayList<Board>();
		qnaList = (ArrayList) sqlSession.selectList("Board.selectqnaList", null, rowBounds);

		
			if (qnaList == null) {
				throw new BoardException("공지사항 목록 조회 실패");
			
		
		
	}
			return qnaList;
	}

	//qna상세보기
	@Override
	public Board selectQna(SqlSessionTemplate sqlSession, int num) throws BoardException {
		Board qna=new Board();
qna=sqlSession.selectOne("Board.selectQna", num);
		
		if(qna==null) {
			throw new BoardException("Q&A 상세조회 실패");
		}
		
		return qna;
	}
	
//조회수증가
	@Override
	public int updateBoardCount(SqlSessionTemplate sqlSession, int num) throws BoardException {
		int result=0;
		result=sqlSession.update("Board.updateBoardCount", num);
		
		if(result<=0) {
			throw new BoardException("조회수 증가 실패");
		}
		return result;
	}
//qna삭제
	@Override
	public int deleteqna(SqlSessionTemplate sqlSession, int boardNo) throws BoardException {
		int result=0;
		 result= sqlSession.update("Board.deleteqna",boardNo);
		 
		 if(result<=0) {
			 throw new BoardException("qna 삭제실패");
		 }
		 return result;
	}
	
//qna답변
	@Override
	public Board selectAnswer(SqlSessionTemplate sqlSession, int num) throws BoardException {
		Board answer= new Board();
		answer=sqlSession.selectOne("Board.selectAnswer", num);
		/*
		if(answer==null) {
			throw new BoardException("조회실패");
		}
		*/
		return answer;
	}
//qna 수정
	@Override
	public Board updateqna2(SqlSessionTemplate sqlSession, int boardNo) throws BoardException {
		return sqlSession.selectOne("Board.updateqna2", boardNo);
	}

	@Override
	public int qnaUpdateC(SqlSessionTemplate sqlSession, Board qna) throws BoardException {
		int result=0;
		 result= sqlSession.update("Board.qnaUpdateC",qna);
		
		if(result<=0) {
			throw new BoardException("수정실패");
		}
		return result;
	}

	

}
