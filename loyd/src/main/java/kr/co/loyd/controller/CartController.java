package kr.co.loyd.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    // 아까 열렸던 창 페이지가 어떤 
    @ResponseBody
    @RequestMapping("/cart/cart_delete")
    public String cart_delete(@RequestParam("member_id") int member_id, @RequestParam(value= "watch_id[]") int[] watch_id) {
    	
    	
    	System.out.println(member_id);
    	
    	System.out.println(Arrays.toString(watch_id)); // 애가 nul 로 찍히네요
    	
    	for(int i=0;i<watch_id.length;i++) {
    		CartDao cart = sqlSession.getMapper(CartDao.class);
        	cart.cart_delete(watch_id[i],member_id);
    	}

     	return "hello world";
    	
    }

}

