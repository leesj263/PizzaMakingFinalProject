package com.kh.pmfp.customer.model.service;

import java.util.ArrayList;

import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.customer.model.exception.BoardException;
import com.kh.pmfp.customer.model.vo.Board;
import com.kh.pmfp.customer.model.vo.Image;

public interface BoardService {

	// faq상세보기
	ArrayList<Board> selectfaqOrder() throws BoardException;

	// qna작성하기
	int insertqna(Board qna) throws BoardException;

	// qna 수정하기 버튼눌렀을때
	int qnaUpdateC(Board qna) throws BoardException;

	// 수정 창 띄우기
	Board updateqna2(int boardNo) throws BoardException;

	// qna 글 수
	int selectQnaCount() throws BoardException;

	// qna페이징
	ArrayList<Board> selectqnaList(PageInfo pi) throws BoardException;

	// qna상세보기
	Board selectQna(int num) throws BoardException;

	// qna답변
	Board selectAnswer(int num) throws BoardException;

	// qna삭제
	int deleteqna(int boardNo) throws BoardException;

	/////////////
	
	
	// review 리스트
	ArrayList<Board> selectReviewList(PageInfo pi) throws BoardException;

	// review작성하기
	int insertReview(Board review, Image image) throws BoardException;

	// review상세보기
	Board selectReview(int num) throws BoardException;

	// review수정
	Board updateReview(int boardNo) throws BoardException;

	// review수정등록
	int reviewUpdateC(Board review) throws BoardException;

	// review 삭제
	int deleteReview(int boardNo) throws BoardException;

	ArrayList<Board> insertReply(Board review) throws BoardException;
	//댓글 불러오기
	ArrayList<Board> selectReviewReply(int num);

	

}
