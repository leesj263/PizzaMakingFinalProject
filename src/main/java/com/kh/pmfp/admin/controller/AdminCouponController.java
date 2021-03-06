package com.kh.pmfp.admin.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.service.AdminCouponService;
import com.kh.pmfp.admin.model.vo.AdminCoupon;
import com.kh.pmfp.admin.model.vo.AdminCoupon2;
import com.kh.pmfp.admin.model.vo.AdminCouponIssue;
import com.kh.pmfp.admin.model.vo.AdminCouponIssue2;
import com.kh.pmfp.common.model.vo.Member;
import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.common.model.vo.Pagination;


@Controller
public class AdminCouponController {
	
	@Autowired
	private AdminCouponService cs;
	
	//쿠폰 생성하기
	@RequestMapping("newCouponCreate.co")
	public String newCouponCreate(AdminCoupon2 coupon,HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("null이아니겠지?"+coupon);
		AdminCoupon couponCreate = new AdminCoupon();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONDAY, Integer.parseInt(coupon.getCouponEdateStr()));		
		Date date = new Date(cal.getTimeInMillis());
		
		//System.out.println("오늘 날짜 : "+sdf.format(cal.getTime()));
		//System.out.println("오늘 부터 한달 후 "+sdf.format(cal.getTime()));
		//System.out.println("이건 뭐징"+date);
		
		if(coupon.getCouponCategStr().equals("0")) {
			couponCreate.setCouponRdiscount((double)Integer.parseInt(coupon.getCouponRdiscountStr())/100.0);
			//System.out.println("할인율"+coupon.getCouponRdiscountStr());
		}else if(coupon.getCouponCategStr().equals("1")){
			couponCreate.setCouponPdiscount(Integer.parseInt(coupon.getCouponPdiscountStr()));
			//System.out.println("할인금액"+coupon.getCouponPdiscountStr());
		}
		couponCreate.setCouponName(coupon.getCouponName());
		couponCreate.setCouponCondition(Integer.parseInt(coupon.getCouponConditionStr()));
		couponCreate.setCouponCateg(Integer.parseInt(coupon.getCouponCategStr()));
		couponCreate.setCouponCondition(Integer.parseInt(coupon.getCouponConditionStr()));
		couponCreate.setCouponEdate(date);		
		//System.out.println(couponCreate);
		
		int result = cs.insertCreateCoupon(couponCreate);

		if(result>0	) {
			return "redirect:searchCoupon.co";			
		}else {
			return "common/errorPage";
		}
		
	}
	
	
	//생성된 쿠폰 목록 전체 조회
		@RequestMapping("searchCoupon.co")
		public String searchCoupon(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, HttpServletRequest request, HttpServletResponse response) throws AdminCountException {
			
			ArrayList<AdminCoupon> searchCouponList = new ArrayList<>();
			AdminCoupon coupon = new AdminCoupon();
			int couponListCount = cs.selectListCount(coupon);
			
			//System.out.println("전체 게시글 수"+couponListCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, couponListCount);
			
			//생성된 쿠폰 목록
			try {
				searchCouponList = cs.selectSearchCouponList(pi);
				//System.out.println("생성된 쿠폰 목록 :(controller) "+searchCouponList);
				request.setAttribute("searchCouponList", searchCouponList);
				request.setAttribute("pi", pi);
				return "admin/coupon/searchCoupon";
			} catch (AdminSelectException e) {
				request.setAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
			
			//return null;
		}
		
	//발급된 쿠폰 목록 전체 조회
		@RequestMapping("lssuingCouponManageMent.co")
		public String lssuingCoupon(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage,HttpServletRequest request,
				HttpServletResponse response) {
			
			ArrayList<AdminCouponIssue> issuingCouponAllList = new ArrayList<>();
			
			int issuingCouponCount = cs.selectIssuingCouponCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, issuingCouponCount);
			System.out.println(issuingCouponCount);
			System.out.println(pi);
			
			issuingCouponAllList=cs.selectIssuingCouponAllList(pi);
			request.setAttribute("issuingCouponAllList", issuingCouponAllList);
			request.setAttribute("pi", pi);
			System.out.println(issuingCouponAllList);
			return "admin/coupon/lssuingCouponManageMent";
		}
	
	//생성된 쿠폰 검색(이름, 내용)
	@RequestMapping("searchTwoCoupon.co")
	public String searchTwoCoupon(@RequestParam(value="currentPage",required=false,defaultValue="1")int currentPage,HttpServletRequest request,
						 HttpServletResponse response,@RequestParam String searchType,@RequestParam String searchContent) {
		System.out.println(searchType);
		System.out.println(searchContent);
		System.out.println(currentPage);
		//System.out.println();
		AdminCoupon coupon = new AdminCoupon();
		ArrayList<AdminCoupon> searchCouponList = new ArrayList<>();
		PageInfo pi =null;
		
		//1일때 쿠폰 내용 검색
		if(searchType.equals("1")) {	
			coupon.setCouponName(searchContent);
			int couponNameCount = cs.selectcouponNameCount(coupon);//페이징 숫자 받아오기
			pi = Pagination.getPageInfo(currentPage, couponNameCount);
			searchCouponList = cs.selectListCouponName(coupon,pi);
		//0일때 쿠폰 번호 검색
		}else if(searchType.equals("0")) {	
			coupon.setCouponNo(Integer.parseInt(searchContent));
			int couponCodeCount = cs.selectCouponCodeCount(coupon);
			pi = Pagination.getPageInfo(currentPage, couponCodeCount);
			searchCouponList = cs.selectListCouponCode(coupon,pi);
		}
		
		request.setAttribute("searchCouponListAll", searchCouponList);
		request.setAttribute("pi", pi);
		request.setAttribute("searchContent", searchContent);
		request.setAttribute("searchType", searchType);
		return "admin/coupon/searchCoupon2";
	}
	
	//발급쿠폰 검색(이름,내용)
	@RequestMapping("lssuingCouponSearch.co")
	public String lssuingCouponSearch(@RequestParam(value="currentPage",required=false,defaultValue="1")int currentPage,HttpServletRequest request,
			 HttpServletResponse response,@RequestParam String searchType,@RequestParam String searchContent) {
		//System.out.println(searchType+searchContent);
		if(searchType.equals("0")) {
			ArrayList<AdminCouponIssue2> list = new ArrayList<>();
			AdminCouponIssue2 coupon = new AdminCouponIssue2();
			coupon.setCouponNo(Integer.parseInt(searchContent));
			
			int count = cs.selectlssuingCouponCodeCount(coupon);
			PageInfo pi = Pagination.getPageInfo(currentPage, count);
			
			
			list=cs.selectIssuingCouponCode(coupon,pi);
			
			
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("searchContent", searchContent);
			request.setAttribute("searchType", searchType);
			
			//System.out.println(list);
			return "admin/coupon/lssuingCouponManageMent2";
		}else if(searchType.equals("1")) {
			ArrayList<AdminCouponIssue2> list = new ArrayList<>();
			AdminCouponIssue2 coupon = new AdminCouponIssue2();
			coupon.setCouponName(searchContent);
			System.out.println(coupon);
			
			int count = cs.selectlssuingCouponCodeName(coupon);
			PageInfo pi = Pagination.getPageInfo(currentPage, count);
			
			list=cs.selectIssuingCouponName(coupon,pi);
			
			
			
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("searchContent", searchContent);
			request.setAttribute("searchType", searchType);
			
			//System.out.println(list);
			return "admin/coupon/lssuingCouponManageMent2";
		}
		return "common/errorPage";
	}
	
	//쿠폰선택 후 발급버튼
	@RequestMapping("checkedCouponIssuing.co")
	public String checkedCouponIssuing(HttpServletRequest request, HttpServletResponse response,@RequestParam(required=false) String couponNo) {
		//모든 쿠폰 목록 불러오깅
		
		System.out.println(couponNo+"couponNo");
		
		ArrayList<AdminCoupon> list = new ArrayList<>();
		AdminCoupon coupon = new AdminCoupon();
		
		list = cs.selectAllCouponList();
		System.out.println(list);
		request.setAttribute("list", list);
		//request.setAttribute("couponNo", couponNo);
		
		
		return "admin/coupon/lssuingCoupon";
	}
	
	//사이드바에서 쿠폰 발급하기 클릭
	@RequestMapping("issuingCouponEnter.co")
	public String issuingCouponEnter(HttpServletRequest request, HttpServletResponse response) {
		//모든 쿠폰 목록 불러오깅
		ArrayList<AdminCoupon> list = new ArrayList<>();
		AdminCoupon coupon = new AdminCoupon();
				
		list = cs.selectAllCouponList();
		//System.out.println(list);
		request.setAttribute("list", list);
				
				
		return "admin/coupon/lssuingCoupon";
		
		
	}
	
	//쿠폰 발급하기
	@RequestMapping("issuingCoupon.co")
	public String  issuingCoupon(AdminCouponIssue2 coupon2,HttpServletRequest request, HttpServletResponse response,String[] memberNameArr,String AllMemberRadios,String selectSm) {
		System.out.println(AllMemberRadios);
		System.out.println(selectSm);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONDAY, Integer.parseInt(coupon2.getIssueEdate()));		
		Date date = new Date(cal.getTimeInMillis());
		
		AdminCouponIssue coupon = new AdminCouponIssue();

		int result=0;
		
		if(AllMemberRadios.equals("option1")) {
			//모든회원 검색
			ArrayList<Member> list = cs.selectAllMember();
			//System.out.println(list);
			
			for(int i=0; i<list.size();i++) {
				coupon.setCouponNo(Integer.parseInt(selectSm));
				coupon.setMemberNo(list.get(i).getMemberNo());
				coupon.setIssueEdate(date);
				 result = cs.insertCouponIssuing(coupon);
			}
		}else if(AllMemberRadios.equals("option2")) {
			//특정회원
			for(int i=0; i<memberNameArr.length; i++) {
				System.out.println("가져오닝?"+memberNameArr[i]);
				coupon.setCouponNo(Integer.parseInt(selectSm));
				coupon.setMemberNo(Integer.parseInt(memberNameArr[i]));
				coupon.setIssueEdate(date);
				result = cs.insertCouponIssuing(coupon);
			}
		}
		
		if(result>0) {
			return "redirect:lssuingCouponManageMent.co";
		}else {
			return "common/errorPage";
		}
		
	
	}
	
	//쿠폰 발급하기-회원 아이디 조회
	@RequestMapping("memberIdSearch.co")
	public @ResponseBody Member memberIdSearch(@RequestParam String memberId) {
		//System.out.println(memberId);
		
		Member m = new Member();
		//m.setMemberId(memberId);
		//System.out.println(m);
		
		m = cs.memberIdSearch(memberId);
		System.out.println(m);
		
		
		
		return m;
	}
	
	//쿠폰 조회에서 수정하기 클릭 버튼 눌렀을때
	@RequestMapping("couponUpdate.co")
	public String couponUpdate(HttpServletRequest request,String couponNo) {
		//해당 쿠폰의 번호로 조회해오깅
		System.out.println(couponNo);
		
		AdminCoupon coupon = new AdminCoupon();
		//coupon.setCouponNo(Integer.parseInt(couponNo));
		
		coupon = cs.selectCouponContent(couponNo);
		System.out.println(coupon);
		request.setAttribute("coupon", coupon);
		
		if(coupon!=null) {
			return "admin/coupon/couponUpdate";			
		}else {
			return "common/errorPage";
		}
		
		
	}
	
	//쿠폰 진짜 수정하기
	@RequestMapping("couponUpdateBtn.co")
	public String couponUpdateBtn(AdminCoupon2 coupon2) {
		
		//System.out.println("쿠폰 2 : "+coupon2);
		
		AdminCoupon coupon = new AdminCoupon();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONDAY, Integer.parseInt(coupon2.getCouponEdateStr()));		
		Date date = new Date(cal.getTimeInMillis());
		
		if(coupon2.getCouponRdiscountStr()==null) {
			//할인 금액
			coupon.setCouponPdiscount(Integer.parseInt(coupon2.getCouponPdiscountStr()));
			coupon.setCouponRdiscount(0);
		}else if(coupon2.getCouponPdiscountStr()==null) {
			//할인 율
			coupon.setCouponRdiscount((double)Integer.parseInt(coupon2.getCouponRdiscountStr())/100.0);
			coupon.setCouponPdiscount(0);
			
			

		}
		
		coupon.setCouponName(coupon2.getCouponName());
		coupon.setCouponCondition(Integer.parseInt(coupon2.getCouponConditionStr()));
		coupon.setCouponEdate(date);
		coupon.setCouponNo(coupon2.getCouponNo());
		
		int result = cs.updateCoupon(coupon);
		//System.out.println("수정한 coupon은?"+coupon);
		if(result>0) {
			return "redirect:searchCoupon.co";			
		}else {
			return "common/errorPage";
		}
		
	}

	

}