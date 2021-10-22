package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.MypageDto;

public interface MypageDao {

	public Integer page_cnt();
	public ArrayList<MypageDto> order_list(String field, String word, int index);
	public ArrayList<MypageDto> order_detail_list();
}
