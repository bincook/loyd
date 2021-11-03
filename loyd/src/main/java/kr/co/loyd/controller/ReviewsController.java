package kr.co.loyd.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import kr.co.loyd.dao.AddfileDao;
import kr.co.loyd.dao.MberDao;
import kr.co.loyd.dao.ReviewsDao;
import kr.co.loyd.dao.WatchDao;
import kr.co.loyd.dto.AddfileDto;
import kr.co.loyd.dto.MberDto;
import kr.co.loyd.dto.ReviewWriteDto;
import kr.co.loyd.dto.ReviewsDto;
import kr.co.loyd.dto.ReviewsMultipartDto;
import kr.co.loyd.dto.WatchDto;

@Controller
public class ReviewsController {

	@Autowired
	private SqlSession sqlSession;

	/** 리뷰 작성 페이지 */
	@RequestMapping("/reviews/write")
	public String writePage(ReviewsDto rdto, HttpServletRequest request, Model model, HttpSession session) {
		
		// 세션에 있는 member id로 가져오기, session이 없을경우 다시 로그인 페이지로 이동
		
		
		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);

//		 작성된 리뷰를 담는 기능 (페이지로 보낼 명령)
		model.addAttribute("watchId", rdto.getWatch_id());
		
		// watch 테이블에서 시게이름 가져오기
//		model.addAttribute("memberId", 1);
		System.out.println("watchId");

		return "/reviews/write";
	}
	
	
	
	

	/** 리뷰 작성 ok */
	@RequestMapping("/reviews/write_ok")
	public String write_ok(HttpSession session, ReviewWriteDto dto, MultipartHttpServletRequest request) throws IOException {

		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		
		// 로그인을 하지않으면 로그인페이지로 이동하기
		Object memberIdObj = session.getAttribute("memberId");  // 여기에 멤버  table 정보가 담겨있음
		
		if(memberIdObj==null) {
			return "redirect:/mber/login";
		}
		String memberId = ""+ memberIdObj;
		dto.setMember_id(Integer.parseInt(memberId));
		
		
//		// watch 테이블에서 시게이름 가져오기
		// 마이페이지나 상품 상세페이지 가장 하단이 적절해보여요 (watch_id 받아오기)
//		WatchDto wdto2 = rdao.input_watch(wdto);
//		rdao.input_watch(wdto);
//		session.setAttribute("watch_name", wdto2.getName());


		
		// 이미지적용
		MultipartFile multipartFile = request.getFile("name");
		
		

		// MultipartFile multipartFile =
		// request.getFile("localhost/loyd/reviews/list"+"file");
		// 파일 있는 경우
		if (!multipartFile.isEmpty()) {
			String realPath = request.getSession().getServletContext().getRealPath("resources/img");
			File file = new File(realPath, multipartFile.getOriginalFilename()); // 파일명
			String filename = multipartFile.getOriginalFilename(); // 파일명 // NAME으로 저장
			String path = "resources/img"; // 파일경로 // path로 저장
			FileCopyUtils.copy(multipartFile.getBytes(), file); // 파일 저장 됨

			AddfileDao adao = sqlSession.getMapper(AddfileDao.class);

			// dto 생성
			AddfileDto addFileDto = new AddfileDto();
			addFileDto.setName(filename);
			addFileDto.setPath(path);

			// add_file 테이블에 insert 쿼리문
			
			int insertedId = adao.insert(addFileDto);

			// 방금 addFile 테이블에 저장되 었던 id 를 reviews_dto.file_id 에 넣기
			dto.setFile_id(insertedId);

			rdao.writeOk2(dto);

			// 파일 없는 경우
		} else {
			rdao.writeOk1(dto);
		}



		return "redirect:/reviews/list";
	}

	@RequestMapping("/reviews/list")
	public String listPage(WatchDto wdto, HttpSession session, HttpServletRequest request, Model model ) {


		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
//		// 로그인을 하지않으면 로그인페이지로 이동하기
//		Object memberIdObj = session.getAttribute("memberId");  // 여기에 멤버  table 정보가 담겨있음
//		
////		if(memberIdObj==null) {
////			return "redirect:/mber/login";
////		}
//		String memberId = ""+ memberIdObj;
//		rdto.setMember_id(Integer.parseInt(memberId));
		
		
		
		// 검색
		int page;
		String field, word;
		
		// 검색한 키워드 기준으로 목록 생성
		// 페이지징
		if (request.getParameter("page")==null) {
			page = 1;
		}
		else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int index = (page -1) *10;
		field = request.getParameter("field");
		word = request.getParameter("word");
		
		if (field == null) {
			field = "content"; 
		}
		if (word == null) {
			word = "";
		}
		ArrayList <ReviewsDto> list2 = rdao.list2(field, word, index);
		
		model.addAttribute("reviews",list2);
		model.addAttribute("field",field);
		model.addAttribute("word",word);
		
		int pstart = page / 10;
		if(page % 10 ==0) // 1 mod 10 == 1
			pstart = pstart -1;
		pstart = (pstart * 10) +1;
		
		int pend = pstart +9;
		int page_cnt = rdao.get_pagecount(field, word);
		
		if (pend > page_cnt)
			pend = page_cnt;
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("page_cnt",page_cnt);
		
		// reviews와 member 테이블을 합친후 member_id 대신 member의 name 불러오기

		
//		int review_id=Integer.parseInt(request.getParameter("review_id"));
//
//		ReviewsDto rdto = rdao.getRvmem(review_id);
////		rdao.content(rdto);
//		model.addAttribute("getRvmem",rdto);
		
		
		return "/reviews/list";
	}


	@RequestMapping("/reviews/readnum")
	public String view(HttpServletRequest request) {

		int reviewId = Integer.parseInt(request.getParameter("review_id"));

		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		rdao.readnum(reviewId);

		return "redirect:/reviews/content?review_id=" + reviewId;
	}

	/** 내용 페이지 **/
	@RequestMapping("/reviews/content")
	public String content(Model model, HttpServletRequest request) {
				
		int review_id=Integer.parseInt(request.getParameter("review_id"));
		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		ReviewsDto rdto = rdao.content(review_id);
//		rdao.content(rdto);
		model.addAttribute("reviews",rdto);
		
		
		/* 댓글 페이지 */
		// 만들려면 댓글 테이블 만들어야함!

		return "/reviews/content";
		
	}
	
	/** 삭제 페이지 **/
	@RequestMapping("/reviews/delete")
	public String delete(HttpServletRequest request) {

		
		int review_id = Integer.parseInt(request.getParameter("review_id"));
		
		System.out.println("review Id -> " + review_id);
		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		rdao.delete(review_id);
		
		//삭제전 비밀번호 다시한번더 묻기
		
		
		return "redirect:/reviews/list";

	}
	
	
	//** 수정 페이지 **//
	@RequestMapping ("/reviews/update")
	public String update(Model model, HttpServletRequest request) {
		
		int review_id=Integer.parseInt(request.getParameter("review_id"));
		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		ReviewsDto rdto = rdao.update(review_id);   // content에선 review_id로 썼었음 
		model.addAttribute("update_dto",rdto);	
	
		return "/reviews/update";
		
	}

	
	//** 수정_ok 페이지 **//*
	@RequestMapping ("/reviews/update_ok")
	public String update_ok(HttpSession session, ReviewWriteDto dto, MultipartHttpServletRequest request) throws IOException {
		
		System.out.println("aads");
		System.out.println(dto);
		
		
		
//		ReviewsDao dao = sqlSession.getMapper(ReviewsDao.class);
//		System.out.println("===========================================");
//		
//		// 수정확인
//		dao.update_ok(dto);
		
		
		
		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		
		// 로그인을 하지않으면 로그인페이지로 이동하기
		Object memberIdObj = session.getAttribute("memberId");  // 여기에 멤버  table 정보가 담겨있음
		
		if(memberIdObj==null) {
			return "redirect:/mber/login";
		}
		String memberId = ""+ memberIdObj;
		dto.setMember_id(Integer.parseInt(memberId));
		
		
//		// watch 테이블에서 시게이름 가져오기
		// 마이페이지나 상품 상세페이지 가장 하단이 적절해보여요 (watch_id 받아오기)
//		WatchDto wdto2 = rdao.input_watch(wdto);
//		rdao.input_watch(wdto);
//		session.setAttribute("watch_name", wdto2.getName());


		
		// 이미지적용
		MultipartFile multipartFile = request.getFile("name");
		
		

		// MultipartFile multipartFile =
		// request.getFile("localhost/loyd/reviews/list"+"file");
		// 파일 있는 경우
		if (!multipartFile.isEmpty()) {
			String realPath = request.getSession().getServletContext().getRealPath("resources/img");
			File file = new File(realPath, multipartFile.getOriginalFilename()); // 파일명
			String filename = multipartFile.getOriginalFilename(); // 파일명 // NAME으로 저장
			String path = "resources/img"; // 파일경로 // path로 저장
			FileCopyUtils.copy(multipartFile.getBytes(), file); // 파일 저장 됨

			AddfileDao adao = sqlSession.getMapper(AddfileDao.class);

			// dto 생성
			AddfileDto addFileDto = new AddfileDto();
			addFileDto.setName(filename);
			addFileDto.setPath(path);

			// add_file 테이블에 insert 쿼리문
			
			int insertedId = adao.insert(addFileDto);

			// 방금 addFile 테이블에 저장되 었던 id 를 reviews_dto.file_id 에 넣기
			dto.setFile_id(insertedId);

			rdao.update_ok2(dto);

			// 파일 없는 경우
		} else {
			rdao.update_ok1(dto);
		}



//		return "redirect:/reviews/list";	
		return "redirect:/reviews/content?review_id="+dto.getReview_id();

		
	}
	
	@RequestMapping ("reviews/test")
	public String test() {
		return "reviews/test";
	}
	
	
	/* 댓글 만들기 */
	
	/* 수정 완성하기 */
	
	/* 댓글 페이지 */
	
	/* 테이블 필요 */
}



















