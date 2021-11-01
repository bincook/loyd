package kr.co.loyd.controller;

import java.util.ArrayList;

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
	public String detail_order(Model model,HttpServletRequest request) {
		
		//상품 리스트에서 ID 받아와야됨!
		int id = Integer.parseInt(request.getParameter("id"));
		
		OrderDao dao = sqlSession.getMapper(OrderDao.class);
		OrderDto dto = dao.detail_order(id);
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
		
		return "redirect:/order/detail_order?id="+id;
	}
	
	@RequestMapping("/buy")
	public String buy(Model model,HttpServletRequest request) {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		OrderDao dao = sqlSession.getMapper(OrderDao.class);
		
		
		OrderDto dto = dao.buy(id);
		int all_price = dao.all_price();
		
		
		model.addAttribute("dto",dto);
		model.addAttribute("all_price",all_price);

		return "/order/buy";
	}
	
	@RequestMapping("/product_list")
	public String product_list(Model model,HttpServletRequest request) {
		OrderDao dao = sqlSession.getMapper(OrderDao.class);
		
		int page;
		
		if(request.getParameter("page")==null) {
			page =1;
		}else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int index = (page-1)*10;
		
		ArrayList<OrderDto> list = dao.product_list(index);
		
		
		int pstart = page /10;
		
		if(page % 10 ==0) {
			pstart = pstart-1;
		}
		
		pstart = (pstart*10) +1;
		
		int pend = pstart+9;
		
		int page_cnt=dao.get_page();
		
		if(pend>page_cnt) {
			pend=page_cnt;
		}
		
		
		
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("list",list);
		
		return "/order/product_list";
	}
	
}
