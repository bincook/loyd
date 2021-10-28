package kr.co.loyd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.loyd.dao.OrderDao;
import kr.co.loyd.dto.OrderDto;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/detail_order")
	public String detail_order(Model model) {
		
		//상품 리스트에서 ID 받아와야됨!
		
		
		OrderDao dao = sqlSession.getMapper(OrderDao.class);
		OrderDto dto = dao.detail_order();
		model.addAttribute("dto",dto);
		
		
		return "/order/detail_order";
	}
	
	@RequestMapping("/cart_go")
	public String cart_go(HttpServletRequest request, HttpSession session) {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String email = (String) session.getAttribute("email");
		
		OrderDao dao = sqlSession.getMapper(OrderDao.class);
		
		int cnt = dao.id_check(id);
		
		if(cnt==0) {
			dao.cart_go(id,email);
		}else {
			dao.cart_plus(id,email);
		}
		
		return "redirect:/order/detail_order";
	}
	
	@RequestMapping("/buy")
	public String buy() {
		
		return "/order/buy";
	}
	
}
