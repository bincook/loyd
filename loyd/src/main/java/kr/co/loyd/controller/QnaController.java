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

import kr.co.loyd.dao.QnaDao;
import kr.co.loyd.dto.QnaDto;
import kr.co.loyd.dto.WatchDto;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	private SqlSession sqlSession;

	private final String module = "/qna";

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write( Model model, HttpServletRequest request, QnaDto dto) {

		model.addAttribute("dto", dto );
		
		return "qna/write";
	}

	@RequestMapping("insert_ok")
	public String insert_ok(QnaDto qdto, HttpServletRequest request) {
		QnaDao qdao = sqlSession.getMapper(QnaDao.class);
		qdao.insert_ok(qdto);

		int secret;
		if (request.getParameter("secret") == null) {
			secret = 0;
		} else {
			secret = 1;
		}
		
		
		return "redirect:/order/detail_order?nav_type=list&id="+qdto.getWatch_id();
	}


	@RequestMapping(value = "list")
	public String list(Model model, HttpServletRequest request) {
	//	String email = (String) session.getAttribute("email");
		
		QnaDao qdao = sqlSession.getMapper(QnaDao.class);

		String nav_type = request.getParameter("nav_type");
		int page;
		if (request.getParameter("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int recod = (page - 1) * 7;

		ArrayList<QnaDto> list = qdao.list(recod);
		int pstart = page / 5;
		if (page % 10 == 0)
			pstart = pstart - 1;
		pstart = (pstart * 10) + 1;
		int pend = pstart + 9;

		int page_cnt = qdao.get_cnt();
		if (pend > page_cnt)
			pend = page_cnt;

		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page_cnt", page_cnt);
		model.addAttribute("page", page);
		model.addAttribute("list", list);

		if (nav_type != null) {
			model.addAttribute("nav_type", "list");
		} else {
			model.addAttribute("nav_type", "");
		}

		return "/qna/list";

	}
}