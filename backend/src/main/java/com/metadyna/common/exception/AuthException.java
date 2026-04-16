package com.metadyna.common.exception;

import org.springframework.http.HttpStatus;

/**
 * Thrown when authentication fails (invalid credentials, inactive user, etc.).
 * Maps to HTTP 401 Unauthorized.
 */
public class AuthException extends AppException {

    public AuthException(String message) {
        super("UNAUTHORIZED", message, HttpStatus.UNAUTHORIZED);
    }

    public AuthException(String errorCode, String message) {
        super(errorCode, message, HttpStatus.UNAUTHORIZED);
    }
}
