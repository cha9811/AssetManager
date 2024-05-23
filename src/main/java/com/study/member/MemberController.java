package com.study.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

	@RequestMapping("/login")
	public String login() {
		System.out.println("나실행");
		return "login"; // 로그인 페이지 뷰 이름 반환
	}

	@RequestMapping(value = "/signUp")
	public String signUp(@ModelAttribute("member") MemberVO vo) {
		System.out.println(vo);
		
		memberService.memberSignUp(vo);
		return "redirect:/loginPage";
	}


	@PostMapping("/updateWork")
	public String startWork(@RequestParam("action") int status) {
		memberService.attendanceUpdate(status);
		return "redirect:/home";
	}

//	@RequestMapping("/IDcheck")
//	public boolean usernameCheck(String username) {
//		MemberVO result = memberService.findByUsername(username);
//		boolean index = true;
//		if (result != null) {
//			index = false;
//		}
//		return index;
//	}

	@RequestMapping("/findID")
	public Boolean findID(String eamil) {
		MemberVO result = memberService.findByUsername(eamil);
		boolean index = true;
		if (result != null) {
			index = false;
		}
		return index;
	}

	// 기존코드들
//	 @RequestMapping("/IDcheck")
//	 public boolean IDcheck(String user_name) {
//		 System.out.println(user_name);
//		 boolean result = memberService.IDcheck(user_name);
//		 System.out.println(result);
//		 return result;
//	 }

	@RequestMapping(value = "/IDcheck", method = RequestMethod.GET)
	public ResponseEntity<String> checkUsername(@RequestParam("username") String username) {
		System.out.println(username);
		boolean exists = memberService.IDcheck(username);
		
		if (!exists) {
			return ResponseEntity.status(HttpStatus.CONFLICT).body("Username already taken.");
		} else {
			return ResponseEntity.ok("Username is available.");
		}
	}

	@RequestMapping(value = "/getMemberDetails/{member_id}", method = RequestMethod.GET)
    public ResponseEntity<MemberVO> memberInfo(@PathVariable("member_id") String member_id) {
        MemberVO memberInfo = memberService.getMemberByID(member_id);
        if (memberInfo != null) {
            return new ResponseEntity<>(memberInfo, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
	
	//인증 메일 보내기
	@PostMapping("/sendEmail")
		public ResponseEntity<?> sendEmail(@RequestParam("email") String email, HttpSession session) {
		MemberVO memberInfo = memberService.getMemberByEmail(email);

		if(memberInfo.getMember_email()==null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("해당하는 이메일이 없습니다.");
		}
		
		int checknum = memberService.sendEmail(email);
		session.setAttribute("authCode", checknum);
		return ResponseEntity.ok(checknum);
	}

	//진짜 ID보내기
	@PostMapping("/sendIDEmail")
	public ResponseEntity<?> sendIDEmail(@RequestParam("email") String email, HttpSession session) {
	MemberVO memberInfo = memberService.getMemberByEmail(email);
	memberService.sendIDEmail(email,memberInfo.getMember_name());

	return (ResponseEntity<?>) ResponseEntity.ok();
}

	
//	@RequestMapping("/mypage")
//	public String mypage(Model model) {
//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//		String username = authentication.getName(); // 현재 사용자의 이름 (예: "admin")
//		MemberVO memberinfo = memberService.myPage(username);
//		model.addAttribute("memberInfo", memberinfo);
//		List<GifticonVO> vo = gifticonDAO.giftconByMemberId(memberinfo.getMember_id());
//		model.addAttribute("giftcon", vo);
//		return "member/mypage";
//	}

//	@RequestMapping("/memberupdate")
//	public String memberInfoUpdate(MemberVO memberUpdateInfo) {
//		memberDAO.memberInfoUpdate(memberService.memberUpdateCheck(memberUpdateInfo));
//		return "redirect:/mypage";
//	}

	// 매퍼,pw업데이트 등바꾸기 ajax
//	@RequestMapping("/memberPWupdate")
//	public String memberPWUpdate(String member_password, String new_member_password) {
//		memberService.memberPWUpdate(new_member_password, member_password);
//		return "redirect:/mypage";
//	}

	// 비로그인상태에서 PW 변경하기 ajax
	// AJAX 요청을 통해 서버에 데이터를 전송한 후 페이지 리디렉션을 원하는 경우, 페이지 리디렉션이 클라이언트 측 JavaScript에서
	// 처리되어야 합니다. 서버에서 return "redirect:/loginPage";를 사용하는 것은 전통적인 서브밋(submit) 방식의 폼
	// 처리에 적합하지만, AJAX 요청에서는 작동하지 않습니다. AJAX 요청은 비동기적으로 수행되며, 서버의 응답이 클라이언트에게 반환된 후
	// JavaScript 코드로 추가 처리를 해야 합니다.
//	@RequestMapping("/PWupdate")
//	public String nomemberPWUpdate(String new_member_password, String new_member_password_cert, String email) {
//		memberService.PWUpdate(new_member_password, new_member_password_cert, email);
//		return "redirect:/loginPage";
//	}

//	@RequestMapping(value = "/checkUsername", method = RequestMethod.GET)
//	@ResponseBody
//	public boolean usernameCheck(@RequestParam("member_name") String username) {
//		boolean index = false;
//		if (null == memberDAO.memberCheck(username)) {
//			index = true;
//		}
//		System.out.println(index);
//		return index;
//	}

//	@PostMapping("/sendEmailID")
//	public ResponseEntity<?> sendIDEmail(@RequestParam("email") String email, HttpSession session) {
//		if (memberDAO.memberInfoByEmail(email) != null) {
//			email = email + "@naver.com";
//			int checknum = memberService.sendIDEmail(email);
//			session.setAttribute("authCode", checknum);
//			System.out.println("저장된 authCode: " + session.getAttribute("authCode"));
//			return ResponseEntity.ok(checknum);
//		} else {
//			return null;
//		}
//	}

	@PostMapping("/checkNum")
	public ResponseEntity<?> verifyCode(@RequestParam("checkNum") int checkNum, HttpSession session) {
	    Integer savedCode = (Integer) session.getAttribute("authCode");
	    if (savedCode == null || savedCode != checkNum) {
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid code.");
	    }
	    session.removeAttribute("authCode"); // 인증 완료 후 세션에서 인증번호 제거
	    return ResponseEntity.ok("Code verified successfully.");
	}
	
//	@PostMapping("/checkNum")
//	public String verifyLogin(@RequestParam("checkNum") int checkNum, HttpSession session) {
//	    Integer savedCode = (Integer) session.getAttribute("authCode");
//	    if (savedCode == null || savedCode != checkNum) {
//	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid code.");
//	    }
//	    session.removeAttribute("authCode"); // 인증 완료 후 세션에서 인증번호 제거
////	    return ResponseEntity.ok("Code verified successfully.");
//	}
	
//	// id인증번호 매칭
//	@PostMapping("/compairNumber")
//	public ResponseEntity<?> compairNumber(@RequestParam("email") String email,
//			@RequestParam("certNum_ID") int certNumID, HttpSession session) {
//		boolean numberMatched = memberService.isCodeMatched(certNumID, session);
//		if (numberMatched == true) {
//			String Username = memberService.sendID(email);
//			return ResponseEntity.ok().build();
//		} else {
//			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
//		}
//
//	}

//	// PW인증받기
//	@PostMapping("/sendEmailPW")
//	public ResponseEntity<?> sendPWEmail(@RequestParam("email") String email,
//			@RequestParam("member_name") String member_name, HttpSession session) {
//		System.out.println(email);
//		MemberVO vo = memberDAO.memberInfoByEmail(email);
//		if (vo != null) {
//			// 세션에 인증용 번호 저장
//			if (!vo.getMember_name().equals(member_name)) {
//				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
//			}
//			email = email + "@naver.com";
//			int checknum = memberService.sendIDEmail(email);
//			session.setAttribute("authCode", checknum);
//			System.out.println("저장된 authCode: " + session.getAttribute("authCode"));
//			return ResponseEntity.ok(checknum);
//		} else {
//			return null;
//		}
//	}

	// PW인증번호비교
//	@PostMapping("/compairPWNumber")
//	public ResponseEntity<?> compairPWNumber(@RequestParam("certNum_PW") int certNumPW, HttpSession session) {
//		boolean numberMatched = memberService.isCodeMatched(certNumPW, session);
//		if (numberMatched == true) {
//			return ResponseEntity.ok().build();
//		} else {
//			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
//		}
//	}

}
