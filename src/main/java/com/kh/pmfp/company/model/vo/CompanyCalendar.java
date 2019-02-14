package com.kh.pmfp.company.model.vo;

import java.sql.Date;

public class CompanyCalendar implements java.io.Serializable
{
	private int calendarNo;
	private int calendarCateg;
	private String calendarContent;
	private Date calendarDate;
	private int memberNo;
	
	public CompanyCalendar() {
		
	}

	public CompanyCalendar(int calendarNo, int calendarCateg, String calendarContent, Date calendarDate, int memberNo) {
		super();
		this.calendarNo = calendarNo;
		this.calendarCateg = calendarCateg;
		this.calendarContent = calendarContent;
		this.calendarDate = calendarDate;
		this.memberNo = memberNo;
	}

	public int getCalendarNo() {
		return calendarNo;
	}

	public void setCalendarNo(int calendarNo) {
		this.calendarNo = calendarNo;
	}

	public int getCalendarCateg() {
		return calendarCateg;
	}

	public void setCalendarCateg(int calendarCateg) {
		this.calendarCateg = calendarCateg;
	}

	public String getCalendarContent() {
		return calendarContent;
	}

	public void setCalendarContent(String calendarContent) {
		this.calendarContent = calendarContent;
	}

	public Date getCalendarDate() {
		return calendarDate;
	}

	public void setCalendarDate(Date calendarDate) {
		this.calendarDate = calendarDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "CompanyCalendar [calendarNo=" + calendarNo + ", calendarCateg=" + calendarCateg + ", calendarContent="
				+ calendarContent + ", calendarDate=" + calendarDate + ", memberNo=" + memberNo + "]";
	}
	
	
}
