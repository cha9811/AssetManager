package com.study.home;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.member.MemberDAOImpl;

@Service
public class HomeService {

	@Autowired
	MemberDAOImpl memberDAOImpl;

	public List<Map<String, Object>> getMemberAttendanceCount() {
        System.out.println(memberDAOImpl.getMemberAttendanceCount());
    return null;
	}

//	@Autowired
//	MemberDAOImpl memberDAOImpl;
//
//    private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//
//	
//	@Transactional
//	public void memberSignUp(MemberVO membervo){
//		
//		System.out.println(membervo.getMember_password());
//		String encoding_password = passwordEncoder.encode(membervo.getMember_password());
//		membervo.setMember_password(encoding_password);
//		
//		memberDAOImpl.memberSignUp(membervo);	//A
////		 if (true) { // 테스트를 위한 조건
////			 	System.out.println("트랜잭션 발생");
////		        throw new RuntimeException("트랜잭션 테스트 중 예외 발생");
////		    }
////		memberDAOImpl.memberSignUp(membervo);	//B
//	}
//	
//	public int memberCount() {
//		int memberCount = memberDAOImpl.memberCount();
//		return memberCount;
//	}
//
//	public void attendanceUpdate(int status) {
//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//		String currentUserName = authentication.getName();
//		System.out.println(currentUserName);
//		MemberVO vo = memberDAOImpl.findByUsername(currentUserName);
//		vo.setMember_attendance(status);
//		memberDAOImpl.memberInfoUpdate(vo);
//	}
//	
//	public MemberVO findByUsername(String username) {
//		MemberVO membervo = memberDAOImpl.findByUsername(username);
//		System.out.println(membervo);
//		return membervo;
//	}
//	
//	@Scheduled(cron = "0 0 06 * * *") // 5초마다 실행
//    public void resetMemberAttendance() {
//        System.out.println("나 실행");
//    }

}
