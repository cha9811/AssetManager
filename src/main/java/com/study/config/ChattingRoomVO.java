package com.study.config;


public class ChattingRoomVO {
    
	private int Room_id;
	private String Room_content;
    private String Room_title;
    private String Room_isActive;
    private String Room_type;
    private String Room_member;
    
	public String getRoom_member() {
		return Room_member;
	}
	public void setRoom_member(String room_member) {
		Room_member = room_member;
	}
	public int getRoom_id() {
		return Room_id;
	}
	public void setRoom_id(int room_id) {
		Room_id = room_id;
	}
	public String getRoom_content() {
		return Room_content;
	}
	public void setRoom_content(String room_content) {
		Room_content = room_content;
	}
	public String getRoom_title() {
		return Room_title;
	}
	public void setRoom_title(String room_title) {
		Room_title = room_title;
	}
	public String getRoom_isActive() {
		return Room_isActive;
	}
	public void setRoom_isActive(String room_isActive) {
		Room_isActive = room_isActive;
	}
	public String getRoom_type() {
		return Room_type;
	}
	public void setRoom_type(String room_type) {
		Room_type = room_type;
	}
	@Override
	public String toString() {
		return "ChattingRoomVO [Room_id=" + Room_id + ", Room_content=" + Room_content + ", Room_title=" + Room_title
				+ ", Room_isActive=" + Room_isActive + ", Room_type=" + Room_type + ", Room_member=" + Room_member
				+ "]";
	}
	
    
    


	
	
}
