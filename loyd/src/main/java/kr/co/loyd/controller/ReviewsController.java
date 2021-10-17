package kr.co.loyd.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartRequest;

import kr.co.loyd.dao.ReviewsDao;
import kr.co.loyd.dto.ReviewsDto;

@Controller
public class ReviewsController {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	/** 리뷰 목록 페이지 */
	@RequestMapping("/reviews/list")
	public String listPage() {
	
		return "/reviews/list";
	}
	
	
	/** 리뷰 작성 페이지 */
	@RequestMapping("/reviews/write")
	public String writePage() {
	
		return "/reviews/write";
	}
	
	/** 리뷰 작성 ok */
	@RequestMapping ("/reviews/write_ok")
	public String write_ok (ReviewsDto dto){
	
		System.out.println(dto.getMemberId()); 
		System.out.println(dto.getContent());
		System.out.println(dto.getWatchId());
	
		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		rdao.writeOk(dto);

		return  "redirect:/reviews/list"; 

	}
	
	// 학원에서 pull받기
	

	

	
	
	
	
	
	
	
	
	
	
}




















