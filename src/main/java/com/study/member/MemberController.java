package com.study.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

	@RequestMapping("/loginPage")
	public String moveloginPage() {
		return "/member/loginPage";
	}

	@RequestMapping(value = "/signUpPage")
	public String movesignUpPage() {
		return "/member/signUpPage";
	}

	@RequestMapping("/login2")
	public String login() {
	System.out.println("로긴!");
		return "login"; // 로그인 페이지 뷰 이름 반환
	}
	@RequestMapping(value = "/signUp")
	public String signUp(@ModelAttribute("member") MemberVO vo) {
		System.out.println(vo);
		memberService.memberSignUp(vo);
		return "redirect:/loginPage";
	}
}
