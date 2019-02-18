package com.kh.pmfp.customer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
//qna 수정
	@Override
	public int updateqna(Board qna) throws BoardException {
		int result=bd.updateqna(sqlSession, qna);
		return result;
	}
//qna 리스트조회
	@Override
	public int selectQnaCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
