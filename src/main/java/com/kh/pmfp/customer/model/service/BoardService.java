package com.kh.pmfp.customer.model.service;

import java.util.ArrayList;

import com.kh.pmfp.customer.model.exception.BoardException;
import com.kh.pmfp.customer.model.vo.Board;

public interface BoardService {

	ArrayList<Board> selectfaqOrder() throws BoardException;

}
