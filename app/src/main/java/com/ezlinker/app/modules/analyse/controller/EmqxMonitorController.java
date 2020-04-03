package com.ezlinker.app.modules.analyse.controller;

import com.ezlinker.app.common.web.CurdController;
import com.ezlinker.app.modules.systemconfig.model.EmqxConfig;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * ezlinker
 *
 * @author wangwenhai
 * @description EMQX监控器
 * @create 2019-12-17 22:06
 **/
@RestController
@RequestMapping("/monitor/emqx")
public class EmqxMonitorController extends CurdController<EmqxConfig> {
    public EmqxMonitorController(HttpServletRequest httpServletRequest) {
        super(httpServletRequest);
    }

}
