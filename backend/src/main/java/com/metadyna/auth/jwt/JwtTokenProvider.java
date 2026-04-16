package com.metadyna.auth.jwt;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.metadyna.auth.model.JwtClaims;
import com.metadyna.config.AppProperties;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Slf4j
@Component
@RequiredArgsConstructor
public class JwtTokenProvider {

    private final AppProperties appProperties;
    private final ObjectMapper objectMapper;

    public String generateToken(JwtClaims claims) {
        long expiryMs = (long) appProperties.getJwt().getExpiryMinutes() * 60 * 10000;

        return Jwts.builder()
                .subject(claims.getUsername())
                .claim("tenantId", claims.getTenantId())
                .claim("roles", claims.getRoles())
                .claim("privileges", objectMapper.convertValue(claims.getPrivileges(), List.class))
                .issuedAt(new Date())
                .expiration(new Date(System.currentTimeMillis() + expiryMs))
                .signWith(getSigningKey())
                .compact();
    }

    public JwtClaims validateAndParse(String token) {
        Claims body = Jwts.parser()
                .verifyWith(getSigningKey())
                .build()
                .parseSignedClaims(token)
                .getPayload();

        List<String> roles = body.get("roles", List.class);
        List<Map<String, Object>> rawPrivileges = body.get("privileges", List.class);

        List<JwtClaims.Privilege> privileges = rawPrivileges == null ? List.of() :
                rawPrivileges.stream()
                        .map(p -> JwtClaims.Privilege.builder()
                                .moduleId((String) p.get("moduleId"))
                                .read(Boolean.TRUE.equals(p.get("read")))
                                .write(Boolean.TRUE.equals(p.get("write")))
                                .build())
                        .toList();

        return JwtClaims.builder()
                .username(body.getSubject())
                .tenantId(body.get("tenantId", String.class))
                .roles(roles == null ? List.of() : roles)
                .privileges(privileges)
                .build();
    }

    public boolean isValid(String token) {
        try {
            validateAndParse(token);
            return true;
        } catch (JwtException | IllegalArgumentException e) {
            log.debug("Invalid JWT token: {}", e.getMessage());
            return false;
        }
    }

    private SecretKey getSigningKey() {
        byte[] keyBytes = appProperties.getJwt().getSecret()
                .getBytes(StandardCharsets.UTF_8);
        return Keys.hmacShaKeyFor(keyBytes);
    }
}
