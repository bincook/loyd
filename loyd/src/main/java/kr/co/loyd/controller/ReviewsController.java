package kr.co.loyd.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import kr.co.loyd.dao.ReviewsDao;
import kr.co.loyd.dto.AddfileDto;
import kr.co.loyd.dto.ReviewsDto;
import kr.co.loyd.dto.ReviewsMultipartDto;

@Controller
public class ReviewsController {
	
	
	@Autowired
	private SqlSession sqlSession;

	
	/** 리뷰 작성 페이지 */
	@RequestMapping("/reviews/write")
	public String writePage() {
	
		return "/reviews/write";
	}
	
	/** 리뷰 작성 ok */
	   @RequestMapping ("/reviews/write_ok")
	   public String write_ok (ReviewsDto dto,  MultipartHttpServletRequest request, ReviewsMultipartDto rmdto) throws IOException {

		  
		   MultipartFile multipartFile = request.getFile("NAME");
//	      MultipartFile multipartFile = request.getFile("localhost/loyd/reviews/list"+"file");
	      if(!multipartFile.isEmpty()) {
		      String realPath = request.getSession().getServletContext().getRealPath("resources/img");	
		      File file = new File(realPath, multipartFile.getOriginalFilename());
		      FileCopyUtils.copy(multipartFile.getBytes(), file);
	      }
	      
	      ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
	      rdao.writeOk1(dto);


	      return  "redirect:/reviews/list"; 

	   }
	   
	   @RequestMapping ("/reviews/reviewfiles_ok")
	   public String reviewfiles_ok (AddfileDto adto) {
		   
		   ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		   rdao.writeOk2(adto);
		   
		   
		   
		   return "redirect:/reviews/list";
		   
	   }
	   
	   
	
	  
	/** 리뷰 목록 페이지 */
	@RequestMapping("/reviews/list")
	public String listPage(Model model,ReviewsDto rdto) {
		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);

		ArrayList<ReviewsDto> list = rdao.list(rdto);

		model.addAttribute("reviews", list);
		
		return "/reviews/list";
	}
	
	@RequestMapping("/reviews/readnum")
	public String view(HttpServletRequest request) {
		
		
		int reviewId = Integer.parseInt(request.getParameter("review_id"));
		
		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		rdao.readnum(reviewId);
		
		return "redirect:/reviews/content?review_id="+reviewId;
	}
	
	@RequestMapping ("/reviews/content")
	public String content() {
		
		return "redirect:/reviews/content";
	}

	
	
	
	
	
	

	

	

	
	
	
	
	
	
	
	
	
	
}




















