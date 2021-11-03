package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.AddfileDto;
import kr.co.loyd.dto.ReviewWriteDto;
import kr.co.loyd.dto.ReviewsDto;
import kr.co.loyd.dto.WatchDto;


public interface ReviewsDao {

	public void writeOk1(ReviewWriteDto dto); // 파일이 없는경우
	public void writeOk2(ReviewWriteDto dto);  // 파일이 있는경우

	public ArrayList<ReviewsDto> list(int index);  // 리스트 출력
	
	public Integer get_pagecount(String field, String word);  // 페이징 카운트
	public ArrayList<ReviewsDto> list2(String field, String word, int index);  // search 하기

	public void readnum(int reviewId);  // 조회수 페이지
	public ReviewsDto content(int review_id); // content 페이지
	public void delete(int review_id); //delete 페이지
	
	public ReviewsDto update(int review_id);  // update 수정하기
	public void update_ok1(ReviewWriteDto dto);  // 파일이 없는경우(수정)
	public void update_ok2(ReviewWriteDto dto);  // 파일이 있는경우(수정)
	
	

	
}




