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
	public String write_ok(ReviewWriteDto dto, MultipartHttpServletRequest request) throws IOException {

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
	 * @RequestMapping("reviews/list") public String listPage(HttpServletRequest
	 * request, Model model, ReviewsDto rdto) {
	 * 
	 * ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
	 * 
	 * // --------------검색------------------ int page; // 내장함수 사용가능? String field,
	 * word;
	 * 
	 * // 검색안했을 때 if(request.getParameter("field")==null) { // 전체 구매후기 나와야겠죠
	 * field="content"; word=""; } // 검색을 했을 때 else { // 검색한 키워드 기준으로 목록이 나와야 돼요
	 * 
	 * field=request.getParameter("field"); word=request.getParameter("word");
	 * ArrayList<ReviewsDto> list2 = rdao.list2(field,word);
	 * model.addAttribute("list2",list2); model.addAttribute("field",field);
	 * model.addAttribute("word",word); }
	 * 
	 * // ----------------리스트 페이징----------------- // 1페이지에 10개씩 출력한다고 해보자 // 처음
	 * page를 불러왔을때 null값이니까 page=1 값을 주기 if (request.getParameter("page")==null) {
	 * page=1; } else {
	 * 
	 * page=Integer.parseInt(request.getParameter("page")); // Integer.parseInt ==
	 * 문자형을 숫자형으로 변형해야함 }
	 * 
	 * //total = 행번호 // page, pstart, pend(lastpage), page_cnt, index (?) // 페이지 ,
	 * 페이지 시작 , 페이지끝, 페이지 카운트
	 * 
	 * 
	 * // page 1->0, page 2->10, page 3->20, page 4->30 int index = (page -1) *10;
	 * // 3누르면 20부터 10개출력
	 * 
	 * ArrayList<ReviewsDto> list = rdao.list(index);
	 * 
	 * 
	 * // 각 페이지 범위 시작번호(1, 11, 21, 31) int pstart = page/10; // 3누르면 0.3 // page
	 * 11일때 pstart가 1 if (page % 10 == 0) // % == 몫, 나머지 구하기 // 제일 마지막 페이지 왔을때 (10,
	 * 20, 30) // mod 연산자 pstart = pstart -1; // pstart pstart = (pstart * 10) +1;
	 * 
	 * // 각 페이지 범위 끝번호 (10, 20, 30, 40) int pend = pstart +9;
	 * 
	 * // 전체 페이지 범위의 개수 int page_cnt = rdao.get_pagecount();
	 * 
	 * if (pend>page_cnt) // pend(무조건 10, 20, 30) > page_cnt(23 누르면 pend=30 ) //
	 * pend를 23으로 만들어주기 pend = page_cnt;
	 * 
	 * 
	 * model.addAttribute("page", page); model.addAttribute("pstart", pstart);
	 * model.addAttribute("pend", pend); model.addAttribute("page_cnt", page_cnt);
	 * 
	 * model.addAttribute("reviews", list);
	 * 
	 * 
	 * 
	 * // return "redirect:/reviews/list"; return "reviews/list";
	 * 
	 * 
	 * 
	 * 
	 * 
	 * --------------ex)----------------------
	 * 
	 * 
	 * // 19 -> 2, 29 -> 3, 39 -> 4
	 * 
	 * //total = 행번호 // page, pstart, pend, page_cnt // 페이지 , 페이지 시작 , 페이지끝, 페이지 카운트
	 * 
	 * String vpage = request.getParameter("vpage"); // int는 안된다 넘어오는건 무조건 string
	 * 이다. 데이터가 넘어왔으니 숫자처리 해야함 if (vpage == null){ // 페이지를 그냥 연거 vpage = "1"; } int
	 * v_page = Integer.parseInt(vpage); // page는 내장함수라서 못쓰니까 v_page라고 줌 // 완전히
	 * int형으로 변환완료.
	 * 
	 * 
	 * // 밑에서 limit를 (시작번호, 출력갯수)에서 출력갯수 0부터 10개씩 나오게 설정했음. // 사용자가 1페이지를 보려고하면 0이
	 * 대입, 2페이지 ->10이 대입, 3페이지 ->20 // 1->0부터 10개, 2-> 10부터 10개, 3->20부터 10개 4->30
	 * // 여기서 1, 2, 3, 4 는 v_page. int index_no = (v_page-1)*10;
	 * 
	 * // 가장 중요한게 출력 // 그냥 select 하면 다나오니까 10개만 나오게 하기 // sql에 limit 주기
	 * (0,10)==(시작번호, 출력갯수) // (index,10) // (맨 위를 0번으로 인식함, 마지막값 미포함해서 0~9까지 10개
	 * 출력됨) //
	 * 
	 * 
	 * 
	 * int listpage = (int)Math.ceil((double)total/10) // 12까지 있으면 10나누면 1.2니까 올림을
	 * 해줘야 2페이지까지 나옴 // int 정수형, 나누기 정수형, double 실수형
	 * 
	 * 
	 * 1~10 1 (page)
	 * 
	 * 11~20 1 2
	 * 
	 * 21~30 1 2 3
	 * 
	 * for (int i=1; i<=lastpage; i++) { // out.print("<a href='list.jsp?vpage=" +i+
	 * "'>" +i+ "<a> "); // 공백줘서 12처럼 안보이게 하기 // i=1이 시작페이지, 2가 끝나는 페이지가 돼야 되곘네
	 * 
	 * <a href="list.jsp?vpage=<%=i%>"><%=i%></a>
	 * 
	 * 
	 * }
	 * 
	 * 
	 * 
	 * 
	 * -------------------------------------------
	// 1. 검색했을 때 (else)
	//   1-1. 검색 필드랑(field) 값(word) 가져오기
	//   1-2. select * from reviews where ${param1} like concat('%', ${param2} ,'%')
	
	
	//   1-3. 총 페이지 수 구하기 (where 포함)
	//        select ceil (count(*)/10) from reviews where ${param1} like concat('%', ${param2} ,'%')
	
	
	//   1-4. 1-3 에서 가져온 총 페이지수로  페이지 계산하기 (page, pstart, pend, page_cnt 등)
	
	
	//   1-5. 1-2 에서 가져온 reviews 를  model 에 담기 => model.addAttribute("reviews", 1-3에서 가져온 reviews ArrayList 변수)

	// 2. 검색안했을 때(if)
	// 2-1. 1에서  word가 없다면 전체 조회 되기 때문에 따로 처리할 필요 없음
	 * 
	 * 
	 * 
	 * 
	 * }
	 */

	@RequestMapping("/reviews/list")
	public String listPage(HttpServletRequest request, Model model, ReviewsDto rdto) {

		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);

		// --------------검색------------------
		int page; // 내장함수 사용가능?
		String field, word;

		// 검색한 키워드 기준으로 목록이 나와야 돼요

		// 페이징..
		if (request.getParameter("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// page 1->0, page 2->10, page 3->20, page 4->30
		int index = (page - 1) * 10; // 3누르면 20부터 10개출력

		field = request.getParameter("field");
		word = request.getParameter("word");
		
		if (field == null) {
			field = "content";
		}
		if (word == null) {
			word = "";
		}

		/*System.out.println(field);
		System.out.println(word);*/

		ArrayList<ReviewsDto> list2 = rdao.list2(field, word, index); // img가 안나오니까 index로  img param3 주기



		/*
		 * model.addAttribute("list2",list2); 
		 * model.addAttribute("field",field);
		 * model.addAttribute("word",word);
		 */

		model.addAttribute("reviews", list2); //list1과 reviews 공유 가능
		model.addAttribute("field", field);
		model.addAttribute("word", word);

		// 각 페이지 범위 시작번호(1, 11, 21, 31)
		int pstart = page / 10;
		if (page % 10 == 0)
			pstart = pstart - 1;
		pstart = (pstart * 10) + 1;

		int pend = pstart + 9;
		int page_cnt = rdao.get_pagecount(field, word);

		if (pend > page_cnt)
			pend = page_cnt;

		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page_cnt", page_cnt);

		// ----------------리스트 페이징----------------- //

		
		return "reviews/list";

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

		return "/reviews/content";
	}

	@RequestMapping("/reviews/delete")
	public String delete(Model model) {
		
		
		
		
		return "/reviews/list";
	}
	
	

}



















