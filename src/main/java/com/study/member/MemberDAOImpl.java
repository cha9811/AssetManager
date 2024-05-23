package com.study.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSessionTemplate memberSST;

	@Override
	public int memberSignUp(MemberVO membervo) {
		return memberSST.insert("MEMBER.CREATE_MEMBER", membervo);
	}

	@Override
	public MemberVO memberFindID(String memberEmail) {
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
	public MemberVO findByUsername(String username) {
		return memberSST.selectOne("MEMBER.GET_MEMBER_INFO_BY_NAME", username);
	}

	@Override
	public boolean checkUsername(String username) {
	    Integer result = memberSST.selectOne("MEMBER.CHECK_USERNAME_EXISTS", username);
	    System.out.println(result);
	    return result == null || result == 0; // 결과가 0이면 true (사용 가능), 그렇지 않으면 false (이미 존재함)
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
	public int memberCount() {
		return memberSST.selectOne("MEMBER.MEMBER_COUNT");
	}

	@Override
	public List<Map<String, Object>> getMemberAttendanceCount() {
	    return memberSST.selectList("MEMBER.GET_MEMBER_ATTENDANCE_COUNT");
	}

	
	@Override
	public int resetMemberStatus(){
		return memberSST.update("MEMBER.RESET_MEMBER_STATUS");
	}

	@Override
	public List<MemberVO> getMemberlist(int member_id) {
	    return memberSST.selectList("MEMBER.GET_MEMBER_LIST",member_id);
	}

	@Override
	public MemberVO getMemberByID(String member_id) {
		return memberSST.selectOne("MEMBER.GET_MEMBER_INFO_BY_MEMBER_ID", member_id);
	}
	
	public boolean getmemberInfoByEmail(String member_email) {
		return memberSST.selectOne("MEMBER.GET_MEMBER_INFO_BY_MEMBER_EMAIL",member_email);
		
	}
	
	
}
