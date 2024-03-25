package com.study.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
    private MemberDAOImpl memberDAOimpl; 

	private BCryptPasswordEncoder encoder;
	
	@Override
    public UserDetails loadUserByUsername(String member_name) throws UsernameNotFoundException {
        
		MemberVO member = memberDAOimpl.memberLogin(member_name);
        
        System.out.println("로그인 시작");
        if (member == null) {
            throw new UsernameNotFoundException("User not found");
        }

        UserDetails userDetails = User.withUsername(member.getMember_name())
                .password(member.getMember_password()) // 여기를 수정 UserDetails에 저장된 이미 인코딩된 비밀번호와 비교하여 사용자를 인증합니다
        		.roles(member.getMember_role()) // 사용자의 권한 정보 설정
            .build();
        System.out.println("로그인성공");
        return userDetails;
    }
	
	
}
