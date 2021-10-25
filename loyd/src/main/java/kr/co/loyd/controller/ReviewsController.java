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

import kr.co.loyd.dao.AddfileDao;
import kr.co.loyd.dao.ReviewsDao;
import kr.co.loyd.dto.AddfileDto;
import kr.co.loyd.dto.ReviewWriteDto;
import kr.co.loyd.dto.ReviewsDto;
import kr.co.loyd.dto.ReviewsMultipartDto;

@Controller
public class ReviewsController {

	@Autowired
	private SqlSession sqlSession;

	/** 리뷰 작성 페이지 */
	@RequestMapping("/reviews/write")
	public String writePage(ReviewsDto rdto, HttpServletRequest request, Model model) {

		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);

		// 작성된 리뷰를 담는 기능 (페이지로 보낼 명령)
		model.addAttribute("watchId", rdto.getWatch_id());
		model.addAttribute("memberId", 1);

		return "/reviews/write";
	}

	/** 리뷰 작성 ok */
	@RequestMapping("/reviews/write_ok")
	public String write_ok(ReviewWriteDto dto, MultipartHttpServletRequest request)
			throws IOException {

		MultipartFile multipartFile = request.getFile("name");
				
		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		
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

		// System.out.println(dto.getWatch_id());
		// System.out.println(dto2.getName());
		// System.out.println(dto2.getPath());

		return "redirect:/reviews/list";

	}

	/*
	 * @RequestMapping ("/reviews/reviewfiles_ok") public String reviewfiles_ok
	 * (AddfileDto adto,Model model) {
	 * 
	 * ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
	 * rdao.writeOk2(adto); // model.addAttribute("reviewfiles",img);
	 * 
	 * return "redirect:/reviews/list";
	 * 
	 * }
	 */

	/** 리뷰 목록 페이지 */
	@RequestMapping("/reviews/list")
	public String listPage(HttpServletRequest request, Model model, ReviewsDto rdto) {

		int page;
		if (request.getParameter("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));

		}
		int index = (page - 1) * 5;
		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		ArrayList<ReviewsDto> list = rdao.list(index);

		// page, pstart, pend, page_cnt
		// 페이지 , 페이지 시작 , 페이지끝, 페이지 카운트

		// pstart = 1, 11, 21, 31
		// pend = 10, 20, 30, 40

		int pstart = page / 10;

		// pstart = 11 / 10 = 1 start 1
		// pend = 1 + 9 = 10 end 10

		// pstart = 6/5 = 1 start = 1
		// pend = 1 + 4 = 5 end = 5

		// 27 행 / 5개씩 = 5

		// 0 % 5 = 0 true

		if (page % 10 == 0)
			pstart = pstart - 1;
		pstart = (pstart * 10) + 1;
		int pend = pstart + 9;
		int page_cnt = rdao.get_pagecount();

		if (pend > page_cnt)
			pend = page_cnt;

		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page_cnt", page_cnt);
		model.addAttribute("pstart", pstart);

		model.addAttribute("reviews", list);

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
	public String content() {

		return "/reviews/content";
	}

}
