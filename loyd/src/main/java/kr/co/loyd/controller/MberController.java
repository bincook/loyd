package kr.co.loyd.controller;

import java.io.PrintWriter;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.loyd.dao.MberDao;
import kr.co.loyd.dto.MberDto;

@Controller
@RequestMapping("/mber")
public class MberController {
	
	
	
    private final String module = "mber";
    @Autowired
    private SqlSession sqlSession;
    @Autowired
	private JavaMailSender mailSender;
    
    @RequestMapping(value = "/mailSending")
	public String mailSending(HttpServletRequest request) {

		String setfrom = "silberrook@naver.com";
		String tomail = request.getParameter("tomail"); // 받는 사람 이메일
		String title = request.getParameter("title"); // 제목
		String content = request.getParameter("content"); // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
			return "redirect:/mail";
		}

		return "redirect:/";
	}
   
    
    @RequestMapping("mail")
   public String mail() {

       return "/mail";
   }
    
      @RequestMapping("join")
    public String join() {

        return module + "/join";
    }
    
    

  

    @RequestMapping("join_ok")
    public String join_ok(MberDto dto) {

        MberDao dao = sqlSession.getMapper(MberDao.class);
        int chk = dao.get_check(dto.getEmail());
        if (chk == 0) {
            dao.join_ok(dto);
            return "redirect:/" + module + "/login";
        } else {
            return module + "/join?chk=1";
        }
    }


    @RequestMapping("/check")
    public void check(PrintWriter out, HttpServletRequest request) {

        String email = request.getParameter("email");
        MberDao mdao = sqlSession.getMapper(MberDao.class);
        int chk = mdao.get_check(email);
        out.print(chk);

    }


    @RequestMapping("login")
    public String login() {
        return module + "/login";
    }

    @RequestMapping("login_ok")
    public String login_ok(HttpSession session, MberDto dto) {

        MberDao dao = sqlSession.getMapper(MberDao.class);
        MberDto dto2 = dao.login_ok(dto);

        if (dto2 == null) {
            return "redirect:/" + module + "/login?chk=1";
        }

		session.setAttribute("email", dto2.getEmail());
		session.setAttribute("name", dto2.getName());
		session.setAttribute("id", dto2.getId());

		if (dto2.getEmail().equals("admin")) {
			return "redirect:/admin/dash-board";
		}

		return "redirect:/";

    }

    @RequestMapping("logout")
    public String logout(HttpSession session) {

        session.invalidate();

        return "redirect:/";
    }


    //email찾기
    @RequestMapping("emailfind")
    public String emailfind() {

        return module + "/emailfind";
    }


    @RequestMapping("emailfind_ok")
    public String emailfind_ok(MberDto dto, Model model) {


        MberDao dao = sqlSession.getMapper(MberDao.class);
        String email = dao.emailfind_ok(dto);

        if (email == null) {
            return module + "/emailfind";
        } else {
            model.addAttribute("email", email);
            return module + "/emailfind_ok";
        }


    }

    //비밀번호 찾기
    @RequestMapping("pwdfind")
    public String pwdfind() {

        return module + "/pwdfind";
    }

    @RequestMapping("pwdfind_ok")
    public String pwdfind_ok(MberDto dto, Model model) {

        MberDao dao = sqlSession.getMapper(MberDao.class);
        String pwd = dao.pwdfind_ok(dto);


        if (pwd == null) {
            return module + "/pwdfind";
        } else {
            model.addAttribute("pwd", pwd);
            return module + "/pwdfind_ok";


        }


    }


}
