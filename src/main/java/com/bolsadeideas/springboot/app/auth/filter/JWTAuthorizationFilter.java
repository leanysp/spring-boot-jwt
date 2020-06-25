package com.bolsadeideas.springboot.app.auth.filter;

import java.io.IOException;

import javax.crypto.SecretKey;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

public class JWTAuthorizationFilter extends BasicAuthenticationFilter {

	public JWTAuthorizationFilter(AuthenticationManager authenticationManager) {
		super(authenticationManager);
	}

	@SuppressWarnings("deprecation")
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		String header = request.getHeader("Authorization");

		if (!requiresAuthentication(header)) {
			chain.doFilter(request, response);
			return;
		}
		SecretKey secretKey = Keys.secretKeyFor(SignatureAlgorithm.HS512);
		try {
			Jwts.parser().setSigningKey(secretKey).parseClaimsJwt(header.replace("Bearer ", "")).getBody();
		} catch (JwtException | IllegalArgumentException e) {

		}
	}

	protected boolean requiresAuthentication(String header) {

		if (header == null || !header.toLowerCase().startsWith("Bearer ")) {
			return false;
		}
		return true;
	}

}
