package com.study.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	
	@Autowired
    private GenerateToken generateToken; // JWT 토큰 생성기 주입
	
	@Autowired
	private CustomUserDetailsService customUserDetailsService;
	
	 @Autowired
	    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
	        auth
	            .userDetailsService(customUserDetailsService)
	            .passwordEncoder(passwordEncoder());
	    }
	 
	 @Bean
	    public PasswordEncoder passwordEncoder() {
	        return new BCryptPasswordEncoder();
	    }
	 @Bean
	    public CustomLoginSuccessHandler customLoginSuccessHandler() {
	        return new CustomLoginSuccessHandler(generateToken);
	    }
	 @Override
	    protected void configure(HttpSecurity http) throws Exception {
	        http
	            .authorizeRequests()
	                .antMatchers("/css/**", "/js/**", "images/**", "/signUpPage","/IDcheck", "/signUp","/sendEmail","/checkNum","/createChatRoom","/addChattingRoomMember","/ExitChattingRoom","/UpdateChattingRoomInfo").permitAll() // 회원가입 관련 경로는 모두 허용
	                .antMatchers("/assetmanager/sendEmail").permitAll()  // 이 경로를 인증 없이 접근 허용
	                .antMatchers("/admin/**").hasRole("ADMIN") // ADMIN 역할을 가진 사용자만 접근 가능
	                .anyRequest().authenticated() // 나머지 요청은 모두 인증 필요
	                .and()
	            .formLogin()
	                .loginPage("/loginPage") // 로그인 페이지 경로 지정
	                .loginProcessingUrl("/login") // 로그인 처리 경로 지정
	                .usernameParameter("username")	//front에서 보내는 값을 해당 값으로 지정
	                .passwordParameter("password")
	                .successHandler(customLoginSuccessHandler()) // 로그인 성공 핸들러
                    .permitAll() // 모두에게 로그인 허용
	                .and()
	            .logout()
	                .logoutUrl("/logout") // 로그아웃 처리 경로 지정
	                .logoutSuccessUrl("/loginPage") // 로그아웃 성공 시 리다이렉트 경로 지정
	                .permitAll()
	                .and()
	            .csrf().disable(); // CSRF 보호 비활성화 (테스트 목적)
	        
	        JsonAuthenticationFilter jsonAuthenticationFilter = new JsonAuthenticationFilter();
	        jsonAuthenticationFilter.setAuthenticationManager(authenticationManagerBean());
	        jsonAuthenticationFilter.setAuthenticationSuccessHandler(customLoginSuccessHandler());
	        
	        http.addFilterBefore(jsonAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);
	    }
	 

	//	
//	 //WebSecurity 객체를 구성하여 특정 HTTP 요청에 대해 Spring Security의 보안 필터 체인을 적용하지 않도록 설정
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/CSS/**");

        // 스프링 시큐리티의 필터 연결을 설정하기 위한 오버라이딩이다.
        // 예외가 웹접근 URL를 설정한다.
        // ACL(Access Control List - 접근 제어 목록)의 예외 URL을 설정
    }
//
//    //HttpSecurity 객체를 사용하여 보다 세밀한 HTTP 보안 설정을 구성합니다. 여기서는 URL 별 접근 권한, 로그인 및 로그아웃 처리 등을 설정할 수 있습니다.
    //리소스권한설정

//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        // 사용자 세부 서비스를 설정하기 위한 오버라이딩이다.
//        super.configure(auth);
//    }
}