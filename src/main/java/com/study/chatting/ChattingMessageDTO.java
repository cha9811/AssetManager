package com.study.chatting;
import java.util.Date;


public class ChattingMessageDTO {
	
	private String  chatting_create_time;
	private String formatted_create_time;
	
	 public ChattingMessageDTO(String chatting_create_time, String formatted_create_time) {
	        this.chatting_create_time = chatting_create_time;
	        this.formatted_create_time = formatted_create_time;
	    
	 }
	 
	
	public String getChatting_create_time() {
		return chatting_create_time;
	}


	public void setChatting_create_time(String chatting_create_time) {
		this.chatting_create_time = chatting_create_time;
	}


	public String getFormatted_create_time() {
		return formatted_create_time;
	}
	public void setFormatted_create_time(String formatted_create_time) {
		this.formatted_create_time = formatted_create_time;
	}
	@Override
	public String toString() {
		return "ChattingMessageDTO [chatting_create_time=" + chatting_create_time + ", formatted_create_time="
				+ formatted_create_time + "]";
	}
	


}
