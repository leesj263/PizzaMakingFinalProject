package com.kh.pmfp.customer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pmfp.admin.model.vo.AdminBoard;
import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.customer.model.dao.BoardDao;
import com.kh.pmfp.customer.model.exception.BoardException;
import com.kh.pmfp.customer.model.vo.Board;
import com.kh.pmfp.customer.model.vo.Image;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BoardDao bd;

	@Override
	public ArrayList<Board> selectfaqOrder() throws BoardException {
		ArrayList<Board> selectfaqOrder = new ArrayList<Board>();
		selectfaqOrder = bd.selectfaqOrder(sqlSession);
		return selectfaqOrder;
	}

	// qna작성
	@Override
	public int insertqna(Board qna) throws BoardException {
		int result = bd.insertqna(sqlSession, qna);
		return result;
	}

	// qna 리스트 글 수
	@Override
	public int selectQnaCount() throws BoardException {
		int result = 0;
		result = bd.selectQnaCount(sqlSession);
		return result;
	}

	// qna 리스트조회
	@Override
	public ArrayList<Board> selectqnaList(PageInfo pi) throws BoardException {
		ArrayList<Board> qnaList = new ArrayList<Board>();
		qnaList = bd.selectqnaList(sqlSession, pi);

		return qnaList;
	}

	// qna 상세조회
	@Override
	public Board selectQna(int num) throws BoardException {
		Board qna = new Board();

		// 조회수 증가
		int result = bd.updateBoardCount(sqlSession, num);

		System.out.println("조회수 증가 결과 : " + result);

		if (result > 0) {
			qna = bd.selectQna(sqlSession, num);
		}

		return qna;

	}

	// review작성
	@Override
	public int insertReview(Board review,Image image) throws BoardException {
		int result = -1;
		int result1 = bd.insertReview(sqlSession, review);
		int result2 = -1;
		if (result1 > 0) {
			result2 = bd.insertFile(sqlSession, image);
				
		}
		if(result1>0&&result2>0) {
			result=1;
		}
			
		return result;
	}

	// qna답변
	@Override
	public Board selectAnswer(int num) throws BoardException {
		Board answer = new Board();
		answer = bd.selectAnswer(sqlSession, num);
		return answer;
	}

	// qna삭제
	@Override
	public int deleteqna(int boardNo) throws BoardException {
		int result = bd.deleteqna(sqlSession, boardNo);
		return result;
	}

	// qna수정
	@Override
	public Board updateqna2(int boardNo) throws BoardException {

		return bd.updateqna2(sqlSession, boardNo);
	}

	// qna수정등록
	@Override
	public int qnaUpdateC(Board qna) throws BoardException {
		int result = bd.qnaUpdateC(sqlSession, qna);
		return result;
	}

	// review리스트
	@Override
	public ArrayList<Board> selectReviewList(PageInfo pi) throws BoardException {
		ArrayList<Board> reviewList = new ArrayList<Board>();

		reviewList = bd.selectReviewList(sqlSession, pi);

		return reviewList;
	}

	// review상세보기
	@Override
	public Board selectReview(int num) throws BoardException {
		Board review = new Board();

		// 조회수 증가
		int result = bd.updateBoardCount(sqlSession, num);

		System.out.println("조회수 증가 결과 : " + result);

		if (result > 0) {
			review = bd.selectReview(sqlSession, num);
		}

		return review;
	}

	// 리뷰수정
	@Override
	public Board updateReview(int boardNo) throws BoardException {

		return bd.updateReview(sqlSession, boardNo);
	}

	
	// 리뷰수정등록
	@Override
	public int reviewUpdateC(Board review) throws BoardException {
		int result = bd.reviewUpdateC(sqlSession, review);
		return result;
	}
//리뷰삭제
	@Override
	public int deleteReview(int boardNo) throws BoardException {
		int result = bd.deleteReview(sqlSession, boardNo);
		return result;
	}

	



}
