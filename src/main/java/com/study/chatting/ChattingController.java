package com.study.chatting;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Description;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.HtmlUtils;

import com.study.member.MemberDAOImpl;
import com.study.member.MemberVO;
import com.study.security.CustomUserDetails;

@Controller
public class ChattingController {

	@Autowired
	ChattingRoomService chattingRoomService;

	@Autowired
	MemberDAOImpl memberDAOImpl;

	@Autowired
	ChattingMessageService chattingMessageService;

	@Autowired
	private SimpMessagingTemplate template;

	@Description("채팅홈페이지 접속")
	@RequestMapping("/chattingHomePage")
	public String websocketPage(Model model, Principal principal) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();

		int member_id = userDetails.getUserId();
		List<ChattingRoomVO> roomlist = chattingRoomService.cahttingRoomupList(member_id);
		List<MemberVO> memberlist = memberDAOImpl.getMemberlist(member_id);

		model.addAttribute("memberlist", memberlist);
		model.addAttribute("roomlist", roomlist);
		return "chatting/chattingHomePage";
	}

	@Description("방 나가기")
	@RequestMapping(value = "//exitRoom", method = RequestMethod.POST)
	public ResponseEntity<String> ExitChattingRoom(@RequestBody Map<String, Object> payload) {

		Integer roomId = null;
		String memberId = null;
		try {
			roomId = Integer.valueOf(payload.get("roomId").toString());
			memberId = (String) payload.get("memberId");
		} catch (NumberFormatException | NullPointerException e) {
			System.out.println("Error parsing payload: " + e.getMessage());
			throw new IllegalArgumentException("Invalid roomId or memberId");
		}


		chattingRoomService.exitChattingRoom(memberId, roomId);
		return ResponseEntity.ok("/chattingHomePage");

	}

	@Description("채팅방 접속")
	@RequestMapping("/chatting/{id}")
	public String chattingroom(@PathVariable("id") String id, Model model, Principal principal) {
		Authentication auth = (Authentication) principal;
		CustomUserDetails UserInfo = (CustomUserDetails) auth.getPrincipal();
		int member_id = UserInfo.getUserId();
		int username = UserInfo.getUserId();
		int roomId = Integer.parseInt(id);

		chattingRoomService.updateLastAccessTime(username, roomId);

		List<ChattingRoomDTO> roomInfo = chattingRoomService.cahttingRoomupInfo(roomId);

		List<MemberVO> memberlist = memberDAOImpl.getMemberlist(member_id);

		List<Integer> existingMemberIds = roomInfo.stream().map(ChattingRoomDTO::getMember_id)
				.collect(Collectors.toList());
		List<MemberVO> filteredMemberList = memberlist.stream()
				.filter(member -> !existingMemberIds.contains(member.getMember_id())).collect(Collectors.toList());

		model.addAttribute("memberlist", filteredMemberList);
		model.addAttribute("roomInfo", roomInfo);

		List<ChattingMessageVO> messageList = chattingMessageService.GetChattingMessage(roomId);
		model.addAttribute("messageList", messageList);
		model.addAttribute("username", username);

		return "chatting/chattingPage";
	}

	@Description("채팅방 생성")
	@RequestMapping("/createChatRoom")
	public ResponseEntity<?> createChatRoom(@RequestBody ChattingRoomVO room, Principal principal) {
		chattingRoomService.cahttingRoomMake(room);

		Map<String, Object> response = new HashMap<>();
		response.put("message", "Chat room created successfully with members: " + room.getMember_id());
		response.put("status", "success");
		int roomId = room.getRoom_id(); // 생성된 room_id 추출

		Authentication auth = (Authentication) principal;
		CustomUserDetails UserInfo = (CustomUserDetails) auth.getPrincipal();
		int currentUserId = UserInfo.getUserId();

		List<Integer> memberIds = room.getMember_id(); // 멤버 ID 목록 추출
		memberIds.add(currentUserId);
		Map<String, Object> params = new HashMap<>();

		params.put("chatting_room_id", roomId);
		params.put("memberIds", memberIds); // 모든 멤버 ID 목록을 맵에 추가

		chattingRoomService.chattingRoomAddMember(params);

		return ResponseEntity.ok().body(response);

	}

	@Description("채팅방에 member 추가하는 코드")
	@PostMapping("/addChattingRoomMember")
	public ResponseEntity<?> addChattingRoomMember(@RequestBody Map<String, Object> params) {
		chattingRoomService.chattingRoomAddMember(params);
		return ResponseEntity.ok("Members invited successfully.");
	}

	@Description("채팅방 메세지 전송")
	@MessageMapping("/rooms/{roomId}/sendMessage") // 클라이언트에서 보낸 메시지를 받을 경로
	public ChattingMessageVO sendMessage(@DestinationVariable String roomId, ChattingMessageVO message,
			Principal principal) {
		int userId = 500;
		String username = "유저";
		int roomid = Integer.parseInt(roomId);
		if (principal instanceof Authentication) {
			Authentication auth = (Authentication) principal;
			Object userDetailsObject = auth.getPrincipal();
			CustomUserDetails UserInfo = (CustomUserDetails) auth.getPrincipal();
			if (userDetailsObject instanceof CustomUserDetails) {
				CustomUserDetails userDetails = (CustomUserDetails) userDetailsObject;
				userId = userDetails.getUserId();
				username = UserInfo.getMember_username();
			} else {
				System.out.println("Principal's actual object is not of CustomUserDetails type.");
			}
		} else {
			System.out.println("Principal is not an instance of Authentication.");
		}
		message.setChatting_member_id(userId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String formattedDate = sdf.format(new Date());

		message.setChatting_create_time(formattedDate);

		String escapedContent = HtmlUtils.htmlEscape(message.getChatting_content());
		message.setChatting_content(escapedContent);

		message.setChatting_room_id(roomid);
		message.setChatting_member_name(username);
		chattingMessageService.chattingMessageMake(message);

		ChattingRoomVO chattingRoomInfo = new ChattingRoomVO();
		chattingRoomInfo.setRoom_content(message.getChatting_content());
		chattingRoomInfo.setRoom_id(roomid);
		chattingRoomInfo.setRoom_isActive(formattedDate);
		chattingRoomService.cahttingRoomContentUpdate(chattingRoomInfo);
		int room_id = Integer.parseInt(roomId);
		template.convertAndSend("/topic/rooms/" + room_id, message);
		template.convertAndSend("/topic/room-updates",
				new ChattingRoomVO(room_id, message.getChatting_content(), message.getChatting_create_time()));
		return message;
	}

	@Description("채팅방 정보 업데이트")
	@RequestMapping("//UpdateChattingRoomInfo")
	public ResponseEntity<String> updateChattingRoomInfo(@RequestBody Map<String, Object> payload) {
		Integer roomId = null;
        String roomTitle = null;
        try {
            roomId = Integer.valueOf(payload.get("roomId").toString());
            roomTitle = payload.get("roomTitle").toString();
        } catch (NumberFormatException | NullPointerException e) {
            return ResponseEntity.badRequest().body("Invalid roomId or roomTitle");
        }
        chattingRoomService.UpdateChattingRoom(roomTitle,roomId);
        return ResponseEntity.ok("s");
	}

}
