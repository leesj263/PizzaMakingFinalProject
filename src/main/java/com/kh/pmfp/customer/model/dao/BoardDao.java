package com.kh.pmfp.customer.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.customer.model.exception.BoardException;
import com.kh.pmfp.customer.model.vo.Board;

public interface BoardDao {

	ArrayList<Board> selectfaqOrder(SqlSessionTemplate sqlSession) throws BoardException;

}
