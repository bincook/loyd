package kr.co.loyd.api;

import kr.co.loyd.dao.MemberDao;
import kr.co.loyd.dto.MemberDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MemberApi {

    @Autowired
    private SqlSession sqlSession;

    /** 멤버 리스트 조회 */
    @ResponseBody
    @RequestMapping(value = "/api/members", method = RequestMethod.GET)
    @ResponseStatus(value = HttpStatus.OK)
    public List<MemberDto> getMembers() {

        MemberDao mapper = sqlSession.getMapper(MemberDao.class);

        ArrayList<MemberDto> members = mapper.list();

        return members;
    }

    /** 아이디 중복 체크 */


}
