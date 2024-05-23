package com.study.chatting;

import java.util.List;

public interface ChattingMessageDAO {

	
	public int chattingMessageUpdate(int id);
	public int chattingMessageDelete(int id);
	public int chattingMessageMake(ChattingMessageVO messageVO);
	public List<ChattingMessageVO> chattingMessageAll(int roomid);
//	public int countUnreadMessages(int member_id,int room_id);
	public int countUnreadMessages(String member_id, int room_id);
//	public void updateLastAccessTime(String member_Id, int room_Id);
//	public void updateLastAccessTime(int member_Id, int room_Id);
}
