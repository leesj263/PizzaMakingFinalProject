package com.kh.pmfp.customer.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.customer.model.exception.BoardException;
import com.kh.pmfp.customer.model.vo.Board;

public interface BoardDao {
//faq불러오기
	ArrayList<Board> selectfaqOrder(SqlSessionTemplate sqlSession) throws BoardException;
//qna작성
	int insertqna(SqlSessionTemplate sqlSession, Board qna) throws BoardException;
//qna수정
	int updateqna(SqlSessionTemplate sqlSession, Board qna) throws BoardException;
	

}
