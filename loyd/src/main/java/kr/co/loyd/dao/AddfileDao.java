package kr.co.loyd.dao;

import kr.co.loyd.dto.AddfileDto;

public interface AddfileDao {
	
	// 파일명과 경로를 DB 에 저장
	int insert(AddfileDto dto);

}
