package com.kh.pmfp.mypage.model.service;

import java.util.ArrayList;

import com.kh.pmfp.common.model.vo.Member;
import com.kh.pmfp.mypage.model.vo.OrderList;

public interface MypageService {

	ArrayList<OrderList> selectOrderList(Member m);

}
