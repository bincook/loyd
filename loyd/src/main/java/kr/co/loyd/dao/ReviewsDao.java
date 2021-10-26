package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.AddfileDto;
import kr.co.loyd.dto.ReviewWriteDto;
import kr.co.loyd.dto.ReviewsDto;


public interface ReviewsDao {

	public void writeOk1(ReviewWriteDto dto);
	public void writeOk2(ReviewWriteDto dto);

	public ArrayList<ReviewsDto> list(int index);  // 리스트 출력
	
	public Integer get_pagecount();  // 페이징 카운트
	public ArrayList<ReviewsDto> list2(String field, String word);  // search 하기

	public void readnum(int reviewId);

	
	
}
