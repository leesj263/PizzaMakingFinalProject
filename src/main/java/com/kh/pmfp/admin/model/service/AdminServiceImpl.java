package com.kh.pmfp.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pmfp.admin.model.dao.AdminDao;
import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminDeleteException;
import com.kh.pmfp.admin.model.exception.AdminInsertException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.exception.AdminUpdateException;
import com.kh.pmfp.admin.model.vo.AdminBoard;
import com.kh.pmfp.admin.model.vo.AdminCalculate;
import com.kh.pmfp.admin.model.vo.AdminCalculateList;
import com.kh.pmfp.admin.model.vo.AdminMSales;
import com.kh.pmfp.admin.model.vo.AdminMaterial;
import com.kh.pmfp.admin.model.vo.AdminMember;
import com.kh.pmfp.admin.model.vo.AdminMenu;
import com.kh.pmfp.admin.model.vo.AdminOrder;
import com.kh.pmfp.admin.model.vo.AdminOrderMenu;
import com.kh.pmfp.admin.model.vo.AdminSales;
import com.kh.pmfp.admin.model.vo.AdminSeller;
import com.kh.pmfp.admin.model.vo.AdminSellerOrder;
import com.kh.pmfp.admin.model.vo.AdminSellerOrderList;
import com.kh.pmfp.common.model.vo.PageInfo;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDao ad;

	//회원 페이징 -카운트 조회용
	@Override
	public int selectUserCount(AdminMember member) throws AdminCountException {
		int listCount=ad.selectUserCount(sqlSession, member);
		return listCount;
	}

	//회원 목록 조회용
	@Override
	public ArrayList<AdminMember> selectUserList(PageInfo pi) throws AdminSelectException {
		
		ArrayList<AdminMember> userList=ad.selectUserList(sqlSession, pi);
		
		return userList;
	}

	//회원 상세조회용
	@Override
	public AdminMember selectUser(int num) throws AdminSelectException {
		AdminMember am=new AdminMember();
		am=ad.selectUser(sqlSession, num);
		
		return am;
	}

	//회원 주문 목록 조회용
	@Override
	public ArrayList<AdminOrder> selectUserOrder(int num) throws AdminSelectException {
		ArrayList<AdminOrder> orderList=ad.selectOrderList(sqlSession, num);
		
		return orderList;
	}

	//업체 목록 조회용
	@Override
	public ArrayList<AdminSeller> selectSellerList(PageInfo pi) throws AdminSelectException {
		ArrayList<AdminSeller> sellerList=ad.selectSellerList(sqlSession, pi);
		return sellerList;
	}
	
	//승인 대기 목록 조회용
	@Override
	public ArrayList<AdminSeller> selectWaitSeller() throws AdminSelectException {
		ArrayList<AdminSeller> waitSeller=ad.selectWaitSeller(sqlSession);
		
		return waitSeller;
	}

	//업체 상세조회용
	@Override
	public AdminSeller selectSeller(int num) throws AdminSelectException {
		AdminSeller seller=new AdminSeller();
		seller=ad.selectSeller(sqlSession, num);
		
		return seller;
	}
	
	//업체별 주문횟수 카운트용
	@Override
	public int selectEachSellerOrderCount(int num) throws AdminCountException {
		int result=0;
		result=ad.selectEachSellerOrderCount(sqlSession, num);
		return result;
	}
	
	//업체 상세보기 - 업체 주문 조회용
	@Override
	public ArrayList<AdminSellerOrderList> selectEachSellerOrderList(int num, PageInfo pi) throws AdminSelectException {
		ArrayList<AdminSellerOrderList> orderList=new ArrayList<AdminSellerOrderList>();
		orderList=ad.selectEachSellerOrderList(sqlSession, num, pi);
		return orderList;
	}
	//공지사항 글 수
	@Override
	public int selectNoticeCount() throws AdminCountException {
		int result=0;
		result=ad.selectNoticeCount(sqlSession);
		return result;
	}
	

	//공지사항 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectNoticeList(PageInfo pi) throws AdminSelectException {
		ArrayList<AdminBoard> noticeList=new ArrayList<AdminBoard>();
		noticeList=ad.selectNoticeList(sqlSession, pi);
		
		return noticeList;
	}

	//공지사항 상세보기용
	@Override
	public AdminBoard selectNotice(int num) throws AdminSelectException, AdminCountException {
		AdminBoard notice=new AdminBoard();

		//조회수 증가
		int result=ad.updateBCount(sqlSession,num);
		
		System.out.println("조회수 증가 결과 : "+result);
		
		if(result>0) {
			notice=ad.selectNotice(sqlSession, num);
		}
		
		return notice;
	}

	//faq 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectFaqList() throws AdminSelectException {
		ArrayList<AdminBoard> faqList=new ArrayList<AdminBoard>();
		faqList=ad.selectFaqList(sqlSession);
		
		return faqList;
	}
	
	//QNA 글수
	@Override
	public int selectQnaCount() throws AdminCountException {
		int result=0;
		result=ad.selectQnaCount(sqlSession);
		return result;
	}

	//qna 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectQnaList(PageInfo pi) throws AdminSelectException {
		ArrayList<AdminBoard> qnaList=new ArrayList<AdminBoard>();
		qnaList=ad.selectQnaList(sqlSession, pi);
		
		return qnaList;
	}
	
	//Qna 답변대기중 글수
	@Override
	public int selectQnaWaitCount() throws AdminCountException {
		int result=0;
		result=ad.selectQnaWaitCount(sqlSession);
		return result;
	}

	//qna 답변 대기 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectQnaWaitList(PageInfo pi) throws AdminSelectException {
		ArrayList<AdminBoard> qnaWaitList=new ArrayList<AdminBoard>();
		qnaWaitList=ad.selectQnaWaitList(sqlSession, pi);
		
		return qnaWaitList;
	}

	//Qna 답변완료 글수
	@Override
	public int selectQnaCompleteCount() throws AdminCountException {
		int result=0;
		result=ad.selectQnaCompleteCount(sqlSession);
		return result;
	}

	//qna 답변 완료 목록 조회용
	@Override
	public ArrayList<AdminBoard> selectQnaCompleteList(PageInfo pi) throws AdminSelectException {
		ArrayList<AdminBoard> qnaCompleteList=new ArrayList<AdminBoard>();
		qnaCompleteList=ad.selectQnaCompleteList(sqlSession, pi);
		
		return qnaCompleteList;
	}

	//faq 상세보기용
	@Override
	public AdminBoard selectFaq(int num) throws AdminSelectException, AdminCountException {
		AdminBoard faq=new AdminBoard();

		//조회수 증가
		int result=ad.updateBCount(sqlSession,num);
		
		System.out.println("조회수 증가 결과 : "+result);
		
		if(result>0) {
			faq=ad.selectFaq(sqlSession, num);
		}
		
		return faq;
	}

	//qna 상세보기용
	@Override
	public AdminBoard selectQna(int num) throws AdminSelectException, AdminCountException {
		AdminBoard qna=new AdminBoard();

		//조회수 증가
		int result=ad.updateBCount(sqlSession,num);
		
		System.out.println("조회수 증가 결과 : "+result);
		
		if(result>0) {
			qna=ad.selectQna(sqlSession, num);
		}
		
		return qna;
	}

	//Q&A 답변 선택
	@Override
	public AdminBoard selectAnswer(int num) throws AdminSelectException, AdminCountException {
		AdminBoard answer=new AdminBoard();
		answer=ad.selectAnswer(sqlSession, num);
		
		return answer;
	}

	//공지사항 작성용
	@Override
	public int insertNotice(AdminBoard notice) throws AdminInsertException {
		int result=ad.insertNotice(sqlSession, notice);
		return result;
	}

	//수정할 공지사항 조회용
	@Override
	public AdminBoard selectModNotice(int num) throws AdminSelectException {
		AdminBoard notice=new AdminBoard();
		notice=ad.selectModNotice(sqlSession, num);
		
		return notice;
	}

	//공지사항 수정용
	@Override
	public int updateNotice(AdminBoard notice) throws AdminUpdateException {
		int result=ad.updateNotice(sqlSession, notice);
		return result;
	}

	//공지사항 삭제용
	@Override
	public int deleteNotice(int num) throws AdminDeleteException {
		int result=ad.deleteNotice(sqlSession, num);
		return result;
	}

	//수정할 faq 조회용
	@Override
	public AdminBoard selectModFaq(int num) throws AdminSelectException {
		AdminBoard faq=new AdminBoard();
		faq=ad.selectModFaq(sqlSession, num);
		
		return faq;
	}

	//faq 수정용
	@Override
	public int updateFaq(AdminBoard faq) throws AdminUpdateException {
		int result=ad.updateFaq(sqlSession, faq);
		return result;
	}

	//faq 삭제용
	@Override
	public int deleteFaq(int num) throws AdminDeleteException {
		int result=ad.deleteFaq(sqlSession, num);
		return result;
	}

	//faq 작성용
	@Override
	public int insertFaq(AdminBoard faq) throws AdminInsertException {
		int result=ad.insertFaq(sqlSession, faq);
		return result;
	}
	
	//qna 답변용
	@Override
	public int insertAnswer(AdminBoard answer) throws AdminInsertException, AdminUpdateException {
		int result1=0;
		int result2=0;
		int result=0;
		
		result1=ad.insertAnswer(sqlSession, answer);
		if(result1>0) {
			System.out.println("답변 등록 성공");
			result2=ad.updateQna(sqlSession, answer.getBoardRefNo());
		}
		if(result1>0 && result2>0) {
			result=1;
			System.out.println("질문 상태 변경 완료");
		}
		return result;
	}

	//업체 주문 수 확인용
	@Override
	public int selectSellerOrderCount() throws AdminCountException {
		int listCount=ad.selectSellerOrderCount(sqlSession);
		return listCount;
	}

	//업체 주문 목록 조회용
	@Override
	public ArrayList<AdminSellerOrderList> selectSellerOrderList(PageInfo pi) throws AdminSelectException {
		ArrayList<AdminSellerOrderList> orderList=new ArrayList<AdminSellerOrderList>();
		orderList=ad.selectSellerOrderList(sqlSession, pi);
		return orderList;
	}

	//업체 주문 상세 조회용
	@Override
	public ArrayList<AdminSellerOrder> selectSellerOrder(AdminSellerOrderList orderList) throws AdminSelectException {
		ArrayList<AdminSellerOrder> order=new ArrayList<AdminSellerOrder>();
		order=ad.selectSellerOrder(sqlSession, orderList);
		
		return order;
	}

	//재료(토핑) 페이징- 게시글 수 확인용
	@Override
	public int selectMatCount() throws AdminCountException {
		int listCount=ad.selectMatCount(sqlSession);
		return listCount;
	}

	//재료 목록 조회용
	@Override
	public ArrayList<AdminMaterial> selectMaterialList(PageInfo pi) throws AdminSelectException {
		ArrayList<AdminMaterial> toppingList=new ArrayList<AdminMaterial>();
		toppingList=ad.selectMaterialList(sqlSession, pi);
		return toppingList;
	}

	//재료 상세보기용
	@Override
	public AdminMaterial selectMaterial(int materialNo) throws AdminSelectException, AdminCountException {
		AdminMaterial topping=new AdminMaterial();
		int ifMaterial=-1;
		ifMaterial=ad.selectIfMaterial(sqlSession, materialNo);
		if(ifMaterial==0) {			
			topping=ad.selectMaterial(sqlSession, materialNo);
		}else if(ifMaterial>0) {
			topping=ad.selectMaterialImg(sqlSession, materialNo);
		}
		
		return topping;
	}

	//토핑 수정용
	@Override
	public int updateMaterial(AdminMaterial topping) throws AdminUpdateException {
		int result=ad.updateMaterial(sqlSession, topping);
		System.out.println("service"+result);
		return result;
	}

	//토핑 판매중지용
	@Override
	public int deleteMaterial(int materialNo) throws AdminDeleteException {
		int result=ad.deleteMaterial(sqlSession, materialNo);
		return result;
	}

	//토핑 재판매용
	@Override
	public int resellMaterial(int materialNo) throws AdminUpdateException {
		int result=ad.resellMaterial(sqlSession, materialNo);
		return result;
	}

	//주문 수 카운트용
	@Override
	public int selectOrderCount() throws AdminCountException {
		int result=ad.selectOrderCount(sqlSession);
		return result;
	}

	//주문 목록 조회용
	@Override
	public ArrayList<AdminOrder> selectOrderList(PageInfo pi) throws AdminSelectException {
		ArrayList<AdminOrder> orderList=new ArrayList<AdminOrder>();
		orderList=ad.selectOrderList(sqlSession, pi);
		return orderList;
	}

	//주문 상세보기 용
	@Override
	public AdminOrder selectOrder(int orderNo) throws AdminSelectException {
		AdminOrder order=new AdminOrder();
		order=ad.selectOrder(sqlSession, orderNo);
		return order;
	}

	//주문 상세보기 용
	@Override
	public ArrayList<AdminOrderMenu> selectOrderMenu(int orderNo) throws AdminSelectException {
		ArrayList<AdminOrderMenu> menuList=new ArrayList<AdminOrderMenu>();
		menuList=ad.selectOrderMenu(sqlSession, orderNo);
		return menuList;
	}

	//정산 목록 전체 수
	@Override
	public int selectCalculateCount() throws AdminCountException {
		int result=ad.selectCalculateCount(sqlSession);
		return result;
	}

	//정산 목록 조회용
	@Override
	public ArrayList<AdminCalculateList> selectCalculateList(PageInfo pi) throws AdminSelectException {
		ArrayList<AdminCalculateList>	calList=new ArrayList<AdminCalculateList>();
		calList=ad.selectCalculateList(sqlSession, pi);
		return calList;
	}

	//정산 상세조회용
	@Override
	public ArrayList<AdminCalculate> selectCalculate(AdminCalculateList cal) throws AdminSelectException {
		ArrayList<AdminCalculate> calList=new ArrayList<AdminCalculate>();
		calList=ad.selectCalculate(sqlSession, cal);
		return calList;
	}

	//정산 완료 처리용 - 상세보기에서 ajax
	@Override
	public int updateCalculate(AdminCalculate cal) throws AdminUpdateException, AdminCountException {
		int listCount=ad.selectUpdateCalCount(sqlSession, cal);
		int result=ad.updateCalculate(sqlSession, cal);
		if(listCount==result) {
			result=1;
		}else {
			result=-1;
		}
		return result;
	}

	//기본 메뉴 개수 조회용
	@Override
	public int selectMenuCount() throws AdminCountException {
		int result=ad.selectMenuCount(sqlSession);
		return result;
	}

	//기본 메뉴 목록 조회용
	@Override
	public ArrayList<AdminMenu> selectMenuList(PageInfo pi) throws AdminSelectException {
		ArrayList<AdminMenu> menuList=new ArrayList<AdminMenu>();
		menuList=ad.selectMenuList(sqlSession, pi);
		return menuList;
	}

	//기본 메뉴 조회용
	@Override
	public AdminMenu selectMenu(int basicNo) throws AdminSelectException, AdminCountException {
		AdminMenu menu=new AdminMenu();
		int count=ad.selectMenuImgCount(sqlSession, basicNo);
		if(count==0) {
			menu=ad.selectMenu(sqlSession, basicNo);
		}else {
			menu=ad.selectMenuImg(sqlSession, basicNo);
		}
		return menu;
	}

	//기본 메뉴 상세 조회용
	@Override
	public ArrayList<AdminMenu> selectMenuDetail(int basicNo) throws AdminSelectException {
		ArrayList<AdminMenu> menuDetail=new ArrayList<AdminMenu>();
		menuDetail=ad.selectMenuDetail(sqlSession, basicNo);
		return menuDetail;
	}

	//업체 승인용 
	@Override
	public int confirmSeller(AdminSeller seller) throws AdminUpdateException {
		int result=ad.confirmSeller(sqlSession, seller);
		return result;
	}

	//업체 주문 업데이트용 - 목록  & 상세보기
	@Override
	public int sellerOrderApply(AdminSellerOrder order) throws AdminUpdateException, AdminCountException {
		int listCount=ad.selectsellerOrderApplyCount(sqlSession, order);
		int result=ad.sellerOrderApply(sqlSession, order);
		if(result==listCount) {
			result=1;
		}else {
			result=-1;
		}
		return result;
	}

	//일간 통계 출력용 - 주문/업체주문
	@Override
	public ArrayList<AdminSales> selectStatistics(AdminSales sales) throws AdminSelectException {
		ArrayList<AdminSales>  salesList=new ArrayList<AdminSales>();
		if(sales.getSalesCate()==1) {			
			salesList=ad.selectOrderStatistics(sqlSession, sales);
		}
		if(sales.getSalesCate()==0) {
			salesList=ad.selectComStatistics(sqlSession, sales);
		}
		
		return salesList;
	}

	//통계 출력용 업체 리스트
	@Override
	public ArrayList<AdminSeller> selectSellerList() throws AdminSelectException {
		return ad.selectSellerList(sqlSession);
	}

	//통계 출력용 --- 업체 통계
	@Override
	public ArrayList<AdminSales> selectComStatistics(AdminSales sales) throws AdminSelectException {
		ArrayList<AdminSales>  salesList=new ArrayList<AdminSales>();
		if(sales.getSalesCate()==1) {			
			if(sales.getComNo()==0) {
				salesList=ad.selectOrderTStat(sqlSession,sales);
			}else {
				salesList=ad.selectOrderStat(sqlSession, sales);
			}
		}
		if(sales.getSalesCate()==0) {
			if(sales.getComNo()==0) {
				salesList=ad.selectComTStat(sqlSession,sales);
			}else {
				salesList=ad.selectComStat(sqlSession, sales);
			}
		}
		
		return salesList;
	}

	//통계 출력용 토핑 리스트
	@Override
	public ArrayList<AdminMaterial> selectMaterialList(int materialCate) throws AdminSelectException {
		return ad.selectMaterialList(sqlSession, materialCate);
	}

	//통계 출력용 -- 토핑
	@Override
	public ArrayList<AdminMSales> selectOrderMStat(int materialCate) throws AdminSelectException {
		return ad.selectOrderMStat(sqlSession, materialCate);
	}

	

	
	


	
	

}
