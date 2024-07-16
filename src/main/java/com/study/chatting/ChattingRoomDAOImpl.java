package com.study.chatting;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChattingRoomDAOImpl implements ChattingRoomDAO {

	@Autowired
	SqlSessionTemplate chattingroomSST;

	@Override
	public int chattingRoomMake(ChattingRoomVO room) {
		chattingroomSST.insert("CHATTING_ROOM.CREATE_CHATTING_ROOM", room);
		return room.getRoom_id();
	}

	@Override
	public int chattingRoomAddMember(ChattingRoomDTO roomInfo) {
		return chattingroomSST.insert("CHATTING_ROOM.ADD_MEMBER_BY_CHATTING_ROOM", roomInfo);
	}

	@Override
	public int chattingRoomDelete(int id) {
		return chattingroomSST.update("CHATTING_ROOM.SOFT_DELETE_CHATTING_ROOM", id);
	}

	@Override
	public List<ChattingRoomDTO> chattingRoomAll() {
		return chattingroomSST.selectList("CHATTING_ROOM.GET_CHATTING_ROOM");
	}

	@Override
	public List<ChattingRoomVO> getChattingRoomsByMemberId(int memberId) {
		return chattingroomSST.selectList("CHATTING_ROOM.GET_CHATTING_ROOM_BY_MEMBER", memberId);
	}

	@Override
	public int chattingRoomDeleteRollBack(int id) {
		return chattingroomSST.update("CHATTING_ROOM.SOFT_DELETE_ROOLBACK_CHATTING_ROOM", id);
	}

	@Override
	public List<ChattingRoomDTO> GetchattingRoomInfo(int id) {
		return chattingroomSST.selectList("CHATTING_ROOM.GET_CHATTING_ROOM_INFO_BY_ID", id);
	}

	@Override
	public int chattingRoomContentUpdate(ChattingRoomVO chattingroominfo) {
		return chattingroomSST.update("CHATTING_ROOM.UPDATE_CHATTING_ROOM_BY_CONTENT", chattingroominfo);
	}
	
	@Override
	public int chattingRoomTitleUpdate(String room_title, int room_id) {
		Map<String, Object> params = new HashMap<>();
	    params.put("room_title", room_title); // 키를 "room_title"로 설정
		params.put("room_id", room_id); // 키를 "room_id"로 설정
		return chattingroomSST.update("CHATTING_ROOM.UPDATE_CHATTING_ROOM_BY_TITLE", params);
	}
	
	@Override
	public int countUnreadMessages(int member_id, int chatting_room_id) {
		Map<String, Object> params = new HashMap<>();
		params.put("chatting_room_id", chatting_room_id);
		params.put("member_id", member_id);
		int unreadCount = chattingroomSST.selectOne("CHATTING_ROOM.COUNT_UNREAD_MESSAGE", params);
		return unreadCount;
	}

	@Override
	public void updateLastAccessTime(int member_id, int room_Id) {
		Map<String, Object> params = new HashMap<>();
		params.put("member_id", member_id);
		params.put("chattingRoomId", room_Id);
		chattingroomSST.update("CHATTING_ROOM.UPDATE_LAST_ACCESS_TIME", params);
	}

	@Override
	public int countUnreadMessages(String memberId, int roomId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int chattingRoomAddMember(Map<String, Object> params) {
		return chattingroomSST.insert("CHATTING_ROOM.ADD_MEMBER_BY_CHATTING_ROOM", params);
	}

	@Override
	public void exitChattingRoom(String member_id, int room_id) {
		Map<String, Object> params = new HashMap<>();
		params.put("chatting_room_id", room_id);
		params.put("member_id", member_id);
		chattingroomSST.delete("CHATTING_ROOM.DELETE_MEMBER_BY_CHATTING_ROOM", params);
	}

	public void UpdateChattingRoom(String room_title, int room_id) {
		// TODO Auto-generated method stub
		
	}


}
