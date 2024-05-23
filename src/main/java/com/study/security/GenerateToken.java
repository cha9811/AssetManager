package com.study.security;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;


@Component
//@PropertySource("classpath:jwt_Secret.properties")
public class GenerateToken {

	@Autowired
	private CustomUserDetailsService customUserDetailsService;
	
//    @Value("${jwt.secret}")
//    String SECRET;
	
    String SECRET = "eyJhbGciOiJIUzI1NiJ9.eyJSb2xlIjoiQWRtaW4iLCJJc3N1ZXIiOiJJc3N1ZXIiLCJVc2VybmFtZSI6IkphdmFJblVzZSIsImV4cCI6MTcxMTg3MjEzMywiaWF0IjoxNzExODcyMTMzfQ.i3eU6 nej3ZSI5LiPVT27dNnIWoy4CqAfBHbu0ZR9qY4\r\n";
    
    // 토큰에서 인증 정보를 얻어오는 메소드
    public Authentication getAuthentication(String token) {
    	System.out.println("토큰생성코드의 인증정보얻어오기 "+token);
        UserDetails userDetails = customUserDetailsService.loadUserByUsername(getUsername(token)); // 토큰에서 사용자명 추출 후 UserDetails 조회
        System.out.println("토큰생성코드의 userdetails얻어오기 "+userDetails);
        return new UsernamePasswordAuthenticationToken(userDetails, "", userDetails.getAuthorities());
    }
    
    // 토큰 생성 코드
    // loginsuccess에서 사용
	public String generateTokens(Authentication authentication) {
        final long EXPIRATION_TIME = 864_000_00; // 1 day in milliseconds
        System.out.println("토큰생성코드의 토큰 생성하기");

        String token = Jwts.builder()
                .setSubject(authentication.getName())
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .signWith(SignatureAlgorithm.HS512, SECRET)
                .compact();
        return token;
    }
	
	private String getUsername(String token) {
		System.out.println("토큰생성코드의 getusername의 토큰값 : 	"+token);
	    return Jwts.parser().setSigningKey(SECRET).parseClaimsJws(token).getBody().getSubject();
	}
	
	// 토큰의 유효성을 검증하는 메소드
    public boolean validateToken(String token) throws Exception {
        try {
            Jwts.parser().setSigningKey(SECRET).parseClaimsJws(token);
            return true;
        } catch (JwtException | IllegalArgumentException e) {
            // 토큰 유효성 검증 실패 처리
            throw new Exception("Expired or invalid JWT token");
        }
    }
}