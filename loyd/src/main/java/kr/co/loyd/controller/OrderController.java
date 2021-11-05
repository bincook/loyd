package kr.co.loyd.controller;

import java.util.ArrayList;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.loyd.dao.OrderDao;
import kr.co.loyd.dto.OrderDetailDto;
import kr.co.loyd.dto.OrderDto;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/detail_order")
	public String detail_order(Model model,HttpServletRequest request,HttpSession session) {
		
		//�긽�뭹 由ъ뒪�듃�뿉�꽌 ID 諛쏆븘���빞�맖!
		int id = Integer.parseInt(request.getParameter("id"));
		int member_id = (Integer) session.getAttribute("id");
		
		OrderDao dao = sqlSession.getMapper(OrderDao.class);
		OrderDto dto = dao.detail_order(id,member_id);
		
		System.out.println(dto.getLike2());
		
		ArrayList<OrderDto> list = dao.watch_detail(id);
		
		model.addAttribute("list",list);
		model.addAttribute("dto",dto);
		
		
		return "/order/detail_order";
	}
	
	@RequestMapping("/cart_go")
	public String cart_go(HttpServletRequest request, HttpSession session) {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String email = (String) session.getAttribute("email");
		int member_id = (Integer) session.getAttribute("id");
		
		
		OrderDao dao = sqlSession.getMapper(OrderDao.class);

		int cnt = dao.id_check(id,email);
		
		
		if(cnt==0) {
			dao.cart_go(id,email,member_id);
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
		/*int all_price = dao.all_price();*/
		
		
		model.addAttribute("dto",dto);
		/*model.addAttribute("all_price",all_price);*/

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
	
	@RequestMapping("/men_product_list")
	public String men_product_list(Model model,HttpServletRequest request) {
		OrderDao dao = sqlSession.getMapper(OrderDao.class);
		
		int page;
		
		if(request.getParameter("page")==null) {
			page =1;
		}else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int index = (page-1)*10;
		
		ArrayList<OrderDto> list = dao.men_product_list(index);
		
		
		int pstart = page /10;
		
		if(page % 10 ==0) {
			pstart = pstart-1;
		}
		
		pstart = (pstart*10) +1;
		
		int pend = pstart+9;
		
		int page_cnt=dao.men_get_page();
		
		if(pend>page_cnt) {
			pend=page_cnt;
		}
		
		
		
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("list",list);
		
		return "/order/men_product_list";
	}
	
	@RequestMapping("/women_product_list")
	public String women_product_list(Model model,HttpServletRequest request) {
		OrderDao dao = sqlSession.getMapper(OrderDao.class);
		
		int page;
		
		if(request.getParameter("page")==null) {
			page =1;
		}else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int index = (page-1)*10;
		
		ArrayList<OrderDto> list = dao.women_product_list(index);
		
		
		int pstart = page /10;
		
		if(page % 10 ==0) {
			pstart = pstart-1;
		}
		
		pstart = (pstart*10) +1;
		
		int pend = pstart+9;
		
		int page_cnt=dao.women_get_page();
		
		if(pend>page_cnt) {
			pend=page_cnt;
		}
		
		
		
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("list",list);
		
		return "/order/women_product_list";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/pay")
	public String pay(OrderDetailDto dto, OrderDto orderListDto, HttpSession session) {
		
		Object memberIdObj = session.getAttribute("id");
		
		if (memberIdObj != null) {	
			orderListDto.setMember_id((Integer) memberIdObj);
		}
		OrderDao dao = sqlSession.getMapper(OrderDao.class);
		dao.writeOrderList(orderListDto);

		dao.writeOrderDetail(dto);
		
		return "/order/pay";
	}
	
	@RequestMapping("/like")
	public String like (HttpServletRequest request,HttpSession session) {
		int watch_id  = Integer.parseInt(request.getParameter("id"));
		int member_id = (Integer) session.getAttribute("id");
		String email = (String) session.getAttribute("email");
		
		OrderDao dao = sqlSession.getMapper(OrderDao.class);
		dao.like(watch_id,member_id,email);
		
		return "redirect:/order/detail_order?id="+watch_id;
	}
	
	@RequestMapping("/like2")
	public String like2 (HttpServletRequest request,HttpSession session) {
		int watch_id  = Integer.parseInt(request.getParameter("id"));
		int member_id = (Integer) session.getAttribute("id");
		String email = (String) session.getAttribute("email");
		
		OrderDao dao = sqlSession.getMapper(OrderDao.class);
		dao.like2(watch_id,member_id,email);
		
		return "redirect:/order/detail_order?id="+watch_id;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
