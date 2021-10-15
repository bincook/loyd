package kr.co.loyd.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CartController {

    /** 장바구니 목록 페이지 */
    @RequestMapping(value = "/cart/list", method = RequestMethod.GET)
    public String cartListPage() {
        return "cart/cart-list";
    }

}
