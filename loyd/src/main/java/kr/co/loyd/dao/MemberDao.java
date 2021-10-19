package kr.co.loyd.dao;

import kr.co.loyd.dto.MemberDto;

import java.util.ArrayList;

public interface MemberDao {

	/** 멤버 조회 */
	MemberDto one(Long id);

	/** 멤버 리스트 조회 */
	ArrayList<MemberDto> list();

	/** 멤버 생성 */
	void insert(MemberDto memberDto);

	/** 멤버 수정 */
	void update(MemberDto memberDto);

	/** 멤버 삭제 */
	void delete(Long id);
	
	/** 멤버 패이지 조회 */
	public ArrayList<MemberDto> listPage(String search_field, String search_word);
}
