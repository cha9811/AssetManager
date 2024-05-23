package com.study.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.converter.DefaultContentTypeResolver;
import org.springframework.messaging.converter.MappingJackson2MessageConverter;
import org.springframework.messaging.converter.MessageConverter;
import org.springframework.messaging.handler.invocation.HandlerMethodArgumentResolver;
import org.springframework.messaging.handler.invocation.HandlerMethodReturnValueHandler;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketTransportRegistration;

import com.fasterxml.jackson.databind.ObjectMapper;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

	@Autowired
	private WebSocketSecurityConfig webSocketSecurityConfig;


	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
//		registry.enableSimpleBroker("/topic/"); // 클라이언트가 구독할 수 있는 주소의 prefix
//		registry.setApplicationDestinationPrefixes("/app"); // 메시지를 보낼 때 사용할 prefix
		registry.setApplicationDestinationPrefixes("/app", "/anotherApp");
		registry.enableSimpleBroker("/topic", "/queue");
	}

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		System.out.println("초기화 : " + registry);
        registry.addEndpoint("/stomp-endpoint").withSockJS();
        registry.addEndpoint("/asset_status").withSockJS();
        registry.addEndpoint("/chatting-home-endpoint").withSockJS();
//        registry.addEndpoint("/ws").setAllowedOrigins("*").withSockJS();

//		registry.addEndpoint("/stomp-endpoint")
//				.addInterceptors(authHandshakeInterceptor)
//				.setAllowedOrigins("*")
//				.withSockJS();
//        registry.addEndpoint("/greeting").addInterceptors(new HttpHandshakeInterceptor()).withSockJS();

	}

	@Override
	public void configureWebSocketTransport(WebSocketTransportRegistration registry) {
		// TODO Auto-generated method stub

	}

	@Override
	public void configureClientInboundChannel(ChannelRegistration registration) {
		registration.interceptors(webSocketSecurityConfig);
	}

	@Override
	public void configureClientOutboundChannel(ChannelRegistration registration) {
		// TODO Auto-generated method stub

	}

	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
		// TODO Auto-generated method stub

	}

	@Override
	public void addReturnValueHandlers(List<HandlerMethodReturnValueHandler> returnValueHandlers) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean configureMessageConverters(List<MessageConverter> converters) {
		DefaultContentTypeResolver resolver = new DefaultContentTypeResolver();
		resolver.setDefaultMimeType(MimeTypeUtils.APPLICATION_JSON);
		MappingJackson2MessageConverter converter = new MappingJackson2MessageConverter();
		converter.setObjectMapper(new ObjectMapper());
		converter.setContentTypeResolver(resolver);
		converters.add(converter);
		return false; // 기본 컨버터를 추가하지 않음
	}

}
