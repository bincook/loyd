package kr.co.loyd.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.loyd.dao.SearchDao;
import kr.co.loyd.dto.SearchDto;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("search")
	public String search(SearchDto dto,Model model) {
		
		SearchDao dao = sqlSession.getMapper(SearchDao.class);
		ArrayList<SearchDto> list = dao.search(dto);
		int chk = dao.search_chk(dto);
		
		model.addAttribute("list",list);
		model.addAttribute("chk",chk);
		
		return "/search/search";
	}
	
}
