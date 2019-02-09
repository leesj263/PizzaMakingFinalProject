package com.kh.pmfp.admin.model.service;

import java.util.ArrayList;

import com.kh.pmfp.admin.model.exception.AdminCountException;
import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.vo.AdminBoard;
import com.kh.pmfp.admin.model.vo.AdminMember;
import com.kh.pmfp.admin.model.vo.AdminOrder;
import com.kh.pmfp.admin.model.vo.AdminSeller;

public interface AdminService {

	//회원 목록 조회용
	ArrayList<AdminMember> selectUserList() throws AdminSelectException;

	//회원 상세조회용
	AdminMember selectUser(int num) throws AdminSelectException;
	
	//회원 주문 목록 조회용
	ArrayList<AdminOrder> selectUserOrder(int num) throws AdminSelectException;

	//업체 목록 조회용
	ArrayList<AdminSeller> selectSellerList() throws AdminSelectException;

	//승인 대기 목록 조회용
	ArrayList<AdminSeller> selectWaitSeller() throws AdminSelectException;

	//업체 상세조회용
	AdminSeller selectSeller(int num) throws AdminSelectException;

	//공지사항 목록 조회용
	ArrayList<AdminBoard> selectNoticeList() throws AdminSelectException;

	//공지사항 상세보기용
	AdminBoard selectNotice(int num) throws AdminSelectException, AdminCountException;

}
