package com.kh.pmfp.customer.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.customer.model.exception.BoardException;
import com.kh.pmfp.customer.model.vo.Board;
import com.kh.pmfp.customer.model.vo.Image;

public interface BoardDao {
	// faq불러오기
	ArrayList<Board> selectfaqOrder(SqlSessionTemplate sqlSession) throws BoardException;

	// qna작성
	int insertqna(SqlSessionTemplate sqlSession, Board qna) throws BoardException;

	// qna수정
	Board updateqna2(SqlSessionTemplate sqlSession, int boardNo) throws BoardException;

	// 수정등록
	int qnaUpdateC(SqlSessionTemplate sqlSession, Board qna) throws BoardException;

	// qna 글 수
	int selectQnaCount(SqlSessionTemplate sqlSession) throws BoardException;

	// qna리스트
	ArrayList<Board> selectqnaList(SqlSessionTemplate sqlSession, PageInfo pi) throws BoardException;

	// qna상세보기조회
	Board selectQna(SqlSessionTemplate sqlSession, int num) throws BoardException;

	// qna 조회수 증가
	int updateBoardCount(SqlSessionTemplate sqlSession, int num) throws BoardException;

	// qna 삭제
	int deleteqna(SqlSessionTemplate sqlSession, int boardNo) throws BoardException;

	// qna답변
	Board selectAnswer(SqlSessionTemplate sqlSession, int num) throws BoardException;

	
	
	
	// review리스트
	ArrayList<Board> selectReviewList(SqlSessionTemplate sqlSession, PageInfo pi) throws BoardException;

	// review작성
	int insertReview(SqlSessionTemplate sqlSession, Board review) throws BoardException;

	// review 삭제
	int deleteReview(SqlSessionTemplate sqlSession, int boardNo) throws BoardException;

	// review수정
	Board updateReview(SqlSessionTemplate sqlSession, int boardNo) throws BoardException;

	// review수정등록
	int reviewUpdateC(SqlSessionTemplate sqlSession, Board review) throws BoardException;
	//review상세보기
	Board selectReview(SqlSessionTemplate sqlSession, int num) throws BoardException;

	
	
	
	
	
	
	//file등록
	int insertFile(SqlSessionTemplate sqlSession, Image image) throws BoardException;

	
	//리플등록
	int insertReply(SqlSessionTemplate sqlSession, Board review) throws BoardException;

	
//리플목록조회
	ArrayList<Board> selectReviewAnswerList(SqlSessionTemplate sqlSession, int boardNo);
	//댓글 목록
	ArrayList<Board> selectReviewReply(SqlSessionTemplate sqlSession, int num);

	

}
