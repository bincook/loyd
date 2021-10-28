package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.AddfileDto;
import kr.co.loyd.dto.ReviewWriteDto;
import kr.co.loyd.dto.ReviewsDto;


public interface ReviewsDao {

	public void writeOk1(ReviewWriteDto rdto);
	public void writeOk2(AddfileDto adto);
	
	public void img(AddfileDto adto);
	
//	public ArrayList<ReviewsDto> list(ReviewsDto rdto);
	
	public ArrayList<ReviewsDto> list(int index);
	public Integer get_pagecount();

	
	public void readnum(int reviewId);
	
	
	
	
	
	

	
}
