package com.kh.pmfp.company.model.vo;

import java.sql.Date;

public class CompanyBoard implements java.io.Serializable{
	private int boardNo;
	private int boardType;
	private int boardCateG;
	private String boardTitle;
	private String boardContent;
	private int boardCount;
	private int memberNo;
	private Date boardDate;
	private int boardLevel;
	private int boardRefno;
	private String boardStatus;
	private String boardAnswer;
	private int boardComNo;
	private String memberName;
	
	public CompanyBoard() {
		
	}

	public CompanyBoard(int boardNo, int boardType, int boardCateG, String boardTitle, String boardContent,
			int boardCount, int memberNo, Date boardDate, int boardLevel, int boardRefno, String boardStatus,
			String boardAnswer, int boardComNo, String memberName) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardCateG = boardCateG;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCount = boardCount;
		this.memberNo = memberNo;
		this.boardDate = boardDate;
		this.boardLevel = boardLevel;
		this.boardRefno = boardRefno;
		this.boardStatus = boardStatus;
		this.boardAnswer = boardAnswer;
		this.boardComNo = boardComNo;
		this.memberName = memberName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public int getBoardCateG() {
		return boardCateG;
	}

	public void setBoardCateG(int boardCateG) {
		this.boardCateG = boardCateG;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardLevel() {
		return boardLevel;
	}

	public void setBoardLevel(int boardLevel) {
		this.boardLevel = boardLevel;
	}

	public int getBoardRefno() {
		return boardRefno;
	}

	public void setBoardRefno(int boardRefno) {
		this.boardRefno = boardRefno;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public String getBoardAnswer() {
		return boardAnswer;
	}

	public void setBoardAnswer(String boardAnswer) {
		this.boardAnswer = boardAnswer;
	}

	public int getBoardComNo() {
		return boardComNo;
	}

	public void setBoardComNo(int boardComNo) {
		this.boardComNo = boardComNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "CompanyBoard [boardNo=" + boardNo + ", boardType=" + boardType + ", boardCateG=" + boardCateG
				+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardCount=" + boardCount
				+ ", memberNo=" + memberNo + ", boardDate=" + boardDate + ", boardLevel=" + boardLevel + ", boardRefno="
				+ boardRefno + ", boardStatus=" + boardStatus + ", boardAnswer=" + boardAnswer + ", boardComNo="
				+ boardComNo + ", memberName=" + memberName + "]";
	}

	
	
	
	
	
}
