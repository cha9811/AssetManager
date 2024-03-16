package com.study.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberService {
	
	@Autowired
	MemberDAOImpl memberDAOImpl;

	
	
	
	@Transactional
	public void memberSignUp(MemberVO membervo){
		String member_password ="s";
		System.out.println(membervo.getMember_password());
		membervo.setMember_password(member_password);
		memberDAOImpl.memberSignUp(membervo);	//A
		 if (true) { // 테스트를 위한 조건
			 	System.out.println("트랜잭션 발생");
		        throw new RuntimeException("트랜잭션 테스트 중 예외 발생");
		    }
		memberDAOImpl.memberSignUp(membervo);	//B
		
	}
	
}
