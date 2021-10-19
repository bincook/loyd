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
	public String write_ok (MultipartHttpServletRequest request){
		
		String content = request.getParameter("content");
		
		MultipartFile file = request.getFile("file");
		
		System.out.println(content);
		System.out.println(file.getName());
		System.out.println(file.getOriginalFilename());
		
		File f = new File("D:\\spring_suup\\.me/tadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\loyd\\resources\\img\\", file.getOriginalFilename());
		
		//String p = request.getRealPath("/img");
		//System.out.println("path -> " + p);
			
		// File f = new File(request.getRealPath("/img"), file.getOriginalFilename());		
		try {
			FileCopyUtils.copy(file.getBytes(), f);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println("에러");
		}			

//		ReviewsDto rdto=new ReviewsDto();
//		rdto.setTitle(multi.getParameter("title"));
		
//		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
//		rdao.writeOk(dto);

		return  "redirect:/reviews/list"; 

	}
	
	/** 리뷰 목록 페이지 */
	@RequestMapping("/reviews/list")
	public String listPage(Model model,ReviewsDto rdto) {
		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);

		ArrayList<ReviewsDto> list = rdao.list(rdto);

		model.addAttribute("", list);
		
		return "/reviews/list";
	}
	
	// 집에서 push 받기
	
	
	
	

	

	

	
	
	
	
	
	
	
	
	
	
}




















