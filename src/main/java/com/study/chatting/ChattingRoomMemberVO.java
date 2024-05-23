package com.study.chatting;


public class ChattingRoomMemberVO {
   	    private int roomId;
	    private int memberId;
		public int getRoomId() {
			return roomId;
		}
		public void setRoomId(int roomId) {
			this.roomId = roomId;
		}
		public int getMemberId() {
			return memberId;
		}
		public void setMemberId(int memberId) {
			this.memberId = memberId;
		}
		@Override
		public String toString() {
			return "ChattingRoomMemberVO [roomId=" + roomId + ", memberId=" + memberId + "]";
		}
	
	
}
