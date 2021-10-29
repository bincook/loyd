package kr.co.loyd.dao;

import kr.co.loyd.dto.OrderDto;

public interface OrderDao {

	public OrderDto detail_order();
	public void cart_go(int id , String email);
	public int id_check(int id);
	public int cart_plus(int id,String email);
	public OrderDto buy(); //멤버 아이디 받아야됨
	public int all_price();
}
