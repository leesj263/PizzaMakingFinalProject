package com.kh.pmfp.company.model.service;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.apache.log4j.chainsaw.Main;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.stereotype.Component;

import com.kh.pmfp.company.controller.WebSocketChat;
import com.kh.pmfp.company.model.dao.CompanyDao;
import com.kh.pmfp.company.model.dao.CompanyDaoImpl;
import com.kh.pmfp.company.model.exception.FailChangeCalendarDate;
import com.kh.pmfp.company.model.exception.FailInsertEmployeeInfo;
import com.kh.pmfp.company.model.exception.FailInsertOrderStock;
import com.kh.pmfp.company.model.exception.FailSelectAdminMessage;
import com.kh.pmfp.company.model.exception.FailSelectCalendar;
import com.kh.pmfp.company.model.exception.FailSelectCompanyReview;
import com.kh.pmfp.company.model.exception.FailSelectCompanySales;
import com.kh.pmfp.company.model.exception.FailSelectDeliveryMan;
import com.kh.pmfp.company.model.exception.FailSelectEmployeeList;
import com.kh.pmfp.company.model.exception.FailSelectOrder;
import com.kh.pmfp.company.model.exception.FailSelectOrderStock;
import com.kh.pmfp.company.model.exception.FailUpdateDelivery;
import com.kh.pmfp.company.model.exception.FailUpdateEmployeeInfo;
import com.kh.pmfp.company.model.exception.FailUpdateOrderStatus;
import com.kh.pmfp.company.model.exception.FaileDetailMessage;
import com.kh.pmfp.company.model.vo.CompanyBoard;
import com.kh.pmfp.company.model.vo.CompanyCalendar;
import com.kh.pmfp.company.model.vo.CompanyEmployee;
import com.kh.pmfp.company.model.vo.CompanyMaterial;
import com.kh.pmfp.company.model.vo.CompanyOrder;
import com.kh.pmfp.company.model.vo.CompanyOrderStock;
import com.kh.pmfp.company.model.vo.CompanyRemainMaterial;
import com.kh.pmfp.company.model.vo.CompanySales;
import com.kh.pmfp.company.model.vo.CompanySalesList;



@Component
public class CompanyServiceImpl implements CompanyService{
	
	public static  SqlSessionTemplate temp;
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	
	
	
	
	
	
	@Autowired
	private CompanyDao cd;
	
	@Override
	public HashMap<String, ArrayList> selectAdminMessage(int memberNo) throws FailSelectAdminMessage {
		// TODO Auto-generated method stub
		HashMap<String, ArrayList> hmap = new HashMap<String, ArrayList>();
		hmap = cd.selectAdminMessage(sqlSession, memberNo);
		
		temp = sqlSession;
		return hmap;
	}

	@Override
	public CompanyBoard detailAdminMessage(int boardNo) throws FaileDetailMessage {
		// TODO Auto-generated method stub
		CompanyBoard detailMessage = cd.detailAdminMessage(sqlSession,boardNo);
		temp = sqlSession;
		return detailMessage;
	}

	@Override
	public ArrayList<CompanyOrder> orderWaiting(int comNo) throws FailSelectOrder {
		// TODO Auto-generated method stub
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = cd.orderWaiting(sqlSession, comNo);

		temp = sqlSession;
		return list;
	}

	@Override
	public ArrayList<CompanyOrder> orderMaking(int comNo) throws FailSelectOrder {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = cd.orderMaking(sqlSession, comNo);

		temp = sqlSession;
		return list;
	}

	@Override
	public ArrayList<CompanyOrder> orderDelivering(int comNo) throws FailSelectOrder {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		System.out.println("사이트에서  orderDelivering 조회시 sqlSession : " + sqlSession);
		list = cd.orderDelivering(sqlSession, comNo);
		
		temp = sqlSession;
		return list;
	}

	@Override
	public ArrayList<CompanyOrder> orderComplete(int comNo) throws FailSelectOrder {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = cd.orderComplete(sqlSession, comNo);

		temp = sqlSession;
		return list;
	}
	
	@Override
	public ArrayList<CompanyOrder> orderRefuseList(int comNo) throws FailSelectOrder {
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		list = cd.orderRefuseList(sqlSession, comNo);

		temp = sqlSession;
		return list;
	}
	
	
	

	@Override
	public int acceptOrder(CompanySales comsales) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = cd.acceptOrder(sqlSession, comsales);
		temp = sqlSession;
		return result;
	}

	@Override
	public int refuseOrder(int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = cd.refuseOrder(sqlSession, orderNoInt);
		temp = sqlSession;
		return result;
	}

	@Override
	public ArrayList<CompanyEmployee> remainDeliveryMan(int comNo) throws FailSelectDeliveryMan {
		// TODO Auto-generated method stub
		ArrayList<CompanyEmployee> list = new ArrayList<CompanyEmployee>();
		list = cd.remainDeliveryMan(sqlSession, comNo);
		
		temp = sqlSession;
		return list;
	}

	@Override
	public int deliveryManUpdateM(int orderNoInt, int empNoInt) throws FailUpdateDelivery {
		// TODO Auto-generated method stub
		int deliveryManUpdate = cd.deliveryManUpdateM(sqlSession, orderNoInt, empNoInt);
		temp = sqlSession;
		return deliveryManUpdate;
	}

	@Override
	public int orderUpdateM(int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int orderUpdate = cd.orderUpdateM(sqlSession, orderNoInt);
		temp = sqlSession;
		return orderUpdate;
	}

	@Override
	public int orderUpdateToComplete(int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = cd.orderUpdateToComplete(sqlSession, orderNoInt);
		temp = sqlSession;
		return result;
	}

	@Override
	public int orderUpdateToDelete(int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = cd.orderUpdateToDelete(sqlSession, orderNoInt);
		temp = sqlSession;
		return result;
	}

	@Override
	public int refuseListDelete(int orderNoInt) throws FailUpdateOrderStatus {
		// TODO Auto-generated method stub
		int result = cd.refuseListDelete(sqlSession, orderNoInt);
		temp = sqlSession;
		return result;
	}

	@Override
	public ArrayList<CompanyEmployee> selectEmployeeList(int comNo) throws FailSelectEmployeeList {
		// TODO Auto-generated method stub
		ArrayList<CompanyEmployee> list = new ArrayList<CompanyEmployee>();
		list = cd.selectEmployeeList(sqlSession, comNo);
		temp = sqlSession;
		return list;
	}

	@Override
	public int inputEmployeeInfo(CompanyEmployee ce) throws FailInsertEmployeeInfo {
		// TODO Auto-generated method stub
		int result = cd.inputEmployeeInfo(sqlSession, ce);
		temp = sqlSession;
		return result;
	}

	@Override
	public int deleteEmployeeInfo(ArrayList<Integer> list) throws FailUpdateEmployeeInfo {
		// TODO Auto-generated method stub
		int result = cd.deleteEmployeeInfo(sqlSession, list);
		temp = sqlSession;
		return result;
	}

	@Override
	public ArrayList<CompanyBoard> selectCompanyReview(int comNo) throws FailSelectCompanyReview {
		// TODO Auto-generated method stub
		ArrayList<CompanyBoard> list = new ArrayList<CompanyBoard>();
		list = cd.selectCompanyReview(sqlSession, comNo);
		temp = sqlSession;
		return list;
	}

	@Override
	public ArrayList<CompanyMaterial> orderStrok() throws FailSelectOrderStock {
		// TODO Auto-generated method stub
		ArrayList<CompanyMaterial> list = new ArrayList<CompanyMaterial>();
		list = cd.orderStrok(sqlSession);
		temp = sqlSession;
		return list;
	}

	@Override
	public int applyStock(ArrayList<CompanyOrderStock> list) throws FailInsertOrderStock {
		// TODO Auto-generated method stub
		int result = cd.applyStock(sqlSession, list);
		temp = sqlSession;
		return result;
	}

	@Override
	public ArrayList<CompanyOrderStock> selectOrderStockList(int comNo) throws FailSelectOrderStock {
		// TODO Auto-generated method stub
		ArrayList<CompanyOrderStock> list = new ArrayList<CompanyOrderStock>();
		list = cd.selectOrderStockList(sqlSession, comNo);
		temp = sqlSession;
		return list;
	}

	@Override
	public int receiptConfirm(ArrayList<Integer> orderMno) throws FailInsertOrderStock {
		// TODO Auto-generated method stub
		int result = cd.receiptConfirm(sqlSession, orderMno);
		temp = sqlSession;
		return result;
	}

	@Override
	public ArrayList<CompanyOrderStock> selectReceiptList(int comNo) throws FailSelectOrderStock {
		// TODO Auto-generated method stub
		ArrayList<CompanyOrderStock> list = new ArrayList<CompanyOrderStock>();
		list = cd.selectReceiptList(sqlSession, comNo);
		temp = sqlSession;
		return list;
	}

	@Override
	public ArrayList<CompanyRemainMaterial> selectAllMaterialList(int comNo) throws FailSelectOrderStock {
		// TODO Auto-generated method stub
		ArrayList<CompanyRemainMaterial> list = new ArrayList<CompanyRemainMaterial>();
		list = cd.selectAllMaterialList(sqlSession, comNo);
		temp = sqlSession;
		return list;
	}

	@Override
	public ArrayList<CompanySales> selectAllCompanySales(int comNo) throws FailSelectCompanySales {
		// TODO Auto-generated method stub
		ArrayList<CompanySales> list = new ArrayList<CompanySales>();
		list = cd.selectAllCompanySales(sqlSession, comNo);
		temp = sqlSession;
		return list;
	}
	
	@Override
	public HashMap<String, ArrayList<CompanySalesList>> selectCompanySalesList(int comNo) throws FailSelectCompanySales {
		// TODO Auto-generated method stub
		HashMap<String, ArrayList<CompanySalesList>> hmap = new HashMap<String, ArrayList<CompanySalesList>>();
		hmap = cd.selectCompanySalesList(sqlSession, comNo);
		temp = sqlSession;
		return hmap;
	}

	@Override
	public ArrayList<CompanyCalendar> calendarDetail(CompanyCalendar cc) throws FailSelectCalendar {
		// TODO Auto-generated method stub
		ArrayList<CompanyCalendar> list = new ArrayList<CompanyCalendar>();
		list = cd.calendarDetail(sqlSession, cc);
		temp = sqlSession;
		return list;
	}

	@Override
	public int insertCalendarData(CompanyCalendar cc) throws FailChangeCalendarDate {
		// TODO Auto-generated method stub
		int result = cd.insertCalendarData(sqlSession, cc);
		temp = sqlSession;
		return result;
	}

	@Override
	public int deleteCalendarData(CompanyCalendar cc) throws FailChangeCalendarDate {
		// TODO Auto-generated method stub
		int result = cd.deleteCalendarData(sqlSession, cc);
		temp = sqlSession;
		return result;
	}

	@Override
	public int reflectModify(CompanyCalendar cc) throws FailChangeCalendarDate {
		// TODO Auto-generated method stub
		int result = cd.reflectModify(sqlSession, cc);
		temp = sqlSession;
		return result;
	}
	
	

	
	
	@Override
	public ArrayList<CompanyOrder> orderDeliveringSocket(int comNo) throws Exception {
		System.out.println("service에서의 comNo : " + comNo);
		System.out.println("service에서의 sqlSession2 : " + sqlSession);
		ArrayList<CompanyOrder> list = new ArrayList<CompanyOrder>();
		CompanyDao cd = new CompanyDaoImpl();
		
		/*String resource = "/mybatis-config.xml";
		Properties props = new Properties();

		props.put("driverClassName", "oracle.jdbc.driver.OracleDriver");
		props.put("url", "jdbc:oracle:thin:@localhost:1521:xe");
		props.put("username", "pizza");
		props.put("password", "pizza");
		props.put("defaultAutoCommit", false);

		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream,props);
		SqlSessionTemplate sst = new SqlSessionTemplate(sqlSessionFactory);
		CompanyDao cd = new CompanyDaoImpl();
		System.out.println("sst : " + sst);*/
		
		
		/*String resource = "/mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		System.out.println("sqlSessionFactory : " + sqlSessionFactory);
		SqlSession sqlSessionEx = sqlSessionFactory.openSession();
		
		System.out.println("sqlSessionEx : " + sqlSessionEx);
		*/
		System.out.println("temp : " + temp);
		list = cd.orderDelivering(temp, comNo);
		
		
		return list;
	}

/*	@Override
	public ArrayList<CompanyCalendar> selectMemberCalendar(int memberNo) throws FailSelectCalendar {
		// TODO Auto-generated method stub
		ArrayList<CompanyCalendar> list = new ArrayList<CompanyCalendar>();
		list = cd.selectMemberCalendar(sqlSession, memberNo);
		
		return list;
	}*/
	
	
/*	
 * String resource = "/mybatis-config.xml";
 * String resource = getClass().getResource("/root-context.xml").toString();
	String resource = "com/kh/pmfp/company/mybatis-config.xml";
	
	SqlSession sqlSessionEx;
	Properties props = new Properties();

	props.put("driverClassName", "oracle.jdbc.driver.OracleDriver");
	props.put("url", "jdbc:oracle:thin:@localhost:1521:xe");
	props.put("username", "pizza");
	props.put("password", "pizza");
	props.put("defaultAutoCommit", false);

	InputStream inputStream = Resources.getResourceAsStream(resource);
	SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream,props);
	//System.out.println("webSocket에서 sqlSession : " + sqlSessionEx);
	sqlSessionEx = sqlSessionFactory.openSession(false);
	
	
	
	
	
	//////////////////////////////////////////////

	  String resource = "com/kh/pmfp/company/mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession sqlSessionEx = sqlSessionFactory.openSession();
	
	
	
	
	
	
	
	
	
	
	
	
	*/
	
	
	
	
	
	
	
	
	
	
	
}
