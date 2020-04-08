package com.ezlinker.app.modules.cloudfunction.controller;


import com.ezlinker.app.common.web.CurdController;
import com.ezlinker.app.modules.cloudfunction.model.CloudFunction;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 云函数 前端控制器
 * </p>
 *
 * @author wangwenhai
 * @since 2020-04-07
 */
@RestController
@RequestMapping("/cloudFunctions")
public class CloudFunctionController extends CurdController<CloudFunction> {

    public CloudFunctionController(HttpServletRequest httpServletRequest) {
        super(httpServletRequest);
    }
}

