package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.CartDto;

public interface CartDao {
	
	public ArrayList<CartDto> cart_list();
	
	public int cart_sum();
	
	public CartDto change(int watch_id); 
	
	public void minus(int watch_id);
	public void plus(int watch_id);
	
}
