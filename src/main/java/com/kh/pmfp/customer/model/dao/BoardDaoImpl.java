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

}
