package com.study.member;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {

	@RequestMapping(value="/loginPage")
	public String login() {
		return "s";
	}
	
	@RequestMapping(value="/login")
	public String userLogin() {
		return "s";
	}
	
	@RequestMapping(value="/signUpPage")
	public String singUpPage() {
		return "s";
	}
	
	@RequestMapping(value="/signUp")
	public String singUp() {
		return "s";
	}
	
	
	
	@RequestMapping(value="/assetList")
	public String assetList() {
		
		return "asset/assetList";
	}
}
