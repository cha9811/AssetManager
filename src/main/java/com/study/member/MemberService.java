package com.study.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
//@EnableScheduling
public class MemberService {

	@Autowired
	MemberDAOImpl memberDAOImpl;

	@Autowired
	JavaMailSenderImpl mailSender;

	private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	@Transactional
	public void memberSignUp(MemberVO membervo) {

		System.out.println(membervo.getMember_password());
		String encoding_password = passwordEncoder.encode(membervo.getMember_password());
		membervo.setMember_password(encoding_password);

		memberDAOImpl.memberSignUp(membervo); // A
//		 if (true) { // 테스트를 위한 조건
//			 	System.out.println("트랜잭션 발생");
//		        throw new RuntimeException("트랜잭션 테스트 중 예외 발생");
//		    }
//		memberDAOImpl.memberSignUp(membervo);	//B
	}

	
	public boolean IDcheck(String member_name) {
		boolean result = memberDAOImpl.checkUsername(member_name);
		return result;
	}

	public int memberCount() {
		int memberCount = memberDAOImpl.memberCount();
		return memberCount;
	}

	public void attendanceUpdate(int status) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentUserName = authentication.getName();
		System.out.println(currentUserName);
		MemberVO vo = memberDAOImpl.findByUsername(currentUserName);
		vo.setMember_attendance(status);
		memberDAOImpl.memberInfoUpdate(vo);
	}

	public MemberVO findByUsername(String username) {
		MemberVO membervo = memberDAOImpl.findByUsername(username);
		System.out.println(membervo);
		return membervo;
	}

//	  public Map<Integer, Long> countByAttendanceType() {
//	        List<Integer> attendances = memberDAOImpl.findAll();
//	        Map<Integer, Long> attendanceCount = attendances.stream()
//	                                                        .collect(Collectors.groupingBy(Attendance::getMemberAttendance, Collectors.counting()));
//	        return attendanceCount;
//	    }  

	public Map<Integer, Long> countByAttendanceType() {
		List<Map<String, Object>> rawCounts = memberDAOImpl.getMemberAttendanceCount();
		Map<Integer, Long> attendanceCount = new HashMap<>();

		for (Map<String, Object> entry : rawCounts) {
			Integer memberAttendance = (Integer) entry.get("member_attendance"); // DB에서 가져온 key 이름에 맞추어 적절히 수정
			Long count = ((Number) entry.get("count")).longValue(); // Oracle 등 일부 DB는 Long 대신 BigDecimal을 반환할 수 있음

			attendanceCount.put(memberAttendance, count);
		}

		return attendanceCount;
	}


	public int sendEmail(String email) { // 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		try {
			String toMail = email;
			String title = "회원가입 인증 이메일 입니다.";
			String content = "인증 코드는 " + checkNum + " 입니다." + "<br>" + "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";

			MimeMessage message = mailSender.createMimeMessage(); // Spring에서 제공하는 mail API
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
			System.out.println(message);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("미실행");
			checkNum=0;
		}
		System.out.println("랜덤숫자 : " + checkNum);
		return checkNum;
	}

	public void sendIDEmail(String email, String member_name) { // 난수의 범위 111111 ~ 999999 (6자리 난수)
		try {
			String toMail = email;
			String title = "회원가입 인증 이메일 입니다.";
			String content = "회원님의 ID는" + member_name + " 입니다.";

			MimeMessage message = mailSender.createMimeMessage(); // Spring에서 제공하는 mail API
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
			System.out.println(message);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("미실행");
		}
	}

	public MemberVO getMemberByID(String member_id) {
		MemberVO memberInfo = memberDAOImpl.getMemberByID(member_id);
		return memberInfo;
	}

	public MemberVO getMemberByEmail(String member_email) {
		MemberVO result = memberDAOImpl.memberFindID(member_email);
		return result;
	}
//	

//	public String findID(String email) {
//		int a = memberDAOImpl.memberFindID(email);
//		if(a == 1) {
//		continue;	
//		}
//		return email;
//	}
//	
//	public String sendMail() {
//		String cernum ="s"; 
//		return cernum;
//	}

}
