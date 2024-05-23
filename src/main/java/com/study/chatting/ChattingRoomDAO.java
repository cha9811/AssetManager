package com.study.chatting;

import java.util.List;
import java.util.Map;

public interface ChattingRoomDAO {

	
//	public int chattingRoomUpdate(int id);
	public int chattingRoomDelete(int id);
	public int chattingRoomDeleteRollBack(int id);
	public List<ChattingRoomDTO> chattingRoomAll();
	public List<ChattingRoomDTO> GetchattingRoomInfo(int id);
	public int chattingRoomContentUpdate(ChattingRoomVO chattingroominfo);
	public int countUnreadMessages(String memberId, int roomId);
	public List<ChattingRoomVO> getChattingRoomsByMemberId(int memberId);
	public void updateLastAccessTime(int member_Id, int room_Id);
	public int chattingRoomAddMember(Map<String, Object> params);
	public int countUnreadMessages(int memberId, int chatting_room_id);
	public int chattingRoomMake(ChattingRoomVO room);
	public int chattingRoomAddMember(ChattingRoomDTO params);
	public void exitChattingRoom(String member_id, int room_id);
	public int chattingRoomTitleUpdate(String room_title, int room_id);
}
