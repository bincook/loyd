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
	
	/** 관리자가 멤버정보-상품 목록 조회(페이징) */
	public ArrayList<MemberDto> listdetail(String search_field, String search_word);
	public Integer get_cnt();
	public ArrayList<MemberDto> list(int index);
	public String listsearch();

}
