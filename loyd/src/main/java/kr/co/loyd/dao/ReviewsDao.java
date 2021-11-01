package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.AddfileDto;
import kr.co.loyd.dto.ReviewWriteDto;
import kr.co.loyd.dto.ReviewsDto;
import kr.co.loyd.dto.WatchDto;


public interface ReviewsDao {

	public void writeOk1(ReviewWriteDto dto);
	public void writeOk2(ReviewWriteDto dto);

	public ArrayList<ReviewsDto> list(int index);  // 리스트 출력
	
	public Integer get_pagecount(String field, String word);  // 페이징 카운트
	public ArrayList<ReviewsDto> list2(String field, String word, int index);  // search 하기

	public void readnum(int reviewId);
	
	public ReviewsDto content(int review_id); // content 페이지

	public void delete(int review_id); //delete 페이지
	
	public ReviewsDto update(int reviewId);  // 수정하기
	
//	public WatchDto input_watch(WatchDto wdto);  // watch 테이블에서 시계이름 가져오기

//	public WatchDto input_watch(WatchDto wdto);  // watch 테이블에서 시계이름 가져오기
//	public WatchDto input_watch(int watchId);  // watch 테이블에서 시계이름 가져오기
	public WatchDto input_watch(WatchDto wdto);  // watch 테이블에서 시계이름 가져오기
	
	
	

	
}




