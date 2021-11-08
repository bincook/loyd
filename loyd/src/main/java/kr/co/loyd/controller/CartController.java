package kr.co.loyd.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.loyd.dao.CartDao;
import kr.co.loyd.dao.OrderDao;
import kr.co.loyd.dto.CartDto;
import kr.co.loyd.dto.OrderDetailDto;
import kr.co.loyd.dto.OrderDto;

@Controller
public class CartController {

	@Autowired
	private SqlSession sqlSession;
	
    /** 장바구니 목록 페이지 */
    @RequestMapping(value = "/cart/list", method = RequestMethod.GET)
    public String cart_list(Model model,HttpSession session) {
    	
    	String email = (String) session.getAttribute("email");
    	
    	CartDao cart = sqlSession.getMapper(CartDao.class);
    	ArrayList<CartDto> list = cart.cart_list(email);
    	
    	int chong = cart.cart_sum(email);

    	if(chong==0) {
    		return "cart/cart_zero";
    	}else {
    		model.addAttribute("chong",chong);
        	model.addAttribute("list",list);

            return "cart/cart-list";
    	}
    }
    
    @RequestMapping("/cart/cart_zero")
    public String cart_zero() {
    	
    	return "cart/cart_zero";
    }
    
    @RequestMapping("/cart/change")
    public String change(HttpServletRequest request,Model model ,HttpSession session) {
    	
    	String email = (String) session.getAttribute("email");
    	int watch_id= Integer.parseInt(request.getParameter("watch_id"));
    	
    	CartDao cart = sqlSession.getMapper(CartDao.class);
    	CartDto dto = cart.change(watch_id,email);
    	
    	int chk = cart.chkk(watch_id,email);
    	model.addAttribute("dto",dto);
    	model.addAttribute("chk",chk);
    	return "/cart/change";
    }
    
    @RequestMapping("/cart/minus")
    public String minus(HttpServletRequest request,HttpSession session) {
    	int watch_id= Integer.parseInt(request.getParameter("watch_id"));
    	
    	String email = (String) session.getAttribute("email");
    	CartDao cart = sqlSession.getMapper(CartDao.class);
    	

    	cart.minus(watch_id,email);

    	
    	
    	return "redirect:/cart/change?watch_id="+watch_id+"&email="+email;
    }
    
    @RequestMapping("/cart/plus")
    public String plus(HttpServletRequest request,HttpSession session) {
    	
    	
    	String email = (String) session.getAttribute("email");
    	int watch_id= Integer.parseInt(request.getParameter("watch_id"));
    	
    	CartDao cart = sqlSession.getMapper(CartDao.class);
    	cart.plus(watch_id,email);
    	
    	
    	return "redirect:/cart/change?watch_id="+watch_id+"&email="+email;
    }
    // 아까 열렸던 창 페이지가 어떤 
    @ResponseBody
    @RequestMapping("/cart/cart_delete")
    public String cart_delete( @RequestParam(value= "watch_id[]") int[] watch_id,HttpSession session) {
    	
    	String email = (String) session.getAttribute("email");
    	//System.out.println(member_id);
    	
    	for(int i=0;i<watch_id.length;i++) {
    		CartDao cart = sqlSession.getMapper(CartDao.class);
        	cart.cart_delete(watch_id[i],email);
    	}

     	return "hello world";
    	
    }
    
    @RequestMapping("/cart/cart_buy")
    public String cart_buy(HttpSession session,Model model) {
    	
    	String email = (String) session.getAttribute("email");
    	
    	CartDao cart = sqlSession.getMapper(CartDao.class);
    	ArrayList<CartDto> list = cart.cart_buy(email);
    	int chong = cart.cart_sum(email);
    	int item_chong = cart.item_chong(email);
    	
    	model.addAttribute("item_chong",item_chong);
    	model.addAttribute("chong",chong);
    	model.addAttribute("list",list);
    	
    	
    	return "/cart/cart_buy";
    }
    
    @RequestMapping("/cart/pay")
	public String pay(OrderDetailDto dto, HttpSession session) {
    	
    	
    	
    	int member_id = (Integer) session.getAttribute("id");
    	
    	CartDao cart = sqlSession.getMapper(CartDao.class);

    	cart.writeOrderList(member_id);
    	cart.pay(dto);
    	
    	cart.cart_del(member_id);
    	

		return "/cart/pay";
	}
   

}

