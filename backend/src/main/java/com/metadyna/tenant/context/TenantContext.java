package com.metadyna.tenant.context;

import org.slf4j.MDC;

/**
 * ThreadLocal holder for the current request's tenant ID and scoped JdbcTemplate.
 * Set by TenantContextFilter at the start of each request; cleared in finally block.
 */
public final class TenantContext {

    private static final ThreadLocal<String> TENANT_ID = new ThreadLocal<>();
    private static final String MDC_KEY = "tenantId";

    private TenantContext() {}

    public static void set(String tenantId) {
        TENANT_ID.set(tenantId);
        MDC.put(MDC_KEY, tenantId);
    }

    public static String get() {
        return TENANT_ID.get();
    }

    public static void clear() {
        TENANT_ID.remove();
        MDC.remove(MDC_KEY);
    }
}
