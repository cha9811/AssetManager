package com.study.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.jaas.AuthorityGranter;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

//로그인 성공시 권한별 페이지로 이동됨
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {

		System.out.println("Login Success");
		List<String> roleNames = new ArrayList<>();
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());

		});
		
		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("mypage");
			return;
		}
		if (roleNames.contains("ROLE_USER")) {
			response.sendRedirect("surveylist");
			return;
		}
		if (roleNames.contains("ROLE_MASTER")) {
			response.sendRedirect("notice");
			return;
		}
		response.sendRedirect("/assetlist");
	}
}
