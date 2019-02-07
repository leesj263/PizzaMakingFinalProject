package com.kh.pmfp.company.model.vo;

import java.sql.Date;

public class CompanyEmployee implements java.io.Serializable{
	private int employeeNo;
	private int companyNo;
	private String employeeRank;
	private String employeeName;
	private String employeePhone;
	private String employeeAddress;
	private String employeeStatus;
	private Date employeeDate;
	private String empDeliveryStatus;
	private int empDeliveryONo;
	
	public CompanyEmployee() {
		
	}

	public CompanyEmployee(int employeeNo, int companyNo, String employeeRank, String employeeName,
			String employeePhone, String employeeAddress, String employeeStatus, Date employeeDate,
			String empDeliveryStatus, int empDeliveryONo) {
		super();
		this.employeeNo = employeeNo;
		this.companyNo = companyNo;
		this.employeeRank = employeeRank;
		this.employeeName = employeeName;
		this.employeePhone = employeePhone;
		this.employeeAddress = employeeAddress;
		this.employeeStatus = employeeStatus;
		this.employeeDate = employeeDate;
		this.empDeliveryStatus = empDeliveryStatus;
		this.empDeliveryONo = empDeliveryONo;
	}

	public int getEmployeeNo() {
		return employeeNo;
	}

	public void setEmployeeNo(int employeeNo) {
		this.employeeNo = employeeNo;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getEmployeeRank() {
		return employeeRank;
	}

	public void setEmployeeRank(String employeeRank) {
		this.employeeRank = employeeRank;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getEmployeePhone() {
		return employeePhone;
	}

	public void setEmployeePhone(String employeePhone) {
		this.employeePhone = employeePhone;
	}

	public String getEmployeeAddress() {
		return employeeAddress;
	}

	public void setEmployeeAddress(String employeeAddress) {
		this.employeeAddress = employeeAddress;
	}

	public String getEmployeeStatus() {
		return employeeStatus;
	}

	public void setEmployeeStatus(String employeeStatus) {
		this.employeeStatus = employeeStatus;
	}

	public Date getEmployeeDate() {
		return employeeDate;
	}

	public void setEmployeeDate(Date employeeDate) {
		this.employeeDate = employeeDate;
	}

	public String getEmpDeliveryStatus() {
		return empDeliveryStatus;
	}

	public void setEmpDeliveryStatus(String empDeliveryStatus) {
		this.empDeliveryStatus = empDeliveryStatus;
	}

	public int getEmpDeliveryONo() {
		return empDeliveryONo;
	}

	public void setEmpDeliveryONo(int empDeliveryONo) {
		this.empDeliveryONo = empDeliveryONo;
	}

	@Override
	public String toString() {
		return "CompanyEmployee [employeeNo=" + employeeNo + ", companyNo=" + companyNo + ", employeeRank="
				+ employeeRank + ", employeeName=" + employeeName + ", employeePhone=" + employeePhone
				+ ", employeeAddress=" + employeeAddress + ", employeeStatus=" + employeeStatus + ", employeeDate="
				+ employeeDate + ", empDeliveryStatus=" + empDeliveryStatus + ", empDeliveryONo=" + empDeliveryONo
				+ "]";
	}
	
	
	
}
