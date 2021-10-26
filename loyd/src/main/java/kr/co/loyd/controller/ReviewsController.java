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


	/** 리뷰 목록 페이지 */
	@RequestMapping("/reviews/list")
	public String listPage(HttpServletRequest request, Model model, ReviewsDto rdto) {
		
		// 페이징 하기
		int page;
		if (request.getParameter("page") == null) {
			page = 1;
		} else {  // page가 최소 널이 아닐때.
			page = Integer.parseInt(request.getParameter("page"));
		}
		int index = (page - 1) * 5;
			// 4페이지라고 가정하면  index = 4 - 1 * 5 == 15?
		
		
		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		ArrayList<ReviewsDto> list = rdao.list(index);
			//배열에 담기

		
		// page, pstart, pend, page_cnt
		// 페이지 , 페이지 시작 , 페이지끝, 페이지 카운트

		// pstart = 1, 11, 21, 31 !!
		// pend = 10, 20, 30, 40  !!

		int pstart = page / 10;
			// page가 4이면
			// pstart = 4/10 = 0
		
		// 그럼 pend는 ?  

		// pstart = 11 / 10 = 1 start 1
		// pend = 1 + 9 = 10 end 10

		// pstart = 6/5 = 1 start = 1
		// pend = 1 + 4 = 5 end = 5

		// 27 행 / 5개씩 = 5

		// 0 % 5 = 0 true

		if (page % 10 == 0)
				// if  페이지(4)  % 10 == 0?
			pstart = pstart - 1;
				// pstart = 0-1 
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
		
		
		// -------search 하기--------
		String field, word; // 변수선언은 제어문 이전에 하기
		if(request.getParameter("field")==null) {
			field="content";
			word="";
		}
		else {
			field=request.getParameter("field");
			word=request.getParameter("word");
		}
		
		ArrayList<ReviewsDto> list2 = rdao.list2(field,word);
		model.addAttribute("list2",list2);
		model.addAttribute("field",field);
		model.addAttribute("word",word);
	
		
		// 1. 검색했을 때 (if)
		//   1-1. 검색 필드랑(field) 값(word) 가져오기
		//   1-2. select * from reviews where ${param1} like concat('%', ${param2} ,'%')
		//   1-3. 총 페이지 수 구하기 (where 포함)
		//        select count(*) from reviews where ${param1} like concat('%', ${param2} ,'%')
		//   1-4. 1-3 에서 가져온 총 페이지수로  페이지 계산하기 (page, pstart, pend, page_cnt 등)
		//   1-5. 1-2 에서 가져온 reviews 를  model 에 담기 => model.addAttribute("reviews", 1-3에서 가져온 reviews ArrayList 변수)
		// 
		// 2. 검색안했을 때(else)
		// 2-1. 1에서  word가 없다면 전체 조회 되기 때문에 따로 처리할 필요 없음
		
		

		
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
//		content

		return "/reviews/content";
	}

}
