package kr.co.loyd.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.UriComponentsBuilder;

import kr.co.loyd.dao.AdminDao;
import kr.co.loyd.dao.CartDao;
import kr.co.loyd.dao.MemberDao;
import kr.co.loyd.dao.OrderDao;
import kr.co.loyd.dao.QnaDao;
import kr.co.loyd.dao.ReviewsDao;
import kr.co.loyd.dao.WatchDao;
import kr.co.loyd.dto.CartDto;
import kr.co.loyd.dto.MemberDto;
import kr.co.loyd.dto.OrderDto;
import kr.co.loyd.dto.QnaDto;
import kr.co.loyd.dto.ReviewsDto;
import kr.co.loyd.dto.WatchDto;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private SqlSession sqlSession;

	private final String module = "/admin";

	/** 관리자 특정회원 조회 페이지 */
	@RequestMapping(value = "/member/list")
	public String list(Model model, HttpServletRequest request) {
		String search_field = request.getParameter("search_field");
		String search_word;
		MemberDao mdao = sqlSession.getMapper(MemberDao.class);

		// 검색을 안했을 때
		if (search_field == null || search_field.equals("sel")) {
			search_field = "sel";
			search_word = "";

		}
		// 검색을 했을 때
		else {
			search_field = request.getParameter("search_field");
			search_word = request.getParameter("search_word");
			// 검색된 회원 정보
			ArrayList<MemberDto> searchMemberList = mdao.listdetail(search_field, search_word);
			model.addAttribute("searchMemberList", searchMemberList);

		}
		model.addAttribute("search_field", search_field);

		// 모든 회원정보
		int page;
		if (request.getParameter("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int page_cnt = mdao.get_cnt();
		int index = (page - 1) * 10;

		int pstart = page / 10;
		if (page % 10 == 0)
			pstart = pstart - 1;
		pstart = (pstart * 10) + 1;
		int pend = pstart + 9;

		if (pend > page_cnt)
			pend = page_cnt;

		ArrayList<MemberDto> list = mdao.list(index);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page_cnt", page_cnt);
		model.addAttribute("page", page);
		model.addAttribute("list", list);

		return "/admin/member/list";
	}

	/** 관리자 회원 전체목록 조회 */
	@RequestMapping(value = "/member/listdetail", method = RequestMethod.GET)
	public String listdetail(Model model, HttpServletRequest request) {

		MemberDao mdao = sqlSession.getMapper(MemberDao.class);
		int page;
		if (request.getParameter("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int page_cnt = mdao.get_cnt();
		int index = (page - 1) * 10;

		int pstart = page / 10;
		if (page % 10 == 0)
			pstart = pstart - 1;
		pstart = (pstart * 10) + 1;
		int pend = pstart + 9;

		if (pend > page_cnt)
			pend = page_cnt;

		ArrayList<MemberDto> list = mdao.list(index);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page_cnt", page_cnt);
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		return "redirect:/admin/member/list";
	}

	/** 관리자 상품 등록(하나의 이미지 등록) */
	@RequestMapping(value = "/watch/upload")
	public String upload() {

		return "/admin/watch/upload";
	}

	@RequestMapping("/watch/upload_ok")
	public String upload_ok(MultipartHttpServletRequest request) throws Exception {

		String imgPath = "resources/img";
		String path = request.getRealPath(imgPath);
		MultipartFile multipartFile = request.getFile("picture");

		// 파일이 있는 경우
		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename()); // 파일명
			String fileName = multipartFile.getOriginalFilename(); // 파일명 // NAME으로 저장
			FileCopyUtils.copy(multipartFile.getBytes(), file);

			// int max=1024*1024*10;
			// MultipartRequest multi=new MultipartRequest(request,path,max,"utf-8",new
			// DefaultFileRenamePolicy());

			// String fileName = multi.getFilesystemName("picture");
			// System.out.println("fileName" + fileName);

			WatchDto wdto = new WatchDto();
			wdto.setName(request.getParameter("name"));
			wdto.setBrand(request.getParameter("brand"));
			wdto.setPrice(Integer.parseInt(request.getParameter("price")));
			wdto.setCategory(request.getParameter("category"));
			wdto.setContent(request.getParameter("content"));
			wdto.setDiscount(Double.parseDouble(request.getParameter("discount")));
			wdto.setPicture(imgPath + "/" + fileName);
			wdto.setKind(request.getParameter("kind"));

			WatchDao wdao = sqlSession.getMapper(WatchDao.class);
			wdao.upload_ok(wdto);

			// 파일이 없을 때
		} else {
			String encodeResult = URLEncoder.encode("첨부파일을 등록해주세요", "utf-8");

			return "redirect:/admin/watch/upload?error=" + encodeResult;
		}

		return "redirect:/admin/watch/watch_list";
	}

	@RequestMapping("/watch/watch_list")
	public String watch_list(Model model, HttpServletRequest request) {
		WatchDao wdao = sqlSession.getMapper(WatchDao.class);

		int page;
		if (request.getParameter("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int recod = (page - 1) * 7;

		ArrayList<WatchDto> watch_list = wdao.watch_list(recod);
		int pstart = page / 10;
		if (page % 10 == 0)
			pstart = pstart - 1;
		pstart = (pstart * 10) + 1;
		int pend = pstart + 9;

		int page_cnt = wdao.get_cnt();
		if (pend > page_cnt)
			pend = page_cnt;

		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page_cnt", page_cnt);
		model.addAttribute("page", page);
		model.addAttribute("watch_list", watch_list);

		return "admin/watch/watch_list";
	}

	@RequestMapping("/watch/delete")
	public String delete(HttpServletRequest request) {

		WatchDao wdao = sqlSession.getMapper(WatchDao.class);
		String[] watchIds = request.getParameterValues("watchIds[]");

		for (String watchId : watchIds) {
			wdao.delete(watchId);
		}

		return "admin/watch/watch_list";
	}

	@RequestMapping("/watch/content")
	public String content(Model model, HttpServletRequest request) throws Exception {
		String id = request.getParameter("id");
		WatchDao wdao = sqlSession.getMapper(WatchDao.class);
		WatchDto wdto = wdao.content(id);

		wdto.setContent(wdto.getContent());

		model.addAttribute("wdto", wdto);

		return "admin/watch/content";
	}

	@RequestMapping("/watch/update")
	public String update(Model model, HttpServletRequest request) throws Exception {
		String id = request.getParameter("id");
		WatchDao wdao = sqlSession.getMapper(WatchDao.class);
		WatchDto wdto = wdao.content(id);
		model.addAttribute("wdto", wdto);

		return "admin/watch/update";
	}

	@RequestMapping("/watch/update_ok")
	public String update_ok(MultipartHttpServletRequest request) throws Exception {
		String id = request.getParameter("id");

		String imgPath = "resources/img";
		String path = request.getRealPath(imgPath);
		MultipartFile multipartFile = request.getFile("picture");
		WatchDto wdto = new WatchDto();
		// 파일이 있는 경우
		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename()); // 파일명
			String fileName = multipartFile.getOriginalFilename(); // 파일명 // NAME으로 저장
			FileCopyUtils.copy(multipartFile.getBytes(), file);

			// int max=1024*1024*10;
			// MultipartRequest multi=new MultipartRequest(request,path,max,"utf-8",new
			// DefaultFileRenamePolicy());

			// String fileName = multi.getFilesystemName("picture");
			// System.out.println("fileName" + fileName);
		
			wdto.setPicture(imgPath + "/" + fileName);
		}
		
			String idStr = request.getParameter("id");
			wdto.setId(Integer.parseInt(idStr));
			wdto.setName(request.getParameter("name"));
			wdto.setBrand(request.getParameter("brand"));
			wdto.setPrice(Integer.parseInt(request.getParameter("price")));
			wdto.setCategory(request.getParameter("category"));
			wdto.setContent(request.getParameter("content"));
			wdto.setDiscount(Double.parseDouble(request.getParameter("discount")));
			wdto.setKind(request.getParameter("kind"));

			WatchDao wdao = sqlSession.getMapper(WatchDao.class);
			wdao.update_ok(wdto);			
			
			
		return "redirect:/admin/watch/watch_list";
	}

	@RequestMapping(value = "/dash-board")
	public String dash_board(Model model, HttpServletRequest request) throws Exception {
		
		/*목록*/ 
		QnaDao qdao = sqlSession.getMapper(QnaDao.class);
		ArrayList<QnaDto> dash_listq = qdao.dash_listq();
		model.addAttribute("dash_listq", dash_listq); // qna

		ReviewsDao rdao = sqlSession.getMapper(ReviewsDao.class);
		ArrayList<ReviewsDto> dash_listr = rdao.dash_listr();
		model.addAttribute("dash_listr", dash_listr); // review

		CartDao cdao = sqlSession.getMapper(CartDao.class);
		ArrayList<CartDto> dash_listc = cdao.dash_listc();
		model.addAttribute("dash_listc", dash_listc); // cart

		OrderDao odao = sqlSession.getMapper(OrderDao.class);
		ArrayList<OrderDto> dash_listo = odao.dash_listo();
		model.addAttribute("dash_listo", dash_listo); // order list
		

		/** 대시보드 그래프 */
		MemberDao grapm = sqlSession.getMapper(MemberDao.class);
		String tot = grapm.tot();
		model.addAttribute("tot", tot); // 회원 전체 수
		
		ReviewsDao grapr = sqlSession.getMapper(ReviewsDao.class);
		String totr=grapr.totr();
		model.addAttribute("totr",totr); // 리뷰 합계

		OrderDao grapo = sqlSession.getMapper(OrderDao.class);
		ArrayList<OrderDto> orderg = grapo.orderg();
		model.addAttribute("orderg", orderg); // 주문 가장 많은 상품 3개

		QnaDao grapoq = sqlSession.getMapper(QnaDao.class);
		String totq = grapoq.totq();
		model.addAttribute("totq", totq);	//문의글 총 합계  

		OrderDao grapoc = sqlSession.getMapper(OrderDao.class);
		ArrayList<OrderDto> orderc = grapoc.grapoc();
		model.addAttribute("orderc", orderc);	// 한달 전 주문내역 count
		

		QnaDao grapq = sqlSession.getMapper(QnaDao.class);
		String grapq_id=grapq.dash_grapq();
		model.addAttribute("grapq_id",grapq_id);	//반품/취소 문의가 가장많은 상품번호
		
	
		
		
		return "admin/dash-board";

	}

}
