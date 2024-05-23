package com.study.member;

import java.util.List;
import java.util.Map;

public interface MemberDAO {



    public int memberSignUp(MemberVO membervo);
    public int memberFindPW(String memberEmail, String memberID);
    public MemberVO memberFindID(String memberEmail);
	public Object findByUsername(String username);
	public MemberVO memberLogin(String member_name);
	public int memberInfoUpdate(MemberVO memberVO);
	public int memberCount();
	public List<Map<String, Object>> getMemberAttendanceCount();
	public int resetMemberStatus();
	public boolean checkUsername(String username);
//	public List<MemberVO> getMemberlist();
	public MemberVO getMemberByID(String member_id);
	public List<MemberVO> getMemberlist(int member_id);
}
