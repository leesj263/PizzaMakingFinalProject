package com.kh.pmfp.customer.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pmfp.customer.model.exception.BoardException;
import com.kh.pmfp.customer.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Override
	public ArrayList<Board> selectfaqOrder(SqlSessionTemplate sqlSession) throws BoardException {
		ArrayList<Board> selectfaqOrder= new ArrayList<Board>();
		selectfaqOrder= (ArrayList)sqlSession.selectList("Board.selectfaqOrder");
		if(selectfaqOrder==null) throw new BoardException("주문faq실패");
		return selectfaqOrder;
	}
//qna작성
	@Override
	public int insertqna(SqlSessionTemplate sqlSession, Board qna) throws BoardException {
		int result=0;
		result=sqlSession.insert("qna.insertqna", qna);
		
		if(result<=0) {
			throw new BoardException("qna 작성실패");
		}
		
		return result;
	}
//qna수정
	@Override
	public int updateqna(SqlSessionTemplate sqlSession, Board qna) throws BoardException {
		int result =0;
		result= sqlSession.update("qna.updateqna", qna);
		if(result<=0) {
			throw new BoardException("qna 수정실패");
		}
		return result;
	}

}
