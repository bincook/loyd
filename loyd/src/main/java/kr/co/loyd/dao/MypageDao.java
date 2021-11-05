package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.MemberDto;
import kr.co.loyd.dto.MypageDto;

public interface MypageDao {

	public Integer page_cnt();
	public ArrayList<MypageDto> order_list(String email, String field, String word, int index);
	public MypageDto item_detail(String id);
	public ArrayList<MypageDto> enquiry(String email);
	public ArrayList<MypageDto> wishlist(String email);
	public MypageDto enquiry_detail(String qna_id);
	public MemberDto member_edit(String email);
	public void member_edit_ok(MemberDto mdto);
//	public ArrayList<MypageDto> info(Integer memberId);
	public ArrayList<MypageDto> info(Object email);
	public MypageDto order_detail(Object email);
}
