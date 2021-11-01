package kr.co.loyd.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.loyd.dao.QnaDao;
import kr.co.loyd.dto.QnaDto;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	private SqlSession sqlSession;
	
	private final String module="/qna";
	
	
	  
	  @RequestMapping(value = "/write")
	  public String write() {	  
		  
		  return "qna/write";
	  }
	  
	  
	  @RequestMapping("insert_ok")
	  public String insert_ok(QnaDto udto,HttpServletRequest request)
	  {
		  String id=request.getParameter("id");
		  QnaDao qdao=sqlSession.getMapper(QnaDao.class);
		  qdao.insert_ok(id);	
		  
		  int secret;
		  if(request.getParameter("secret")==null){
			  secret=0;
		  }
		  else {
			  secret=1;
		  }	  
		  
		  return "/qna";
	  }
	  
	  
/*		 @RequestMapping(value = "qna")
		  public String qna(Model model,HttpServletRequest request) {
			 QnaDto qdao=sqlSession.getMapper(QnaDao.class);
			  ArrayList<QnaDto> list=qdao.qna();
			  model.addAttribute("list",list);
			  return "/qna";
		
	*/
}
