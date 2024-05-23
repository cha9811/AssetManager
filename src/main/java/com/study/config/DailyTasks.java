package com.study.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Description;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.study.member.MemberDAOImpl;

@Description("스케쥴 작업 코드")
@EnableScheduling
public class DailyTasks {
	
	@Autowired
    MemberDAOImpl memberDAOImpl;
	
	@Scheduled(cron = "5 * 06 * * *") // 5초마다 실행
	public void resetMemberAttendance() {
		memberDAOImpl.resetMemberStatus();
		System.out.println("근무상황 초기화");
	}
}
