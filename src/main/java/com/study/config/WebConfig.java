package com.study.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.study.member.MemberDAOImpl;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Autowired
    AttendanceInterceptor attendanceInterceptor;

    
    
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(attendanceInterceptor).addPathPatterns("/**");
    }
    

	
	
    
}