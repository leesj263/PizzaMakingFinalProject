package com.kh.pmfp.company.model.service;

import java.util.ArrayList;

import com.kh.pmfp.company.model.exception.FailSelectAdminMessage;
import com.kh.pmfp.company.model.exception.FaileDetailMessage;
import com.kh.pmfp.company.model.vo.CompanyBoard;

public interface CompanyService {

	ArrayList<CompanyBoard> selectAdminMessage() throws FailSelectAdminMessage;

	CompanyBoard detailAdminMessage(int boardNo) throws FaileDetailMessage;

}
