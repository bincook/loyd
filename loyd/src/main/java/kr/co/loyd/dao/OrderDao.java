package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.OrderDetailDto;
import kr.co.loyd.dto.OrderDto;

public interface OrderDao {

	public OrderDto detail_order(int id);
	public void cart_go( int id , String email);
	public int id_check(int id ,String email);
	public int cart_plus( int id,String email);
	public OrderDto buy(int id);
	public int all_price();
	public ArrayList<OrderDto> product_list(int index);
	public ArrayList<OrderDto> men_product_list(int index);
	public ArrayList<OrderDto> women_product_list(int index);
	public int get_page();
	public int men_get_page();
	public int women_get_page();
	public ArrayList<OrderDto> watch_detail(int id);
	public void pay(OrderDetailDto dto);
}
