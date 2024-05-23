package com.study.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetails implements UserDetails {

	
	private String username;
	private String password;
	private Collection<? extends GrantedAuthority> authorities; //websocket의 userAut로 user_id를 추출하기 위해 필요함
	private boolean memberAttendance; // 추가된 필드
    private int userId; // 사용자 고유 ID 또는 인덱스
    private String member_role;
    private String member_username;
    private int member_attendance;
    
   
	


	public int getMember_attendance() {
		return member_attendance;
	}


	public void setMember_attendance(int member_attendance) {
		this.member_attendance = member_attendance;
	}


	@Override
	public String toString() {
		return "CustomUserDetails [username=" + username + ", password=" + password + ", authorities=" + authorities
				+ ", memberAttendance=" + memberAttendance + ", userId=" + userId + ", member_role=" + member_role
				+ ", member_username=" + member_username + ", member_attendance=" + member_attendance + "]";
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public CustomUserDetails(String member_name, String member_password,Collection<? extends GrantedAuthority> authorities, int member_id, String member_role,String member_username, int member_attendance) {
		this.username = member_name;
		this.password = member_password;
	    this.authorities = authorities;
		this.userId = member_id;
		this.member_role = member_role;
		this.member_username = member_username;
		this.member_attendance = member_attendance;
	}
	
	
	public String getMember_username() {
		return member_username;
	}
	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
	    grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_" + member_role));
	    return Collections.unmodifiableList(grantedAuthorities);
	}
	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}
	public boolean isMemberAttendance() {
		return memberAttendance;
	}
	public void setMemberAttendance(boolean memberAttendance) {
		this.memberAttendance = memberAttendance;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	

    
//	// 기타 필요한 필드 및 생성자, 메서드 추가
//
//	public boolean isMemberAttendance() {
//		return memberAttendance;
//	}
//
//	// UserDetails 메서드 구현
//	@Override
//	public Collection<? extends GrantedAuthority> getAuthorities() {
//		return authorities;
//	}
//
//	@Override
//	public String getPassword() {
//		return password;
//	}
//
//	@Override
//	public String getUsername() {
//		return username;
//	}
//
//	@Override
//	public boolean isAccountNonExpired() {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
//	public boolean isAccountNonLocked() {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
//	public boolean isCredentialsNonExpired() {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
//	public boolean isEnabled() {
//		// TODO Auto-generated method stub
//		return false;
//	}
//	

}