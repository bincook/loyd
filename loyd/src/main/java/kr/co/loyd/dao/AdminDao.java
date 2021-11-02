package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.QnaDto;

public interface AdminDao {
	
	public ArrayList dash_board();
	
	/** 대시보드에 문의글 최근 5개 목록 조회 */
	ArrayList<QnaDto> qna(QnaDto qdto);
	
}
