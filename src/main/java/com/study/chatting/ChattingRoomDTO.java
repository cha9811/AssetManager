package com.study.chatting;

import java.util.List;

public class ChattingRoomDTO {
    
	private int room_id;
	private String room_title;
	private String room_content;
    private String room_isActive;
    private boolean room_type;
//	private List<Integer> member_id; // 멤버 ID 목록으로 변경
	private int member_id; // 멤버 ID 목록으로 변경
	private String member_username;
    public String getMember_username() {
		return member_username;
	}


	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}


	private ChattingRoomVO room1;
    private int unreadCount;  // 읽지 않은 메시지 수를 추가

    public int getUnreadCount() {
		return unreadCount;
	}


    public ChattingRoomVO getRoom() {
		return room1;
	}


	public void setRoom(ChattingRoomVO room) {
		this.room1 = room;
	}


	public ChattingRoomDTO(ChattingRoomVO room, int unreadCount) {
        this.room1 = room;
        this.unreadCount = unreadCount;
    }

	public void setUnreadCount(int unreadCount) {
		this.unreadCount = unreadCount;
	}



    public ChattingRoomDTO() {
    }
    
//    public ChattingRoomDTO(int id, String room_title, String room_content, String room_isActive, boolean room_type, List<Integer> member_id) {
//        this.room_id = id;
//        this.room_title = room_title;
//        this.room_content = room_content;
//        this.room_isActive = room_isActive;
//        this.room_type = room_type;
//        this.member_id = member_id;
//    }

    public ChattingRoomDTO(int id, String room_title, String room_content, String room_isActive, boolean room_type, int member_id) {
        this.room_id = id;
        this.room_title = room_title;
        this.room_content = room_content;
        this.room_isActive = room_isActive;
        this.room_type = room_type;
        this.member_id = member_id;
    }

	public ChattingRoomDTO(int roomId, int memberId) {
		// TODO Auto-generated constructor stub
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

//	  public List<Integer> getMember_id() {
//	        return member_id;
//	    }
//
//	    public void setMember_id(List<Integer> member_id) {
//	        this.member_id = member_id;
//	    }


		@Override
		public String toString() {
			return "ChattingRoomDTO [room_id=" + room_id + ", room_title=" + room_title + ", room_content="
					+ room_content + ", room_isActive=" + room_isActive + ", room_type=" + room_type + ", member_id="
					+ member_id + ", room1=" + room1 + ", unreadCount=" + unreadCount + "]";
		}


		public int getMember_id() {
			return member_id;
		}


		public void setMember_id(int member_id) {
			this.member_id = member_id;
		}
	
	    
	    
}


