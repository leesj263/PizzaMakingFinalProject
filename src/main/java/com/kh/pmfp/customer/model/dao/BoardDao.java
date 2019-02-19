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
	int updateqna(SqlSessionTemplate sqlSession, Board qna) throws BoardException;
//qna 글 수
	int selectQnaCount(SqlSessionTemplate sqlSession) throws BoardException;
//qna리스트 
	ArrayList<Board> selectqnaList(SqlSessionTemplate sqlSession, PageInfo pi) throws BoardException;
	

}
