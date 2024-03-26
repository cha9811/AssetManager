package com.study.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;
import java.util.HashMap;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSessionTemplate memberSST;

	@Override
	public int memberSignUp(MemberVO membervo) {
		return memberSST.insert("MEMBER.CREATE_MEMBER", membervo);
	}

	@Override
	public int memberFindID(String memberEmail) {
		return memberSST.selectOne("MEMBER.GET_MEMBER_INFO_BY_EMAIL", memberEmail);
	}

	@Override
	public int memberFindPW(String memberEmail, String memberID) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("memberEmail", memberEmail);
		params.put("memberID", memberID);
		return memberSST.selectOne("MEMBER.GET_MEMBER_INFO_BY_EMAIL_AND_MEMBER_ID", params);
	}

	

	@Override
	public Object findByUsername(String username) {
		return memberSST.selectOne("MEMBER.GET_MEMBER_INFO_BY_NAME", username);
	}

	@Override
	public MemberVO memberLogin(String membername) {
		return memberSST.selectOne("MEMBER.MEMBER_LOGIN", membername);
	}

	@Override
	public int memberInfoUpdate(MemberVO memberVO) {
		return memberSST.update("MEMBER.MEMBER_INFO_UPDATE", memberVO);

	}

	@Override
	public int memberCount(){
	return memberSST.selectOne("MEMBER.MEMBER_COUNT");
	}


}
