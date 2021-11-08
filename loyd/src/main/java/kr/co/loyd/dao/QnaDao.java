package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.QnaDto;

public interface QnaDao {

	/** Q&A 문의글 등록 */
	public void insert_ok(QnaDto qdto);
	
	/** Q&A 문의글 목록 */
	ArrayList<QnaDto> list(int recod);

	/** Q&A 문의글 목록 (페이징)*/
	public Integer get_cnt();


	
	/** 대시보드에 문의글 최근 5개 목록 조회  */
	ArrayList<QnaDto> dash_listq(); 
	
	/**  대시보드 그래프 : 문의글 총 합계 */
	public String totq();
	
	/**  대시보드 그래프 :반품/취소 문의가 가장많은 상품번호 */
	public String dash_grapq();
	
}
