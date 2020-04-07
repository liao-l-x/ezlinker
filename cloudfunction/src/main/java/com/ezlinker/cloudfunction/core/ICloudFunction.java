package com.ezlinker.cloudfunction.core;

/**
 * 云函数接口
 */
public interface ICloudFunction {
    CloudFunctionResult get(String queryString);

    CloudFunctionResult post(CloudRequestBody cloudRequestBody);
}
