package kr.co.loyd.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	/** 메인 페이지 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainPage() {
		logger.info("Welcome main!") ;

		return "index";
	}

	/** 회원가입 페이지 */
	@RequestMapping(value = "/sign-up", method = RequestMethod.GET)
	public String singUpPage() {

		return "sign-up";
	}

	/** 로그인 페이지 */
	@RequestMapping(value = "/sign-in", method = RequestMethod.GET)
	public String signInPage() {

		return "sign-in";
	}
}
