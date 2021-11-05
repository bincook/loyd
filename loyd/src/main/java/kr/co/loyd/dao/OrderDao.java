package kr.co.loyd.dao;

import java.util.ArrayList;

import kr.co.loyd.dto.OrderDetailDto;
import kr.co.loyd.dto.OrderDto;
import kr.co.loyd.dto.QnaDto;

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
	

	/** 대시보드 order 최근 5개 목록 조회  */
	ArrayList<OrderDto> dash_listo();
	/** 대시보드 그래프  : 주문내역이 가장 많은 상품 10개  */
	public ArrayList<OrderDto> orderg();	
	/** 대시보드 그래프  : 한달 전 주문내역 count  */
	public ArrayList<OrderDto> grapoc();

	
	public int writeOrderList(OrderDto dto);
	public void writeOrderDetail(OrderDetailDto dto);

}
