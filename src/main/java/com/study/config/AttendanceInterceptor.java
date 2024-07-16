package com.study.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.study.member.MemberService;
import com.study.member.MemberVO;
import com.study.security.CustomUserDetails;

@Component
public class AttendanceInterceptor implements HandlerInterceptor {
	@Autowired
	MemberService memberService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null && auth.getPrincipal() instanceof CustomUserDetails) {
			CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();

			MemberVO memberInfo = new MemberVO();
			int userId = userDetails.getUserId();
			memberInfo = memberService.getMemberByID(Integer.toString(userId));
			int memberAttendance = memberInfo.getMember_attendance();			
			request.setAttribute("memberAttendance", memberAttendance);
		}
		return true;
	}
	
}