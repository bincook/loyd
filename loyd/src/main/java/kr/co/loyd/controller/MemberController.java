package kr.co.loyd.controller;

import kr.co.loyd.dao.MemberDao;
import kr.co.loyd.dto.MemberDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Controller
public class MemberController {

    @Autowired
    private SqlSession sqlSession;

    public <T> T mapper(Class<T> clazz) {
        return sqlSession.getMapper(clazz);
    }

    /** 샘플 페이지 */
    @RequestMapping(value = "/sample", method = RequestMethod.GET)
    public String samplePage() {
        return "member/sample";
    }

    /** 회원 상세 페이지 */
    @RequestMapping(value = "/member/{id}", method = RequestMethod.GET)
    public String memberDetailPage(@PathVariable("id") Long id, Model model) {

        MemberDto member = mapper(MemberDao.class).one(id);

        model.addAttribute("member", member);

        return "member/detail";
    }

    /** 회원 목록 페이지 */
    @RequestMapping(value = "/member/list", method = RequestMethod.GET)
    public String memberListPage(Model model) {

        ArrayList<MemberDto> members = mapper(MemberDao.class).list();

        model.addAttribute("members", members);

        return "member/list";
    }

    /** 회원 쓰기 페이지 */
    @RequestMapping(value = "/member/write", method = RequestMethod.GET)
    public String memberWritePage() {

        return "member/write";
    }

    /** 회원 쓰기 Do */
    @RequestMapping(value = "/member/write.do", method = RequestMethod.POST)
    public String memberWriteDo(MemberDto requestDto) {

        mapper(MemberDao.class).insert(requestDto);

        return "redirect:/member/list";
    }

    /** 회원 업데이트 페이지 */
    @RequestMapping(value = "/member/update", method = RequestMethod.GET)
    public String memberUpdatePage(@RequestParam(value = "id") Long id, Model model) {

        MemberDto member = mapper(MemberDao.class).one(id);

        model.addAttribute("member", member);

        return "member/update";
    }

    /** 회원 업데이트 do */
    @RequestMapping(value = "/member/update.do", method = RequestMethod.POST)
    public String memberUpdateDo(MemberDto requestDto) {

        mapper(MemberDao.class).update(requestDto);

        return "redirect:/member/" + requestDto.getId();
    }

    /** 회원 삭제 do */
    @RequestMapping(value = "/member/delete.do", method = RequestMethod.POST)
    public String memberDeleteDo(@RequestParam(value = "id") Long id) {

        mapper(MemberDao.class).delete(id);

        return "redirect:/member/list";
    }
}
