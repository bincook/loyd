package kr.co.loyd.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPageController {

    /** 마이페이지 */
    @RequestMapping(value = "/mypage/info", method = RequestMethod.GET)
    public String cartListPage() {
        return "mypage/info";
    }
    
}
