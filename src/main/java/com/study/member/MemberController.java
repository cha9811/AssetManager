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

	@RequestMapping("/findID")
	public Boolean findID(String eamil) {
		MemberVO result = memberService.findByUsername(eamil);
		boolean index = true;
		if (result != null) {
			index = false;
		}
		return index;
	}


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

//		if(memberInfo.getMember_email()==null) {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("해당하는 이메일이 없습니다.");
//		}
		
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
	@PostMapping("/sendEmailPW")
	public ResponseEntity<?> sendPWEmail(@RequestParam("email") String email,
			@RequestParam("member_name") String member_name, HttpSession session) {
		System.out.println(email);
		MemberVO vo = memberDAO.memberInfoByEmail(email);
		if (vo != null) {
			// 세션에 인증용 번호 저장
			if (!vo.getMember_name().equals(member_name)) {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
			}
			email = email + "@naver.com";
			int checknum = memberService.sendIDEmail(email);
			session.setAttribute("authCode", checknum);
			System.out.println("저장된 authCode: " + session.getAttribute("authCode"));
			return ResponseEntity.ok(checknum);
		} else {
			return null;
		}
	}

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
