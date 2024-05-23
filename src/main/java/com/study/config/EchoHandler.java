package com.study.config;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class EchoHandler extends TextWebSocketHandler {

    private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessions.add(session);
        logger.info("Socket 연결: {}", session.getId());
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String docId = message.getPayload();
        String alertMessage = "누군가 문서 ID " + docId + "를 수정하고 있습니다.";

        for(WebSocketSession singleSession : sessions) {
            if(!singleSession.equals(session)) {
                singleSession.sendMessage(new TextMessage(alertMessage));
            }
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session);
        logger.info("Socket 끊김: {}", session.getId());
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        logger.error("WebSocket 에러: {}", session.getId(), exception);
    }
}