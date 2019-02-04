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
	
	public CompanyBoard() {
		
	}
	
	public CompanyBoard(int boardNo, int boardType, int boardCateG, String boardTitle, String boardContent, int boardCount,
			int memberNo, Date boardDate, int boardLevel, int boardRefno, String boardStatus) {
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

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardType=" + boardType + ", boardCateG=" + boardCateG + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardCount=" + boardCount + ", memberNo="
				+ memberNo + ", boardDate=" + boardDate + ", boardLevel=" + boardLevel + ", boardRefno=" + boardRefno
				+ ", boardStatus=" + boardStatus + "]";
	}
	
	
	
	
	
}
