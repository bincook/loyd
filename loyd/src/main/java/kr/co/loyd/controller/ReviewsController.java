package kr.co.loyd.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewsController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewsController.class);

	/** 리뷰 작성 페이지 */
	@RequestMapping(value = "/reviews/write", method = RequestMethod.GET)
	public String reviewWritePage() {
		return "/reviews/write";
	}
	
}


