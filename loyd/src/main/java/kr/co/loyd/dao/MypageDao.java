package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.MypageDto;

public interface MypageDao {

	public Integer page_cnt();
	public ArrayList<MypageDto> order_list(String email, String field, String word, int index);
	public MypageDto order_detail(String id);
	public ArrayList<MypageDto> enquiry(String email);
	public ArrayList<MypageDto> wishlist(String email);
}
