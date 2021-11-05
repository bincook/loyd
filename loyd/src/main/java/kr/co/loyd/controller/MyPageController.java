package kr.co.loyd.controller;



import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.loyd.dao.MypageDao;
import kr.co.loyd.dto.MemberDto;
import kr.co.loyd.dto.MypageDto;

@Controller
public class MyPageController {

	@Autowired
	public SqlSession sqlSession;
	
    /** 마이페이지 */
    @RequestMapping(value = "/mypage/info", method = RequestMethod.GET)
    public String cartListPage(Model model, HttpSession session) {
    	
//    	Get session `member` id and `member` email 
    	Integer memberId = (Integer) session.getAttribute("id");
    	Object email = session.getAttribute("email"); 
    			
    	MypageDao mydao = sqlSession.getMapper(MypageDao.class);

//		receive table `order_detail` brief
    	
//    	ArrayList<MypageDto> order = mydao.info(memberId);
    	ArrayList<MypageDto> order = mydao.info(email);
    	model.addAttribute("order_pay", order);
    	
    	// dao.selectMyOrder(memberId)
    	

        return "mypage/info";
    }
    
    
    @RequestMapping("/mypage/order_list")
    public String order_list(HttpServletRequest request, Model model, HttpSession session) {
    	
    	MypageDao mydao = sqlSession.getMapper(MypageDao.class);
    	Integer memberId = (Integer) session.getAttribute("id");
    	// 페이징 처리하기
    	int page;
    	if(request.getParameter("page")==null){

    		page = 1;
    	} else {
    		
    		page = Integer.parseInt(request.getParameter("page"));
    	}

    	int index = (page -1) *10;
    	int page_cnt = mydao.page_cnt(memberId);
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
    	
    	Object email = session.getAttribute("email");
    	
    	System.out.println(email);
    	System.out.println(memberId);
    	
    	ArrayList<MypageDto> list = mydao.order_list(memberId, field, word, index);
    	
    	model.addAttribute("list", list);
    	model.addAttribute("field", field);
    	model.addAttribute("word", word);
    	model.addAttribute("pstart", pstart);
    	model.addAttribute("pend", pend);
    	model.addAttribute("page", page);
    	model.addAttribute("page_cnt", page_cnt);
    	
    	return "mypage/order_list";
    }
    
    @RequestMapping("/mypage/item_detail")
    public String order_detail(Model model, HttpServletRequest request) {
    	
    	MypageDao mydao = sqlSession.getMapper(MypageDao.class);
    	String id = request.getParameter("id");
    	MypageDto list2 = mydao.item_detail(id);

    	model.addAttribute("list", list2);
    	
    	return "mypage/item_detail";
    }
    
    @RequestMapping("/mypage/enquiry")
    public String enquiry(Model model, HttpSession session) {
    	
    	MypageDao mydao = sqlSession.getMapper(MypageDao.class);
    	
    	Object email = session.getAttribute("email");
    	ArrayList<MypageDto> enquiry = mydao.enquiry(email);
    	
    	model.addAttribute("enquiry", enquiry);
    	
    	return "mypage/enquiry";
    }
    
    @RequestMapping("/mypage/wishlist")
    public String wishlist(Model model, HttpSession session) {
    	
    	MypageDao mydao = sqlSession.getMapper(MypageDao.class);
    	
    	Object email = session.getAttribute("email");
    	ArrayList<MypageDto> wishlist = mydao.wishlist(email);
    	
    	model.addAttribute("wishlist", wishlist);
    	
    	return "mypage/wishlist";
    }
    
    @RequestMapping("/mypage/enquiry_detail")
    public String enquiry_detail(Model model, HttpServletRequest request) {
    	
    	MypageDao mydao = sqlSession.getMapper(MypageDao.class);

    	String qna_id = request.getParameter("qna_id");
    	MypageDto mydto = mydao.enquiry_detail(qna_id);
    	
    	model.addAttribute("enquiry_d", mydto);
    	
    	return "mypage/enquiry_detail";
    }
    
    @RequestMapping("/mypage/member_edit")
    public String member_edit(Model model, HttpServletRequest request) {
    	
    	MypageDao mydao = sqlSession.getMapper(MypageDao.class);

    	String email = request.getParameter("email");
    	MemberDto mdto = mydao.member_edit(email);
    	
    	model.addAttribute("member", mdto);
    	
    	return "mypage/member_edit";
    }
    
    @RequestMapping("/mypage/member_edit_ok")
    public String member_edit_ok(MemberDto mdto) {
    	
    	MypageDao mydao = sqlSession.getMapper(MypageDao.class);

    	mydao.member_edit_ok(mdto);
    	
    	return "redirect:/mypage/info";
    }
    
    @RequestMapping("/mypage/watch-care")
    public String watchcare(){
    	
    	return "mypage/watch-care";
    }
    
    @RequestMapping("/mypage/order_detail")
    public String order_detail(Model model,HttpServletRequest request, HttpSession session) {
    	
    	String order_no = request.getParameter("order_no");
    	MypageDao mydao = sqlSession.getMapper(MypageDao.class);
    	Object email = session.getAttribute("email");
    	Integer memberId = (Integer) session.getAttribute("id");
    	
    	MypageDto order1 = mydao.order_detail1(email, order_no);
    	ArrayList<MypageDto> order = mydao.order_detail(memberId, order_no);
    	model.addAttribute("order_d", order);
    	model.addAttribute("order_detail", order1);
    	
    	return "mypage/order_detail";
    }
}
