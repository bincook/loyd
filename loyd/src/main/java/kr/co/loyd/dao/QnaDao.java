package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.QnaDto;

public interface QnaDao {


	public void insert_ok(String id);
	
	ArrayList<QnaDto> qna();
}
