package com.study.member;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/loginPage")
	public String loginPage() {
		return "/member/loginPage";
	}
	
	
	@RequestMapping(value="/signUpPage")
	public String singUpPage() {
		return "/member/signUpPage";
	}
	
	@RequestMapping(value="/signUp")
	public String singUp() {
//		memberService.
		return "s";
	}
}
