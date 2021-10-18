package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.ReviewsDto;

public interface ReviewsDao {

	public void writeOk(ReviewsDto rdto);
	
	public ArrayList<ReviewsDto> list(ReviewsDto rdto);
	
	
	
	

	
}
