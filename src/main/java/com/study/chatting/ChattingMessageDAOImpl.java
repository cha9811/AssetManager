package com.study.chatting;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public class ChattingMessageDAOImpl implements ChattingMessageDAO {

	@Autowired
	SqlSessionTemplate chattingmessageSST;

	@Override
	public int chattingMessageMake(ChattingMessageVO messageVO) {
		return chattingmessageSST.insert("CHATTING_MESSAGE.MAKE_CHATTING_MESSAGE",messageVO);
	}

	@Override
	public int chattingMessageUpdate(int id) {
		return chattingmessageSST.update("CHATTING_MESSAGE.UPDATE_CHATTING_MESSAGE");
	}

	@Override	
	public int chattingMessageDelete(int id) {
		return chattingmessageSST.update("CHATTING_MESSAGE.SOFT_DELETE_CHATTING_MESSAGE");
	}

	@Override
	public List<ChattingMessageVO> chattingMessageAll(int roomid) {
//		return chattingmessageSST.selectList("CHATTING_MESSAGE.ALL_CHATTING_MESSAGE",roomid);
		 List<ChattingMessageVO> messages = chattingmessageSST.selectList("CHATTING_MESSAGE.ALL_CHATTING_MESSAGE", roomid);
		    System.out.println("Messages retrieved: " + messages);
		    return messages;
	}

	@Override
	public int countUnreadMessages(String memberId, int roomId) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("memberId", memberId);
	    params.put("roomId", roomId);
	    // MyBatis 매퍼 호출
	    return chattingmessageSST.selectOne("CHATTING_MESSAGE.COUNT_UNREAD_MESSAGE", params);
	}
	
//	@Override
//	public void updateLastAccessTime(int member_Id, int room_Id) {
//	    Map<String, Object> params = new HashMap<>();
//	    params.put("memberId", member_Id);
//	    params.put("chattingRoomId", room_Id);
//	    chattingmessageSST.update("CHATTING_MESSAGE.UPDATE_LASTE_ACCESS_TIME", params);
//	}
	

}
