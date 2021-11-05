package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.MemberDto;
import kr.co.loyd.dto.MypageDto;

public interface MypageDao {

	public Integer page_cnt(Integer memberId);
	public ArrayList<MypageDto> order_list(Integer memberId, String field, String word, int index);
	public MypageDto item_detail(String id);
	public ArrayList<MypageDto> enquiry(Object email);
	public ArrayList<MypageDto> wishlist(Object email);
	public MypageDto enquiry_detail(String qna_id);
	public MemberDto member_edit(String email);
	public void member_edit_ok(MemberDto mdto);
//	public ArrayList<MypageDto> info(Integer memberId);
	public ArrayList<MypageDto> info(Object email);
	public ArrayList<MypageDto> order_detail(Integer memberId, String order_no);
	public MypageDto order_detail1(Object email, String order_no);
}
