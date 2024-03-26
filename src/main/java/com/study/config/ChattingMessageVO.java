package com.study.config;


public class ChattingMessageVO {
	
	private int chatting_id;
	private String chatting_content;
	private String chatting_create_time;
	private String chatting_modify_time;
	private String chatting_member;
	private String chatting_hide;
	private String chatting_read_status;
	public int getChatting_id() {
		return chatting_id;
	}
	public void setChatting_id(int chatting_id) {
		this.chatting_id = chatting_id;
	}
	public String getChatting_content() {
		return chatting_content;
	}
	public void setChatting_content(String chatting_content) {
		this.chatting_content = chatting_content;
	}
	public String getChatting_create_time() {
		return chatting_create_time;
	}
	public void setChatting_create_time(String chatting_create_time) {
		this.chatting_create_time = chatting_create_time;
	}
	public String getChatting_modify_time() {
		return chatting_modify_time;
	}
	public void setChatting_modify_time(String chatting_modify_time) {
		this.chatting_modify_time = chatting_modify_time;
	}
	public String getChatting_member() {
		return chatting_member;
	}
	public void setChatting_member(String chatting_member) {
		this.chatting_member = chatting_member;
	}
	public String getChatting_hide() {
		return chatting_hide;
	}
	public void setChatting_hide(String chatting_hide) {
		this.chatting_hide = chatting_hide;
	}
	public String getChatting_read_status() {
		return chatting_read_status;
	}
	public void setChatting_read_status(String chatting_read_status) {
		this.chatting_read_status = chatting_read_status;
	}
	@Override
	public String toString() {
		return "ChattingMessageVO [chatting_id=" + chatting_id + ", chatting_content=" + chatting_content
				+ ", chatting_create_time=" + chatting_create_time + ", chatting_modify_time=" + chatting_modify_time
				+ ", chatting_member=" + chatting_member + ", chatting_hide=" + chatting_hide
				+ ", chatting_read_status=" + chatting_read_status + "]";
	}

	
	
}
