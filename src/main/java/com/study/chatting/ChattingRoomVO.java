package com.study.chatting;


public class ChattingRoomVO {
	
	 private String roomName;
	 private String roomDesc;
	 private String createTime;
	 private String roomType;
	 
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRoomDesc() {
		return roomDesc;
	}
	public void setRoomDesc(String roomDesc) {
		this.roomDesc = roomDesc;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	@Override
	public String toString() {
		return "ChattingRoomVO [roomName=" + roomName + ", roomDesc=" + roomDesc + ", createTime=" + createTime
				+ ", roomType=" + roomType + "]";
	}
	    
	
}
