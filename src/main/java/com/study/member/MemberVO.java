package com.study.member;


public class MemberVO {
	
	private int member_id;
	private String member_name;
	private String member_username;
	private String member_password;
	private String member_department;
	private String member_local;
	private String member_start_date;
	private String member_LDAP;
	private String member_role;
	private String member_team;
	private String member_phone_number;
	
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_username() {
		return member_username;
	}
	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_department() {
		return member_department;
	}
	public void setMember_department(String member_department) {
		this.member_department = member_department;
	}
	public String getMember_local() {
		return member_local;
	}
	public void setMember_local(String member_local) {
		this.member_local = member_local;
	}
	public String getMember_start_date() {
		return member_start_date;
	}
	public void setMember_start_date(String member_start_date) {
		this.member_start_date = member_start_date;
	}
	public String getMember_LDAP() {
		return member_LDAP;
	}
	public void setMember_LDAP(String member_LDAP) {
		this.member_LDAP = member_LDAP;
	}
	public String getMember_role() {
		return member_role;
	}
	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}
	public String getMember_team() {
		return member_team;
	}
	public void setMember_team(String member_team) {
		this.member_team = member_team;
	}
	public String getMember_phone_number() {
		return member_phone_number;
	}
	public void setMember_phone_number(String member_phone_number) {
		this.member_phone_number = member_phone_number;
	}
	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_name=" + member_name + ", member_username="
				+ member_username + ", member_password=" + member_password + ", member_department=" + member_department
				+ ", member_local=" + member_local + ", member_start_date=" + member_start_date + ", member_LDAP="
				+ member_LDAP + ", member_role=" + member_role + ", member_team=" + member_team
				+ ", member_phone_number=" + member_phone_number + "]";
	}
	
	
	
}
