package com.kh.pmfp.admin.model.service;

import java.util.ArrayList;

import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.vo.AdminMember;
import com.kh.pmfp.admin.model.vo.AdminOrder;

public interface AdminService {

	ArrayList<AdminMember> selectUserList() throws AdminSelectException;

	AdminMember selectUser(int num) throws AdminSelectException;

	ArrayList<AdminOrder> selectUserOrder(int num) throws AdminSelectException;

}
