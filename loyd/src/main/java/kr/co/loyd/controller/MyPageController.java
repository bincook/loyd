package kr.co.loyd.controller;



import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.loyd.dao.MypageDao;
import kr.co.loyd.dto.MypageDto;

@Controller
public class MyPageController {

	@Autowired
	public SqlSession sqlSession;
	
    /** 마이페이지 */
    @RequestMapping(value = "/mypage/info", method = RequestMethod.GET)
    public String cartListPage() {
        return "mypage/info";
    }
    
    
    @RequestMapping("/mypage/order_list")
    public String order_list(HttpServletRequest request, Model model) {
    	
    	MypageDao mydao = sqlSession.getMapper(MypageDao.class);
    	// 페이징 처리하기
    	int page;
    	if(request.getParameter("page")==null){

    		page = 1;
    	} else {
    		
    		page = Integer.parseInt(request.getParameter("page"));
    	}

    	int index = (page -1) *10;
    	int page_cnt = mydao.page_cnt();
    	int pstart = page /10; // 1~9까지는 0, 10은 1
    	if(page %10 == 0)
    		
    		pstart = pstart -1;

    	pstart = (pstart *10) +1;
    	
    	int pend = pstart +9;
    	if(pend > page_cnt)
    		
    		pend = page_cnt;
    	
    	String field = request.getParameter("field");
    	String word;
    	if(field == null || field.equals("empty")) {
    		
    		field = "watch_id";
    		word = "";
    	} else {
    		
    		field = request.getParameter("field");
    		word = request.getParameter("word");
    	}
    	
    	String email = request.getParameter("email");
    			
    	ArrayList<MypageDto> list = mydao.order_list(email, field, word, index);
    	
    	model.addAttribute("list", list);
    	model.addAttribute("field", field);
    	model.addAttribute("word", word);
    	model.addAttribute("email", email);
    	model.addAttribute("pstart", pstart);
    	model.addAttribute("pend", pend);
    	model.addAttribute("page", page);
    	model.addAttribute("page_cnt", page_cnt);
    	
    	return "mypage/order_list";
    }
    
    @RequestMapping("/mypage/order_detail")
    public String order_detail(Model model, HttpServletRequest request) {
    	
    	MypageDao mydao = sqlSession.getMapper(MypageDao.class);
    	String id = request.getParameter("id");
    	MypageDto list2 = mydao.order_detail(id);

    	model.addAttribute("list", list2);
    	
    	return "mypage/order_detail";
    }
    
    @RequestMapping("/mypage/enquiry")
    public String enquiry(Model model, HttpServletRequest request) {
    	
    	MypageDao mydao = sqlSession.getMapper(MypageDao.class);
    	
    	String email = request.getParameter("email");
    	ArrayList<MypageDto> enquiry = mydao.enquiry(email);
    	
    	model.addAttribute("enquiry", enquiry);
    	
    	return "mypage/enquiry";
    }
    
    @RequestMapping("/mypage/wishlist")
    public String wishlist(Model model, HttpServletRequest request) {
    	
    	MypageDao mydao = sqlSession.getMapper(MypageDao.class);
    	
    	String email = request.getParameter("email");
    	ArrayList<MypageDto> wishlist = mydao.wishlist(email);
    	
    	model.addAttribute("wishlist", wishlist);
    	
    	return "mypage/wishlist";
    }
    
    @RequestMapping("/mypage/enquiry_detail")
    public String enquiry_detail() {
    	
    	
    	
    	return "mypage/enquiry_detail";
    }
    
    @RequestMapping("/mypage/watch-care")
    public String watchcare(){
    	
    	return "mypage/watch-care";
    }
}
