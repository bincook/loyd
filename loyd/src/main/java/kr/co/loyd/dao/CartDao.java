package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.CartDto;

public interface CartDao {
	
	public ArrayList<CartDto> cart_list(String email);
	
	public int cart_sum(String email);
	
	public CartDto change(int watch_id,String email); 
	
	public void minus(int watch_id);
	public void plus(int watch_id,String email);
	
	public void cart_delete(int watch_id , int member_id);
	
}
