package com.kh.pmfp.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pmfp.admin.model.exception.AdminSelectException;
import com.kh.pmfp.admin.model.vo.AdminMember;
import com.kh.pmfp.admin.model.vo.AdminOrder;

public interface AdminDao {

	ArrayList<AdminMember> selectUserList(SqlSessionTemplate sqlSession) throws AdminSelectException;

	AdminMember selectUser(SqlSessionTemplate sqlSession, int num) throws AdminSelectException;

	ArrayList<AdminOrder> selectOrderList(SqlSessionTemplate sqlSession, int num) throws AdminSelectException;

}
