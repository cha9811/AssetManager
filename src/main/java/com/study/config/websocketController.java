package com.study.config;

import java.util.Date;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.HtmlUtils;


@Controller
public class websocketController {
	
	@RequestMapping("/websocket")
	public String singUp2() {
	    System.out.println("Ss");
	    return "websocket/websocketPage";
	}
	 
	 @MessageMapping("/hello") // 클라이언트에서 보낸 메시지를 받을 경로
	    @SendTo("/topic/greetings") // 메시지를 다시 발행할 경로
	    public ChattingRoomVO greeting(ChattingMessageVO message) throws Exception {
	        Date now = new Date();
	        System.out.println(now);
	        return new ChattingRoomVO(HtmlUtils.htmlEscape(message.getName()));
	    }
}
