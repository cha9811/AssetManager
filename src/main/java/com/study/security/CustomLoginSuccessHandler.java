package com.study.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

//로그인 성공시 권한별 페이지로 이동됨
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	private GenerateToken generateToken;
	
	public CustomLoginSuccessHandler(GenerateToken generateToken) {
        this.generateToken = generateToken;
    }
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {

		
		String token = generateToken.generateTokens(auth); // 가정: generateTokens는 토큰 생성 메서드
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().print("{\"auth_token\": \"" + token + "\"}");
        response.getWriter().flush();
        System.out.println(token);
        System.out.println(response);
//        session.setAttribute("AUTH_TOKEN", token);

//		response.sendRedirect("home");
		
	}
}
