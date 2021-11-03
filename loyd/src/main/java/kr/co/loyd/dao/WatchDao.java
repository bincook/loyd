package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.WatchDto;

public interface WatchDao {
	
	/** 상품 등록 */
	void upload_ok(WatchDto paramWatchDto);	
	
	
	/** 상품 목록 페이징*/
	public Integer get_cnt();
	/** 등록한 상품 목록 */
	public ArrayList<WatchDto> watch_list(int recod);
	
	
	/** 상품 삭제*/
	public void delete(String id);
	
	/** 상품 상세페이지*/
	public WatchDto content(String id);
<<<<<<< HEAD

	/** 상품 수정페이지*/
	public WatchDto update(String id);
=======
>>>>>>> developer
	
	/** 상품 수정 */
	void update_ok(WatchDto paramWatchDto);
	
	
	
}
