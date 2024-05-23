package com.study.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.messaging.support.MessageHeaderAccessor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.study.security.GenerateToken;

@Component
public class WebSocketSecurityConfig implements ChannelInterceptor {

	@Autowired
	private GenerateToken generateToken; // JWT 토큰 처리를 위한 컴포넌트

	@Override
	public Message<?> preSend(Message<?> message, MessageChannel channel) {
		StompHeaderAccessor accessor = StompHeaderAccessor.wrap(message);
		SecurityContext context = SecurityContextHolder.getContext();
        Authentication authentication = context.getAuthentication();
		if (StompCommand.CONNECT.equals(accessor.getCommand())) {
			String token = accessor.getFirstNativeHeader("auth_token");
			System.err.println("소켓시큐리티컨피그 토큰값 : " + token);
		}
		 StompHeaderAccessor accessor2 = StompHeaderAccessor.wrap(message);
	        accessor2.setUser(authentication);
	   System.out.println("accessor2:" + accessor2);     
	   System.out.println("accessor:" + accessor);     
		return message;
	}

	@Override
	public void postSend(Message<?> message, MessageChannel channel, boolean sent) {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterSendCompletion(Message<?> message, MessageChannel channel, boolean sent, Exception ex) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preReceive(MessageChannel channel) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Message<?> postReceive(Message<?> message, MessageChannel channel) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void afterReceiveCompletion(Message<?> message, MessageChannel channel, Exception ex) {
		// TODO Auto-generated method stub

	}

}