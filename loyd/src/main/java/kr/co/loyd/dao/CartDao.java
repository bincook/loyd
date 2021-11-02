package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.CartDto;
import kr.co.loyd.dto.OrderDetailDto;

public interface CartDao {
	
	public ArrayList<CartDto> cart_list(String email);
	
	public int cart_sum(String email);
	public int item_chong(String email);
	
	public CartDto change(int watch_id,String email); 
	
	public void minus(int watch_id,String email);
	public void plus(int watch_id,String email);
	
	public void cart_delete(int watch_id , String email);
	
	public int chkk(int watch_id,String email);
	
	public ArrayList<CartDto> cart_buy(String email);
	
	public void pay(OrderDetailDto dto);
	
}
