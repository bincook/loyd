package kr.co.loyd.dto;

public class MypageDto {

	private int id, price, watch_id, member_id, count;
	private double discount;
	private String orderday, name, picture;
	
	
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public int getWatch_id() {
		return watch_id;
	}
	public void setWatch_id(int watch_id) {
		this.watch_id = watch_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getOrderday() {
		return orderday;
	}
	public void setOrderday(String orderday) {
		this.orderday = orderday;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
