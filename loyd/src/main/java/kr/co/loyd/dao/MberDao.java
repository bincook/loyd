package kr.co.loyd.dao;

import kr.co.loyd.dto.MberDto;

public interface MberDao {

	public void join_ok(MberDto dto);
	public String emailfind_ok(MberDto dto);
	public String pwdfind_ok(MberDto dto);
	public MberDto login_ok(MberDto dto);
	public Integer get_check(String email);
}
