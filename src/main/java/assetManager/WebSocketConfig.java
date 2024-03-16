package assetManager;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.converter.MessageConverter;
import org.springframework.messaging.handler.invocation.HandlerMethodArgumentResolver;
import org.springframework.messaging.handler.invocation.HandlerMethodReturnValueHandler;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketTransportRegistration;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer  {

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void configureWebSocketTransport(WebSocketTransportRegistration registry) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void configureClientInboundChannel(ChannelRegistration registration) {
		// TODO Auto-generated method stub
		
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
	public boolean configureMessageConverters(List<MessageConverter> messageConverters) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		// TODO Auto-generated method stub
		
	}

//	 @Bean
//	    public PasswordEncoder passwordEncoder() {
//	        return new BCryptPasswordEncoder();
//	    }
//	
//	 //WebSecurity 객체를 구성하여 특정 HTTP 요청에 대해 Spring Security의 보안 필터 체인을 적용하지 않도록 설정
//    @Override
//    public void configure(WebSecurity web) throws Exception {
//        web.ignoring().antMatchers("/resources/CSS/**");
//
//        // 스프링 시큐리티의 필터 연결을 설정하기 위한 오버라이딩이다.
//        // 예외가 웹접근 URL를 설정한다.
//        // ACL(Access Control List - 접근 제어 목록)의 예외 URL을 설정
//    }
//
//    //HttpSecurity 객체를 사용하여 보다 세밀한 HTTP 보안 설정을 구성합니다. 여기서는 URL 별 접근 권한, 로그인 및 로그아웃 처리 등을 설정할 수 있습니다.
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        // 인터셉터로 요청을 안전하게 보호하는 방법을 설정하기 위한 오버라이딩이다.
////        super.configure(http); // 모든 url 막고있음
//    	 http
//         .authorizeRequests()
//             .antMatchers("/", "/home").permitAll()
//             .anyRequest().authenticated()
//             .and()
//         .formLogin()
//             .loginPage("/loginPage")
//             .permitAll()
//             .defaultSuccessUrl("/assetList", true) // 로그인 성공 후 리다이렉트 설정
//             .and()
//         .logout()
//             .permitAll();
//    }
////
////    @Override
////    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
////        // 사용자 세부 서비스를 설정하기 위한 오버라이딩이다.
////        super.configure(auth);
////    }
}