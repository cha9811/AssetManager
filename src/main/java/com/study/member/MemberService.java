package com.study.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberService {
	
	@Autowired
	MemberDAOImpl memberDAOImpl;

    private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	
	@Transactional
	public void memberSignUp(MemberVO membervo){
		
		System.out.println(membervo.getMember_password());
		String encoding_password = passwordEncoder.encode(membervo.getMember_password());
		membervo.setMember_password(encoding_password);
		
		memberDAOImpl.memberSignUp(membervo);	//A
//		 if (true) { // 테스트를 위한 조건
//			 	System.out.println("트랜잭션 발생");
//		        throw new RuntimeException("트랜잭션 테스트 중 예외 발생");
//		    }
//		memberDAOImpl.memberSignUp(membervo);	//B
	}
	
	public int memberCount() {
		int memberCount = memberDAOImpl.memberCount();
		return memberCount;
	}
	
}
