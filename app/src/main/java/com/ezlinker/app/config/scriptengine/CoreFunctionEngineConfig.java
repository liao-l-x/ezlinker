package com.ezlinker.app.config.scriptengine;

import com.ezlinker.cloudfunction.core.CoreFunctionEngine;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * LUA脚本执行引擎
 */
@Configuration
public class CoreFunctionEngineConfig {
    @Bean
    public CoreFunctionEngine coreFunctionEngine() {
        return new CoreFunctionEngine();
    }
}
