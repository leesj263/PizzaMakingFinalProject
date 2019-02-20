package com.kh.pmfp.customer.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.customer.model.exception.BoardException;
import com.kh.pmfp.customer.model.vo.Board;

public interface BoardDao {
//faq불러오기
	ArrayList<Board> selectfaqOrder(SqlSessionTemplate sqlSession) throws BoardException;
//qna작성
	int insertqna(SqlSessionTemplate sqlSession, Board qna) throws BoardException;
//qna수정
	
	Board updateqna2(SqlSessionTemplate sqlSession, int boardNo) throws BoardException;
	//qna 글 수
	int selectQnaCount(SqlSessionTemplate sqlSession) throws BoardException;
//qna리스트 
	ArrayList<Board> selectqnaList(SqlSessionTemplate sqlSession, PageInfo pi) throws BoardException;
//qna상세보기조회
	Board selectQna(SqlSessionTemplate sqlSession, int num) throws BoardException;
//qna 조회수 증가
	int updateBoardCount(SqlSessionTemplate sqlSession, int num) throws BoardException;
//qna 삭제
	int deleteqna(SqlSessionTemplate sqlSession, int boardNo) throws BoardException;
//qna답변
	Board selectAnswer(SqlSessionTemplate sqlSession, int num) throws BoardException;
	//수정등록
	int qnaUpdateC(SqlSessionTemplate sqlSession, Board qna) throws BoardException;
	
	
	

}
