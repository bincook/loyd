package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.WatchDto;

public interface WatchDao {
	
	/** 상품 등록 */
	void upload_ok(WatchDto paramWatchDto);
	
	/** 등록한 상품 목록 */
	ArrayList<WatchDto> watch_list();
	
	/** 상품 목록 페이징*/
	public Integer get_cnt();
	public ArrayList<WatchDto> watch_list(int index);

	public WatchDto content(String id);
	
	
	
}
