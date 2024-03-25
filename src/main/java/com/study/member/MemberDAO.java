package com.study.member;

public interface MemberDAO {



    public int memberSignUp(MemberVO membervo);
    public int memberFindPW(String memberEmail, String memberID);
    public int memberFindID(String memberEmail);
	public Object findByUsername(String username);
	public MemberVO memberLogin(String member_name);
	public int memberInfoUpdate(MemberVO memberVO);
	public int memberCount();
}
