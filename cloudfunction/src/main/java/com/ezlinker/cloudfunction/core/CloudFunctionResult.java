package com.ezlinker.cloudfunction.core;

/**
 * Java 调用LUA 以后的统一返回结果
 */
public class CloudFunctionResult {
    private int code;
    private String message;

    public CloudFunctionResult(int code, String message) {
        this.code = code;
        this.message = message;
    }

    @Override
    public String toString() {
        return "CloudFunctionResult{code=" + code + ", message='" + message + '\'' + '}';
    }
}
