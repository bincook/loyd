package kr.co.loyd.dto;

public class OrderDto {

	private int id,price,discount;
	private String name,brand,category,content,picture,kind;
	
	private int member_id, watch_id,chong,all_price;
	
	//watch_detail
	private String path;
	
	
	
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getAll_price() {
		return all_price;
	}
	public void setAll_price(int all_price) {
		this.all_price = all_price;
	}
	public int getChong() {
		return chong;
	}
	public void setChong(int chong) {
		this.chong = chong;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getWatch_id() {
		return watch_id;
	}
	public void setWatch_id(int watch_id) {
		this.watch_id = watch_id;
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
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	
	
	
}
