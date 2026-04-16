package com.metadyna;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class MetaDynaApplication {

    public static void main(String[] args) {
        SpringApplication.run(MetaDynaApplication.class, args);
    }
}
