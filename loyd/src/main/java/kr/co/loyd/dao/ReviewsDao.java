package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.AddfileDto;
import kr.co.loyd.dto.QnaDto;
import kr.co.loyd.dto.ReviewWriteDto;
import kr.co.loyd.dto.ReviewsDto;


public interface ReviewsDao {

	public void writeOk1(ReviewWriteDto dto);
	public void writeOk2(ReviewWriteDto dto);

	public ArrayList<ReviewsDto> list(int index);  // 리스트 출력
	
	public Integer get_pagecount(String field, String word);  // 페이징 카운트
	public ArrayList<ReviewsDto> list2(String field, String word, int index);  // search 하기

	public void readnum(int reviewId);
	
<<<<<<< HEAD
	
	/** 대시보드에 문의글 최근 5개 목록 조회 */
	ArrayList<ReviewsDto> dash_listr(); 
	
	
	
=======
	public ReviewsDto content(int review_id); // content 페이지
	public void delete(int review_id); //delete 페이지
>>>>>>> developer

	
	
}
