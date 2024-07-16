package com.study.chatting;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChattingMessageService {
	

	@Autowired
	ChattingMessageDAOImpl chattingMessageDAOImpl;
	
	public void chattingMessageMake(ChattingMessageVO messageVO) {
		chattingMessageDAOImpl.chattingMessageMake(messageVO);		
	}
	
	public List<ChattingMessageVO> GetChattingMessage(int roomid) {
        List<ChattingMessageVO> messages = chattingMessageDAOImpl.chattingMessageAll(roomid);
        SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 원본 날짜 형식
        SimpleDateFormat targetFormat = new SimpleDateFormat("HH:mm"); // 변환하고자 하는 날짜 형식
        
        for (ChattingMessageVO message : messages) {
			try {
	        	Date date = originalFormat.parse(message.getChatting_create_time());
	             String formattedTime = targetFormat.format(date); // "HH:mm" 형식으로 날짜 포매팅
	             message.setChatting_create_time(formattedTime); 
			} catch (ParseException e) {
				e.printStackTrace();
			}
        }
		return messages;		
	}
	
	 public Date parseStringToDate(String dateString) {
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        try {
	            return formatter.parse(dateString);
	        } catch (ParseException e) {
	            e.printStackTrace();
	            return null; // 오류 처리: 파싱 실패 시 null 반환
	        }
	    }
}
