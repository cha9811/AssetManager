package com.study.chatting;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class ChattingRoomVO {

	private int room_id;
	private String room_title;
	private String room_content;
	private String room_isActive;
	private boolean room_type;
	private String room_member;
//	private ChattingRoomVO room1;
	private int unreadCount; // 읽지 않은 메시지 수를 추가
	private List<Integer> member_id; // 멤버 ID 목록으로 변경

	public void setUnreadCount(int unreadCount) {
		this.unreadCount = unreadCount;
	}

	public ChattingRoomVO() {
	}

	public int getUnreadCount() {
		return unreadCount;
	}

	public List<Integer> getMember_id() {
		return member_id;
	}

	public void setMember_id(List<Integer> member_id) {
		this.member_id = member_id;
	}

	public String getRoom_member() {
		return room_member;
	}

	public void setRoom_member(String room_member) {
		this.room_member = room_member;
	}

	public ChattingRoomVO(int room_id, String room_content, String room_isActive) {
		this.room_id = room_id;
		this.room_content = room_content;
		this.room_isActive = room_isActive;
	}

	public ChattingRoomVO(int id, String room_title, String room_content, String room_isActive, boolean room_type) {
		this.room_id = id;
		this.room_title = room_title;
		this.room_content = room_content;
		this.room_isActive = room_isActive;
		this.room_type = room_type;
	}

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}

	public String getRoom_title() {
		return room_title;
	}

	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}

	public String getRoom_content() {
		return room_content;
	}

	public void setRoom_content(String room_content) {
		this.room_content = room_content;
	}

	public String getRoom_isActive() {
		return room_isActive;
	}

	public void setRoom_isActive(String room_isActive) {
		this.room_isActive = room_isActive;
	}

	public boolean isRoom_type() {
		return room_type;
	}

	public void setRoom_type(boolean room_type) {
		this.room_type = room_type;
	}

	@Override
	public String toString() {
		return "ChattingRoomVO [room_id=" + room_id + ", room_title=" + room_title + ", room_content=" + room_content
				+ ", room_isActive=" + room_isActive + ", room_type=" + room_type + ", room_member=" + room_member
				+ ", unreadCount=" + unreadCount + "]";
	}

}
