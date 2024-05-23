package com.study.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.study.member.MemberDAOImpl;
import com.study.member.MemberVO;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberDAOImpl memberDAOimpl;


	@Override
	public UserDetails loadUserByUsername(String member_name) throws UsernameNotFoundException {
		System.out.println("멤버이름 :" + member_name);
		MemberVO member = memberDAOimpl.memberLogin(member_name);

		if (member == null) {
			throw new UsernameNotFoundException("User not found");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority("ROLE_" + member.getMember_role()));

		CustomUserDetails userDetails = new CustomUserDetails(member.getMember_name(), member.getMember_password(),
				authorities, member.getMember_id(), member.getMember_role(), member.getMember_username(),member.getMember_attendance());

		Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null,
				userDetails.getAuthorities());

		SecurityContextHolder.getContext().setAuthentication(authentication);
		return userDetails;
	}

}
