package kr.co.loyd.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.loyd.dao.AddfileDao;

import kr.co.loyd.dao.ReviewsDao;

import kr.co.loyd.dto.AddfileDto;

import kr.co.loyd.dto.ReviewWriteDto;
import kr.co.loyd.dto.ReviewsDto;


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
		model.addAttribute("content", rdto.getContent());
		
		// watch 테이블에서 시게이름 가져오기
//		model.addAttribute("id", 1);
		System.out.println("watchId");
		
		return "/reviews/write";
	}
	
	
	
	

	/** 리뷰 작성 ok */
	@RequestMapping("/reviews/write_ok")
	public String write_ok(HttpSession session, ReviewWriteDto dto, MultipartHttpServletRequest request) throws IOException {

		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		
		// 로그인을 하지않으면 로그인페이지로 이동하기
		Object idObj = session.getAttribute("id");  // 여기에 member  table 정보가 담겨있음
		
		if(idObj==null) {
			return "redirect:/mber/login";
		}
		String id = ""+ idObj;
		dto.setMember_id(Integer.parseInt(id));
		
		// 이미지적용
		MultipartFile multipartFile = request.getFile("name");
		
		
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
		
		
		
	
	
	/* 후기 리스트 페이지 */
	@RequestMapping("/reviews/list")
	public String listPage( HttpSession session, HttpServletRequest request, Model model ) {


		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		
		// 좋아요 기능
		Integer id = (Integer) session.getAttribute("id");  // 나중에 그냥 id로 바꿔주기
		String review_id = request.getParameter("review_id");
		
		// 해당 구매후기에 좋아요를 했는지 조회하기
		// 내가 좋아요를 하면 1개, 다른사람이 좋아요를 한경우엔 id 조건때문에 0이 된다.
		int reviewLikeCount = rdao.reviewLikeCount(review_id);  
		
		// 로그인유무 상관없이 좋아요 개수는 보여주기
		model.addAttribute("likeCount", reviewLikeCount);
		
		// 만약 로그인을 했으면서 좋아요를 한 경우
		if (id != null) {
			int likeCount = rdao.likeCount(id, review_id);
			
			// 해당글에 좋아요 개수가 1개라도 있다면
			if(likeCount >0) {
				
				// 좋아요 취소를 위한 값 model에 담기
				model.addAttribute("isliked", true);
				
			// 해당글에 좋아요를 하지 않은 경우
			} else {
				model.addAttribute("isliked", false);
			}
		// 로그인을 하지 않은경우 좋아요 버튼 클릭 불가능 
		} else {
			model.addAttribute("isliked", false);
		}

		
		
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
		model.addAttribute("field",field); // 검색필드
		model.addAttribute("word",word);  // 검색단어
		
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
	public String content(HttpSession session, Model model, HttpServletRequest request) {
				
//		int review_id=Integer.parseInt(request.getParameter("review_id"));

		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		
		Integer id = (Integer) session.getAttribute("id");  // 나중에 그냥 id로 바꿔주기
		String review_id = request.getParameter("review_id");
		
		// 해당 구매후기에 좋아요를 했는지 조회하기
		// 내가 좋아요를 하면 1개, 다른사람이 좋아요를 한경우엔 id 조건때문에 0이 된다.
		int reviewLikeCount = rdao.reviewLikeCount(review_id);  // 내가 좋아요를 했는지 여부?
		
		// 로그인유무 상관없이 좋아요 개수는 보여주기
		model.addAttribute("likeCount", reviewLikeCount);
		
		// 만약 로그인을 했으면서 좋아요를 한 경우
		if (id != null) {
			int likeCount = rdao.likeCount(id, review_id);
			
			// 해당글에 좋아요 개수가 1개라도 있다면
			if(likeCount >0) {
				
				// 좋아요 취소를 위한 값 model에 담기
				model.addAttribute("isliked", true);
				
			// 해당글에 좋아요를 하지 않은 경우
			} else {
				model.addAttribute("isliked", false);
			}
		// 로그인을 하지 않은경우 좋아요 버튼 클릭 불가능 
		} else {
			model.addAttribute("isliked", false);
		}
		ReviewsDto rdto = rdao.content(review_id);
		model.addAttribute("reviews",rdto);
		return "/reviews/content";
	}
	
	@RequestMapping ("reviews/like")
	public String like (ReviewsDto dto, HttpSession session, HttpServletRequest request) {
		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		
		// 좋아요를 누른사람
		Integer id = (Integer) session.getAttribute("id");
			
		// 좋아요 할 글
		String reviewId = request.getParameter("reviewId");
		
		// 좋아요 한사람인지 count 세기
		int likeCount = rdao.likeCount(id, reviewId);
		
		// 좋아요를 안한 사람인 경우
		if (likeCount <1) {
			// 후기에 좋아요 하기
			rdao.addLike(id,reviewId);
		// 좋아요를 이미 한 사람인 경우
		} else {
			rdao.subLike(id, reviewId);
		}

		// 좋아요 기능을 만들었으니 이제 해당 페이지에 오면 좋아요 개수를 보여줘야함
		// 그래서 /reviews/content?review_id=?? 에 다른코드를 작성함

		return "redirect:/reviews/content?review_id=" + reviewId;


	}
	

	
	/** 삭제 페이지 **/
	@RequestMapping("/reviews/delete")
	public String delete(HttpSession session, ReviewsDto dto, HttpServletRequest request) {

		
		// 로그인정보와 컨텐츠 정보가 일치할때만 삭제가능하게 하기

		// idObj == ??? 일때 삭제 가능?
		session.setAttribute("delete", dto.getMember_id());
		
		
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

		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		
		// 로그인을 하지않으면 로그인페이지로 이동하기
		Object idObj = session.getAttribute("id");  // 여기에 멤버  table 정보가 담겨있음
		
		if(idObj==null) {
			return "redirect:/mber/login";
		}
		String id = ""+ idObj;
		dto.setMember_id(Integer.parseInt(id));

		
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
	
		return "redirect:/reviews/content?review_id="+dto.getReview_id();

	}
}


