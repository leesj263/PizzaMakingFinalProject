package com.kh.pmfp.customer.model.service;

import java.util.ArrayList;

import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.customer.model.exception.BoardException;
import com.kh.pmfp.customer.model.vo.Board;

public interface BoardService {

	//faq상세보기
	ArrayList<Board> selectfaqOrder() throws BoardException;
	//qna작성하기
	int insertqna(Board qna) throws BoardException;
	//qna 수정하기
	int updateqna(Board qna) throws BoardException;
	//qna 글 수 
	int selectQnaCount() throws BoardException;
	//qna페이징
	ArrayList<Board> selectqnaList(PageInfo pi) throws BoardException;

	


}
