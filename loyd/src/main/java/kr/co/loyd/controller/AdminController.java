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
	
	/** 관리자 특정회원 조회 페이지 */
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
		ArrayList<MemberDto> list=mdao.listdetail(search_field, search_word);
		model.addAttribute("list",list);		
		return module + "/list";
	}
	
	/** 관리자 회원 전체목록 조회 */
	@RequestMapping(value = "/member/listdetail", method = RequestMethod.GET)
	public String listdetail(Model model,HttpServletRequest request) {
		
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		int page;
		if(request.getParameter("page")==null)
		{
			page=1;
		}
		else
		{
			page=Integer.parseInt(request.getParameter("page"));
		}
		int page_cnt=mdao.get_cnt();
		int index=(page-1)*10;			
		
		int pstart=page/10;
		if(page%10 == 0)
			pstart=pstart-1;
		pstart=(pstart*10)+1;
		int pend=pstart+9;		
		
		if(pend>page_cnt)
			pend=page_cnt;
		
		ArrayList<MemberDto> list=mdao.list(index);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("page",page);
		model.addAttribute("list",list);		
		return module + "redirect:/list";
	}
	
	

	
	
	
	
		
}
