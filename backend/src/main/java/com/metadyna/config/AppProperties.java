package com.metadyna.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Getter
@Setter
@Component
@ConfigurationProperties(prefix = "app")
public class AppProperties {

    private Jwt jwt = new Jwt();
    private Cache cache = new Cache();
    private String credentialEncryptionKey = "changeme1234abcd";

    @Getter
    @Setter
    public static class Jwt {
        private String secret;
        private int expiryMinutes = 60;
    }

    @Getter
    @Setter
    public static class Cache {
        private int metadataTtlMinutes = 30;
        private int menuTtlMinutes = 60;
        private int maxSize = 500;
    }
}
