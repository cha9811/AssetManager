package com.study.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	MemberDAOImpl memberDAOImpl;
	
//	public void memberSignUP(MemberVO membervo) {
//		memberDAOImpl.memberSingUp(membervo);
//	}
	
}
