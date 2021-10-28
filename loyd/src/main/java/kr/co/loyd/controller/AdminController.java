package kr.co.loyd.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.loyd.dao.MemberDao;
import kr.co.loyd.dao.WatchDao;
import kr.co.loyd.dto.MemberDto;
import kr.co.loyd.dto.WatchDto;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String module="/admin";
	
	/** 관리자 특정회원 조회 페이지 */
	@RequestMapping(value = "/member/list")
	public String list(Model model, HttpServletRequest request) {
		String search_field = request.getParameter("search_field");
		String search_word;
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		
		// 검색을 안했을 때
		if(search_field==null || search_field.equals("sel"))
		{
			search_field="sel";
			search_word="";
			
		}
		// 검색을 했을 때
		else
		{
			search_field=request.getParameter("search_field");
			search_word=request.getParameter("search_word");
			// 검색된 회원 정보
			ArrayList<MemberDto> searchMemberList = mdao.listdetail(search_field, search_word);
			model.addAttribute("searchMemberList", searchMemberList);
			
		}	
		model.addAttribute("search_field",search_field);
		
		// 모든 회원정보
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
		
		ArrayList<MemberDto> list = mdao.list(index);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("page",page);
		model.addAttribute("list",list);
		
		return  "/admin/member/list";
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
		return  "redirect:/admin/member/list";
	}
	
	
<<<<<<< HEAD
	
=======
	/** 관리자 상품 등록(하나의 이미지 등록) */
	@RequestMapping(value = "/watch/upload")
	public String upload()
	{
		
		return "/admin/watch/upload";
	}
>>>>>>> developer

	@RequestMapping("/watch/upload_ok")
	public String upload_ok( MultipartHttpServletRequest request) throws Exception
	{
		
		   String imgPath = "resources/img";
		   String path=request.getRealPath(imgPath);
		   MultipartFile multipartFile = request.getFile("picture");
			
		   // 파일이 있는 경우
		   if(!multipartFile.isEmpty()) {
			   File file = new File(path, multipartFile.getOriginalFilename()); // 파일명
			   String fileName = multipartFile.getOriginalFilename(); // 파일명 // NAME으로 저장
			   FileCopyUtils.copy(multipartFile.getBytes(), file);
			   
//			   int max=1024*1024*10;
//			   MultipartRequest multi=new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy());

//			   String fileName = multi.getFilesystemName("picture");
//			   System.out.println("fileName" + fileName);
			   
			   
			   WatchDto wdto=new WatchDto();
			   wdto.setName(request.getParameter("name"));
			   wdto.setBrand(request.getParameter("brand"));
			   wdto.setPrice(Integer.parseInt(request.getParameter("price")));
			   wdto.setCategory(request.getParameter("category"));
			   wdto.setContent(request.getParameter("content"));
			   wdto.setDiscount(Double.parseDouble(request.getParameter("discount")));
			   wdto.setPicture(imgPath + "/" + fileName);
			   wdto.setKind(request.getParameter("kind"));
			   
			   WatchDao wdao=sqlSession.getMapper(WatchDao.class);
			   wdao.upload_ok(wdto);
			   
			// 파일이 없을 때
		   } else {
			   String encodeResult = URLEncoder.encode("첨부파일을 등록해주세요", "utf-8");
			   
			   return "redirect:/admin/watch/upload?error="+encodeResult;			   
		   }
		   
		return "redirect:/admin/watch/watch_list";
	}
	
	 @RequestMapping("/watch/watch_list")
	   public String watch_list(Model model,HttpServletRequest request)
	   {
		   WatchDao wdao=sqlSession.getMapper(WatchDao.class); 
		   
		   int page;
			if(request.getParameter("page")==null)
			{
				page=1;
			}
			else
			{
				page=Integer.parseInt(request.getParameter("page"));
			}
			int page_cnt=wdao.get_cnt();
			int index=(page-1)*10;			
			
			int pstart=page/10;
			if(page%10 == 0)
				pstart=pstart-1;
			pstart=(pstart*10)+1;
			int pend=pstart+9;		
			
			if(pend>page_cnt)
				pend=page_cnt;		   
		   
		   ArrayList<WatchDto> watch_list=wdao.watch_list();
		   model.addAttribute("pstart",pstart);
		   model.addAttribute("pend",pend);
		   model.addAttribute("page_cnt",page_cnt);
		   model.addAttribute("page",page);
		   model.addAttribute("watch_list",watch_list);
		   return "admin/watch/watch_list";
	   }

     @RequestMapping("/watch/content")
     public String content(Model model,HttpServletRequest request) throws Exception
     {
      String id=request.getParameter("id");
      WatchDao wdao=sqlSession.getMapper(WatchDao.class);
      WatchDto wdto=wdao.content(id);
      model.addAttribute("wdto",wdto);
      
      return "admin/watch/content";
     }
	
		
}
