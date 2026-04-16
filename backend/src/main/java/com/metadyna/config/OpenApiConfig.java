package com.metadyna.config;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {

    private static final String BEARER_SCHEME = "bearerAuth";
    private static final String TENANT_HEADER = "X-Tenant-ID";

    @Bean
    public OpenAPI openAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("MetaDyna API")
                        .description("Metadata-driven multi-tenant backend framework")
                        .version("1.0.0"))
                .addSecurityItem(new SecurityRequirement().addList(BEARER_SCHEME))
                .components(new Components()
                        .addSecuritySchemes(BEARER_SCHEME, new SecurityScheme()
                                .name(BEARER_SCHEME)
                                .type(SecurityScheme.Type.HTTP)
                                .scheme("bearer")
                                .bearerFormat("JWT"))
                        .addParameters(TENANT_HEADER, new io.swagger.v3.oas.models.parameters.HeaderParameter()
                                .name(TENANT_HEADER)
                                .description("Tenant identifier")
                                .schema(new io.swagger.v3.oas.models.media.Schema<String>()._default("DEV_TENANT"))));
    }
}
