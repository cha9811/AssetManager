package com.study.member;

public interface MemberDAO {



	public int memberInfoUpdate();
    public int memberSignUp(MemberVO membervo);
    public int memberFindPW(String memberEmail, String memberID);
    public int memberFindID(String memberEmail);

	
}
