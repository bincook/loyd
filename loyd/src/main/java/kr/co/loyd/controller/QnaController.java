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
import kr.co.loyd.dto.WatchDto;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	private SqlSession sqlSession;
	
	private final String module="/qna";
	
	
	  
	  @RequestMapping(value = "/write")
	  public String write() {	  
		  
/*		  String id = request.getParameter("id");  상품 상세페이지의 di값 넘겨받기 */ 
		  return "qna/write";
	  }
	  
	  
	  @RequestMapping("insert_ok")
	  public String insert_ok(QnaDto dto, HttpServletRequest request	)
	  {		  
		  QnaDao qdao=sqlSession.getMapper(QnaDao.class);
		  qdao.insert_ok(dto);
		  	  
		  int secret;
		  if(request.getParameter("secret")==null){
			  secret=0;
		  }
		  else {
			  secret=1;
		  }	  
		  
		  
		  		  
		  return "redirect:/order/detail_order?id=" + "660";
	  }
	  
	  		 
}