package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.WatchDto;

public interface WatchDao {
	
	void upload_ok(WatchDto paramWatchDto);
	
	ArrayList<WatchDto> list();
	
}
