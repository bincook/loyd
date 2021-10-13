package kr.co.loyd.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.loyd.dao.LoydDao;
import kr.co.loyd.dto.LoydDto;

@Controller
public class LoydController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/list")
	public String list(Model model,HttpServletRequest request)
	{
		LoydDao ldao=sqlSession.getMapper(LoydDao.class);
		ArrayList<LoydDto> list=ldao.list();
		
		model.addAttribute("list",list);
		return "/list";
	}
}
