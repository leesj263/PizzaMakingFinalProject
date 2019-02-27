package com.kh.pmfp.customer.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable {
	private int boardNo;
	private int boardType;
	private int boardCateg;
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
	private int rownum;

	private int imgNo;
	private int imgCateg;
	private String imgFilepath;
	private String imgOriginname;
	private String imgChangeName;
	private String imgStatus;

	public Board() {
	}

	public Board(int boardNo, int boardType, int boardCateg, String boardTitle, String boardContent, int boardCount,
			int memberNo, String memberName, String memberNickname, Date boardDate, int boardLevel, int boardRefNo,
			String boardStatus, String boardAnswer, int boardComNo, int rownum, int imgNo, int imgCateg,
			String imgFilepath, String imgOriginname, String imgChangeName, String imgStatus) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardCateg = boardCateg;
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
		this.rownum = rownum;
		this.imgNo = imgNo;
		this.imgCateg = imgCateg;
		this.imgFilepath = imgFilepath;
		this.imgOriginname = imgOriginname;
		this.imgChangeName = imgChangeName;
		this.imgStatus = imgStatus;
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

	public int getBoardCateg() {
		return boardCateg;
	}

	public void setBoardCateg(int boardCateg) {
		this.boardCateg = boardCateg;
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

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public int getImgCateg() {
		return imgCateg;
	}

	public void setImgCateg(int imgCateg) {
		this.imgCateg = imgCateg;
	}

	public String getImgFilepath() {
		return imgFilepath;
	}

	public void setImgFilepath(String imgFilepath) {
		this.imgFilepath = imgFilepath;
	}

	public String getImgOriginname() {
		return imgOriginname;
	}

	public void setImgOriginname(String imgOriginname) {
		this.imgOriginname = imgOriginname;
	}

	public String getImgChangeName() {
		return imgChangeName;
	}

	public void setImgChangeName(String imgChangeName) {
		this.imgChangeName = imgChangeName;
	}

	public String getImgStatus() {
		return imgStatus;
	}

	public void setImgStatus(String imgStatus) {
		this.imgStatus = imgStatus;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardType=" + boardType + ", boardCateg=" + boardCateg + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardCount=" + boardCount + ", memberNo="
				+ memberNo + ", memberName=" + memberName + ", memberNickname=" + memberNickname + ", boardDate="
				+ boardDate + ", boardLevel=" + boardLevel + ", boardRefNo=" + boardRefNo + ", boardStatus="
				+ boardStatus + ", boardAnswer=" + boardAnswer + ", boardComNo=" + boardComNo + ", rownum=" + rownum
				+ ", imgNo=" + imgNo + ", imgCateg=" + imgCateg + ", imgFilepath=" + imgFilepath + ", imgOriginname="
				+ imgOriginname + ", imgChangeName=" + imgChangeName + ", imgStatus=" + imgStatus + "]";
	}

	

}
