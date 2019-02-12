package com.kh.pmfp.mypage.model.vo;

public class MyWriting implements java.io.Serializable{
	private int boardNo;
	private String boardTitle;
	private String boardAnswer;
	private String boardDate;
	private int boardType;
	private int memberNo;
	
	public MyWriting() {}
	
	public MyWriting(int boardNo, String boardTitle, String boardAnswer, String boardDate, int boardType, int memberNo) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardAnswer = boardAnswer;
		this.boardDate = boardDate;
		this.boardType = boardType;
		this.memberNo = memberNo;
	}

	public MyWriting(int boardNo, String boardTitle, String boardAnswer, String boardDate, int boardType) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardAnswer = boardAnswer;
		this.boardDate = boardDate;
		this.boardType = boardType;
	}
	
	public MyWriting(int boardNo, String boardTitle, String boardDate, int boardType) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardDate = boardDate;
		this.boardType = boardType;
	}
	
	public MyWriting(int memberNo,  int boardType) {
		super();
		this.memberNo = memberNo;
		this.boardType = boardType;
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

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	
	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "MyWriting [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardAnswer=" + boardAnswer
				+ ", boardDate=" + boardDate + ", boardType=" + boardType + ", memberNo=" + memberNo + "]";
	}

	

	
	
	
}