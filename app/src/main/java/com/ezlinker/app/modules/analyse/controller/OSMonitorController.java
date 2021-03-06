package com.ezlinker.app.modules.analyse.controller;

import com.ezlinker.app.common.exchange.R;
import com.ezlinker.app.common.utils.OSMonitor;
import com.ezlinker.app.common.web.XController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 统计操作系统 硬件信息
 */
@RestController
@RequestMapping("/monitor/os")
public class OSMonitorController extends XController {
    public OSMonitorController(HttpServletRequest httpServletRequest) {
        super(httpServletRequest);
    }


    @GetMapping("/currentState")
    public R currentOSRunningState() {
        return data(OSMonitor.getOSInfo());
    }


    @GetMapping("/running24h")
    public R osRunning24h() {
        // 时间轴
        List<String> timeList = new ArrayList<>();
        // 数据轴
        List<Double> physicalFree = new ArrayList<>();
        List<Double> physicalTotal = new ArrayList<>();
        List<Double> physicalUse = new ArrayList<>();
        //
        Map<String, Object> result = new LinkedHashMap<>();
        result.put("time", timeList);
        result.put("physicalFree", physicalFree);
        result.put("physicalTotal", physicalTotal);
        result.put("physicalUse", physicalUse);
        return data(result);
    }


}
