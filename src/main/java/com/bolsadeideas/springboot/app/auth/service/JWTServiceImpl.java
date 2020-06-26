package com.bolsadeideas.springboot.app.auth.service;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

import com.bolsadeideas.springboot.app.auth.SimpleGrantedAuthorityMixin;
import com.bolsadeideas.springboot.app.auth.filter.JWTAuthenticationFilter;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;

@Component
public class JWTServiceImpl implements IJWTService {

	@Override
	public String create(Authentication auth) throws IOException {
		String username = ((User) auth.getPrincipal()).getUsername();
		Collection<? extends GrantedAuthority> roles = auth.getAuthorities();
		Claims claims = Jwts.claims();
		claims.put("authorities", new ObjectMapper().writeValueAsString(roles));

		System.out.println("JWTAuthenticationFilter  alg " + JWTAuthenticationFilter.SECRET_KEY.getAlgorithm());
		String token = Jwts.builder().setClaims(claims).setSubject(username)
				.signWith(JWTAuthenticationFilter.SECRET_KEY).setIssuedAt(new Date())
				.setExpiration(new Date(System.currentTimeMillis() + 3600000 * 4L)).compact();
		return token;
	}

	@Override
	public boolean validate(String token) {

		try {
			getClaims(token);
			return true;
		} catch (JwtException | IllegalArgumentException e) {
			System.out.println("ERROR JWT KEY: " + e.toString());
			return false;
		}
	}

	@Override
	public Claims getClaims(String token) {
		Claims claims = Jwts.parserBuilder().setSigningKey(JWTAuthenticationFilter.SECRET_KEY).build()
				.parseClaimsJws(resolve(token)).getBody();
		return claims;
	}

	@Override
	public String getUsername(String token) {
		return getClaims(token).getSubject();
	}

	@Override
	public Collection<? extends GrantedAuthority> getRoles(String token) throws IOException {
		Object roles = getClaims(token).get("authorities");
		Collection<? extends GrantedAuthority> authorities = Arrays
				.asList(new ObjectMapper().addMixIn(SimpleGrantedAuthority.class, SimpleGrantedAuthorityMixin.class)
						.readValue(roles.toString().getBytes(), SimpleGrantedAuthority[].class));
		return authorities;
	}

	@Override
	public String resolve(String token) {
		if (token != null && token.startsWith("Bearer ")) {
			return token.replace("Bearer ", "");
		}
		return null;
	}

}
