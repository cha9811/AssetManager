package com.study.chatting;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChattingRoomService {

	@Autowired
	ChattingRoomDAOImpl chattingRoomDAOImpl;

	public void cahttingRoomupDelete(int id) {
		chattingRoomDAOImpl.chattingRoomDelete(id);
	}


	// 특정 유저 채팅방 보기 목적
	public List<ChattingRoomVO> cahttingRoomupList(int member_id) {
		 List<ChattingRoomVO> roomlist = chattingRoomDAOImpl.getChattingRoomsByMemberId(member_id); // 모든 채팅방 정보를 가져옴

		 for (ChattingRoomVO room : roomlist) {
		        int unreadCount = chattingRoomDAOImpl.countUnreadMessages(member_id,room.getRoom_id());
		        System.out.println("member_id"+"unreadCount 메세지 숫자"+unreadCount);
		        room.setUnreadCount(unreadCount); // 읽지 않은 메시지 수 설정
		    }
		    return roomlist;

	}

	

	public List<ChattingRoomDTO> cahttingRoomupInfo(int id) {
		List<ChattingRoomDTO> roomInfo = chattingRoomDAOImpl.GetchattingRoomInfo(id);
		return roomInfo;
	}

	public void cahttingRoomContentUpdate(ChattingRoomVO chattingroominfo) {
		chattingRoomDAOImpl.chattingRoomContentUpdate(chattingroominfo);
	}

	public int cahttingRoomMake(ChattingRoomVO room) {
		chattingRoomDAOImpl.chattingRoomMake(room);
		
	    return room.getRoom_id();
	}

	public int countUnreadMessages(int memberId, int roomId) {
		return chattingRoomDAOImpl.countUnreadMessages(memberId, roomId);
	}
	
	public void updateLastAccessTime(int member_Id, int room_Id) {
		chattingRoomDAOImpl.updateLastAccessTime(member_Id, room_Id);
	}
	public List<Integer> countUnreadMessagesForMultipleRooms(List<Integer> roomIds, int memberId) {
		List<Integer> unreadCounts = new ArrayList<>();
		for (Integer roomId : roomIds) {
			
			int count = countUnreadMessages(memberId, roomId);
			unreadCounts.add(count);
		}
		return unreadCounts;
	}

	public void chattingRoomAddMember(Map<String, Object> params) {
		int roomId = (int) params.get("chatting_room_id");
        Object memberIdsObj = params.get("memberIds");

        List<Integer> memberIds = new ArrayList<>();
        if (memberIdsObj instanceof List) {
            memberIds = (List<Integer>) memberIdsObj;
        } else if (memberIdsObj instanceof Integer) {
            memberIds.add((Integer) memberIdsObj);
        } else {
            throw new IllegalArgumentException("Invalid memberIds type");
        }
        
        for (int memberId : memberIds) {
            Map<String, Object> newParams = new HashMap<>();
            newParams.put("chatting_room_id", roomId);
            newParams.put("memberId", memberId);  // 단일 memberId로 변경

            chattingRoomDAOImpl.chattingRoomAddMember(newParams);
        }

	}

	public void exitChattingRoom(String member_id, int room_id) {
        chattingRoomDAOImpl.exitChattingRoom(member_id,room_id);
	}
	
	public void UpdateChattingRoom(String room_title, int room_id) {
        chattingRoomDAOImpl.chattingRoomTitleUpdate(room_title,room_id);
	}
	
	
}
