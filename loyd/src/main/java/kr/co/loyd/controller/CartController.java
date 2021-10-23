package kr.co.loyd.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.loyd.dao.CartDao;
import kr.co.loyd.dto.CartDto;

@Controller
public class CartController {

	@Autowired
	private SqlSession sqlSession;
	
    /** 장바구니 목록 페이지 */
    @RequestMapping(value = "/cart/list", method = RequestMethod.GET)
    public String cart_list(Model model) {
    	
    	CartDao cart = sqlSession.getMapper(CartDao.class);
    	ArrayList<CartDto> list = cart.cart_list();
    	
    	int chong = cart.cart_sum();
    	model.addAttribute("chong",chong);
    	model.addAttribute("list",list);

        return "cart/cart-list";
    }
    
    @RequestMapping("/cart/change")
    public String change(HttpServletRequest request,Model model) {
    	
    	int watch_id= Integer.parseInt(request.getParameter("watch_id"));
    	
    	CartDao cart = sqlSession.getMapper(CartDao.class);
    	CartDto dto = cart.change(watch_id);
    	model.addAttribute("dto",dto);
    	
    	return "/cart/change";
    }
    
    @RequestMapping("/cart/minus")
    public String minus(HttpServletRequest request) {
    	int watch_id= Integer.parseInt(request.getParameter("watch_id"));
    	
    	CartDao cart = sqlSession.getMapper(CartDao.class);
    	cart.minus(watch_id);
    	
    	
    	return "redirect:/cart/change?watch_id="+watch_id;
    }
    
    @RequestMapping("/cart/plus")
    public String plus(HttpServletRequest request) {
    	int watch_id= Integer.parseInt(request.getParameter("watch_id"));
    	
    	CartDao cart = sqlSession.getMapper(CartDao.class);
    	cart.plus(watch_id);
    	
    	
    	return "redirect:/cart/change?watch_id="+watch_id;
    }

}
