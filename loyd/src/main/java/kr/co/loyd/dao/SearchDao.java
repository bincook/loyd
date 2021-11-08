package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.SearchDto;

public interface SearchDao {

	public ArrayList<SearchDto> search(SearchDto dto);
	public int search_chk(SearchDto dto);
	
}
