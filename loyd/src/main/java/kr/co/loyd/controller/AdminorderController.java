package kr.co.loyd.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")

public class AdminorderController {
	private final String module = "admin";
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping ("/order/order_list")
	public String order_list() {
		System.out.println("=================");
		return module+"/order/order_list";
	}
	

}
