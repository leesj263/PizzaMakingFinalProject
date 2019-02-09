package com.kh.pmfp.admin.model.vo;

import java.sql.Date;

public class AdminBoard {
	
	private int boardNo;
	private int boardType;
	private int boardCate;
	private String boardTitle;
	private String boardContent;
	private int boardCount;
	private int memberNo;
	private String memberName;
	private String memberNickname;
	private Date boardDate;
	private int boardLevel;
	private int boardRefNo;
	private String boardStatus;
	private String boardAnswer;
	private int boardComNo;
	private int rn;
	
	public AdminBoard() {}

	public AdminBoard(int boardNo, int boardType, int boardCate, String boardTitle, String boardContent, int boardCount,
			int memberNo, String memberName, String memberNickname, Date boardDate, int boardLevel, int boardRefNo,
			String boardStatus, String boardAnswer, int boardComNo, int rn) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardCate = boardCate;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCount = boardCount;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.boardDate = boardDate;
		this.boardLevel = boardLevel;
		this.boardRefNo = boardRefNo;
		this.boardStatus = boardStatus;
		this.boardAnswer = boardAnswer;
		this.boardComNo = boardComNo;
		this.rn=rn;
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

	public int getBoardCate() {
		return boardCate;
	}

	public void setBoardCate(int boardCate) {
		this.boardCate = boardCate;
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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
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

	public int getBoardRefNo() {
		return boardRefNo;
	}

	public void setBoardRefNo(int boardRefNo) {
		this.boardRefNo = boardRefNo;
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

	public int getRn() {
		return rn;
	}
	
	public void setRn(int rn) {
		this.rn=rn;
	}
	
	@Override
	public String toString() {
		return "AdminBoard [boardNo=" + boardNo + ", boardType=" + boardType + ", boardCate=" + boardCate
				+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardCount=" + boardCount
				+ ", memberNo=" + memberNo + ", memberName=" + memberName + ", memberNickname=" + memberNickname
				+ ", boardDate=" + boardDate + ", boardLevel=" + boardLevel + ", boardRefNo=" + boardRefNo
				+ ", boardStatus=" + boardStatus + ", boardAnswer=" + boardAnswer + ", boardComNo=" + boardComNo + ", rn="+rn+"]";
	}
	
	
}
