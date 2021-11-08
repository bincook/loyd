package kr.co.loyd.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.loyd.dao.AdminorderDao;
import kr.co.loyd.dto.AdminorderDto;

@Controller
@RequestMapping("/admin/order")

public class AdminorderController {
	private final String module = "admin/order";
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping ("/order_list")
	public String order_list(Model model) {
		// 주문자 정보 불러오기
		AdminorderDao dao = sqlSession.getMapper(AdminorderDao.class);
		ArrayList <AdminorderDto> list = dao.list();
		model.addAttribute("order",list);
		return module+"/order_list";
		
	}
	@RequestMapping("order_detail")
	public String order_detail(Model model) {
		AdminorderDao dao = sqlSession.getMapper(AdminorderDao.class);
		ArrayList <AdminorderDto> list2 = dao.list2();
		model.addAttribute("order_detail",list2);
		System.out.println(list2);
		return module + "/order_detail";
	}
	@RequestMapping("qna")
	public String qna(Model model) {
		AdminorderDao dao = sqlSession.getMapper(AdminorderDao.class);
		ArrayList <AdminorderDto> list3 = dao.list3();
		model.addAttribute("order_detail",list3);
		return module + "/qna";
	}


}
