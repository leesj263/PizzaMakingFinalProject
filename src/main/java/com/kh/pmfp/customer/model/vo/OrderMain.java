package com.kh.pmfp.customer.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class OrderMain implements java.io.Serializable {
	/*ORDER_NO	NUMBER(10,0)
	MEMBER_NO	NUMBER(10,0)
	ORDER_METHOD	NUMBER(1,0)
	ORDER_RECEIVER	NVARCHAR2(20 CHAR)
	ORDER_RTEL	VARCHAR2(13 BYTE)
	ORDER_DATE	DATE
	ORDER_RESERVETIME	DATE
	ORDER_PAYNO	VARCHAR2(50 BYTE)
	ORDER_PAYPRICE	NUMBER(10,0)
	ORDER_STATUS	NUMBER(1,0)
	DELIVERY_NO	NUMBER(10,0)
	EMP_NO	NUMBER(10,0)
	COM_NO	NUMBER(10,0)*/
	
	private int orderNo;
	private int memberNo;
	private int orderMethod;
	private String orderReceiver;
	private String orderRtel;
	private Date orderDate;
	private Date orderReservetime;
	private String orderPayno;
	private int orderPayprice;
	private int orderStatus;
	private int deliveryNo;
	private int empNo;
	private int comNo;
	
	public OrderMain() {}
	
	
}
