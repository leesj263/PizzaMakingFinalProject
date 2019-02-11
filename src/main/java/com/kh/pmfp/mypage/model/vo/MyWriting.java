package com.kh.pmfp.mypage.model.vo;

import java.util.Date;

public class MyWriting implements java.io.Serializable{
	private int boardNo;
	private String boardTitle;
	private String boardAnswer;
	private String boardDate;
	
	public MyWriting() {}

	public MyWriting(int boardNo, String boardTitle, String boardAnswer, String boardDate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardAnswer = boardAnswer;
		this.boardDate = boardDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardAnswer() {
		return boardAnswer;
	}

	public void setBoardAnswer(String boardAnswer) {
		this.boardAnswer = boardAnswer;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	@Override
	public String toString() {
		return "MyWriting [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardAnswer=" + boardAnswer
				+ ", boardDate=" + boardDate + "]";
	}
	
	
}