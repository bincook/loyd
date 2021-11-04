package kr.co.loyd.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.loyd.dao.MberDao;
import kr.co.loyd.dto.MberDto;

@Controller
@RequestMapping("/mber")
public class MberController {
	private final String module="mber";
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("join")
	public String join() {
		
		return module+"/join";
	}
	@RequestMapping("join_ok")
	public String join_ok(MberDto dto) {
		
		MberDao dao = sqlSession.getMapper(MberDao.class);
		int chk = dao.get_check(dto.getEmail());
		if(chk==0) {
			dao.join_ok(dto);
			return "redirect:/"+module+"/login";
		}else {
			return module+"/join?chk=1";
		}
	}
	
	
	@RequestMapping("/check")
	public void check(PrintWriter out ,HttpServletRequest request) {
		
		String email = request.getParameter("email");
		MberDao mdao=sqlSession.getMapper(MberDao.class);
		int chk = mdao.get_check(email);
		out.print(chk);

	}
	
	
	
	
	
	@RequestMapping("login")
	public String login() {
		return module+"/login";
	}
	
	@RequestMapping("login_ok")
	public String login_ok(HttpSession session, MberDto dto) {
		
		MberDao dao = sqlSession.getMapper(MberDao.class);
		MberDto dto2 = dao.login_ok(dto);
		
		if(dto2==null) {
			return "redirect:/"+module+"/login?chk=1";
		}else{
			
		session.setAttribute("email",dto2.getEmail() );
		session.setAttribute("name",dto2.getName());
		session.setAttribute("id",dto2.getId());
		
		if(dto2.getEmail().equals("admin")) {
			return "redirect:/admin/dash-board";
		}
		
		return "redirect:/";
		
		}

	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
	//email찾기
	@RequestMapping("emailfind")
	public String emailfind() {
		
		return module+"/emailfind";
	}
	
	
	@RequestMapping("emailfind_ok")
	public String emailfind_ok(MberDto dto,Model model) {

		
		MberDao dao = sqlSession.getMapper(MberDao.class);
		String email = dao.emailfind_ok(dto);
		
		if(email==null) {
			return module+"/emailfind";
		}else {
			model.addAttribute("email",email);
			return module+"/emailfind_ok";
		}
		
		
		
		
	}
	
	//비밀번호 찾기
	@RequestMapping("pwdfind")
	public String pwdfind() {
		
		return module+"/pwdfind";
	}
	@RequestMapping("pwdfind_ok")
	public String pwdfind_ok(MberDto dto,Model model) {

		MberDao dao = sqlSession.getMapper(MberDao.class);
		String pwd = dao.pwdfind_ok(dto);
		
		if(pwd==null) {
			return module+"/pwdfind";
		}else {
			model.addAttribute("pwd",pwd);
			return module+"/pwdfind_ok";
		}
		
		
		
	
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
