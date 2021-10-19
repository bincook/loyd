package kr.co.loyd.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.loyd.dao.MemberDao;
import kr.co.loyd.dto.MemberDto;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String module="/admin/member";
		
	/** 관리자 회원 목록 조회 페이지 */
	@RequestMapping(value = "/member/list", method = RequestMethod.GET)
	public String list(Model model,HttpServletRequest request) {
		String search_field,search_word;
		if(request.getParameter("search_field")==null)
		{
			search_field="''";
			search_word="";
		}
		else
		{
			search_field=request.getParameter("search_field");
			search_word=request.getParameter("search_word");
		}
		
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		
		ArrayList<MemberDto> list=mdao.listPage(search_field, search_word);
		
		model.addAttribute("list",list);
		
		return module + "/list";
	}
}
